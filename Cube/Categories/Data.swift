//
//  Data.swift
//  Cube
//
//  Created by XTSW-MAC-1137-2 on 19/09/24.
//

import Foundation
import CommonCrypto

let kPBKDFSaltSize = 8 // Salt size in bytes for PBKDF2
let kCCKeySizeAES256 = 32 // AES256 key size in bytes
let kAlgorithmBlockSize = kCCBlockSizeAES128

extension Data {
    
    func aes256Encrypt(withKey key: String) -> Data? {
        return crypt(operation: CCOperation(kCCEncrypt), key: key)
    }
    
    func aes256Decrypt(withKey key: String) -> Data? {
        return crypt(operation: CCOperation(kCCDecrypt), key: key)
    }
    
    private func crypt(operation: CCOperation, key: String) -> Data? {
        guard key.count == kCCKeySizeAES256 else {
            print("Error: Failed to set a key, the key size is not valid.")
            return nil
        }
        
        let keyLength = kCCKeySizeAES256
        let dataLength = self.count
        let bufferSize = dataLength + kCCBlockSizeAES128
        
        var buffer = Data(count: bufferSize)
        var numberOfBytesCrypted: size_t = 0
        
        var keyBytes = [CChar](repeating: 0, count: keyLength)
        key.getCString(&keyBytes, maxLength: keyLength, encoding: .utf8)
        
        let cryptStatus = buffer.withUnsafeMutableBytes { bufferPointer in
            self.withUnsafeBytes { dataPointer in
                CCCrypt(operation,
                        CCAlgorithm(kCCAlgorithmAES),
                        CCOptions(kCCOptionPKCS7Padding),
                        keyBytes, keyLength,
                        nil,
                        dataPointer.baseAddress, dataLength,
                        bufferPointer.baseAddress, bufferSize,
                        &numberOfBytesCrypted)
            }
        }
        
        guard cryptStatus == kCCSuccess else {
            print("Error: Failed to perform encryption/decryption.")
            return nil
        }
        
        buffer.count = numberOfBytesCrypted
        return buffer
    }
    
    static func encryptedData(for data: Data, password: String, iv: inout Data?, salt: inout Data?, error: inout Error?) -> Data? {
        iv = randomData(ofLength: kCCBlockSizeAES128)
        salt = randomData(ofLength: kPBKDFSaltSize)
        
        guard let key = aesKey(for: password, salt: salt!) else {
            print("Error: Failed to generate AES key.")
            return nil
        }
        
        let bufferSize = data.count + kCCBlockSizeAES128
        var buffer = Data(count: bufferSize)
        var numberOfBytesCrypted: size_t = 0
        
        let cryptStatus = buffer.withUnsafeMutableBytes { bufferPointer in
            data.withUnsafeBytes { dataPointer in
                CCCrypt(CCOperation(kCCEncrypt),
                        CCAlgorithm(kCCAlgorithmAES),
                        CCOptions(kCCOptionPKCS7Padding),
                        key.bytes, key.count,
                        iv!.bytes,
                        dataPointer.baseAddress, data.count,
                        bufferPointer.baseAddress, bufferSize,
                        &numberOfBytesCrypted)
            }
        }
        
        if cryptStatus == kCCSuccess {
            buffer.count = numberOfBytesCrypted
        } else {
            error = NSError(domain: "net.robnapier.RNCryptManager",
                            code: Int(cryptStatus),
                            userInfo: nil)
            return nil
        }
        
        return buffer
    }
    
    static func randomData(ofLength length: Int) -> Data {
        var data = Data(count: length)
        let result = data.withUnsafeMutableBytes { pointer in
            SecRandomCopyBytes(kSecRandomDefault, length, pointer.baseAddress!)
        }
        
        assert(result == 0, "Error: Unable to generate random bytes.")
        return data
    }
    
    static func aesKey(for password: String, salt: Data) -> Data? {
        var derivedKeyBuffer = [UInt8](repeating: 0, count: kCCKeySizeAES256)
        
        let derivationResult = derivedKeyBuffer.withUnsafeMutableBytes { derivedKeyPointer in
            password.withCString { passwordPointer in
                salt.withUnsafeBytes { saltPointer in
                    CCKeyDerivationPBKDF(CCPBKDFAlgorithm(kCCPBKDF2),
                                         passwordPointer, password.utf8.count,
                                         saltPointer.baseAddress?.assumingMemoryBound(to: UInt8.self), salt.count,
                                         CCPseudoRandomAlgorithm(kCCPRFHmacAlgSHA1),
                                         10000,
                                         derivedKeyPointer.baseAddress?.assumingMemoryBound(to: UInt8.self), derivedKeyPointer.count)
                }
            }
        }
        
        guard derivationResult == kCCSuccess else {
            print("Error: Unable to create AES key for password.")
            return nil
        }
        
        // Convert the buffer to Data
        let derivedKey = Data(derivedKeyBuffer)
        return derivedKey
    }
}

private extension Data {
    var bytes: UnsafeRawPointer {
        return (self as NSData).bytes
    }
}
