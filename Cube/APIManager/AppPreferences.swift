//
//  AppPreferences.swift
//  Cube
//
//  Created by XTSW-MAC-1137-2 on 03/09/24.
//

import Foundation
import UIKit
import SystemConfiguration
import MBProgressHUD
import Reachability

class AppPreferences: NSObject {
    
    static let shared = AppPreferences()  // Singleton instance

    weak var alertDelegate: AppPreferencesDelegate?
    
    var currentSelectedItem: Int = 0
    var isReachable: Bool = false
    var userObj: User?
    
    var hostReachability: Reachability?
    var internetReachability: Reachability?

    // MARK: - Initialization

    override init() {
        super.init()
        self.currentSelectedItem = 0
        // startReachabilityNotifier() can be called if needed
    }
    
    // MARK: - Reachability Handling

    func startReachabilityNotifier() {
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(_:)), name: .reachabilityChanged, object: nil)
        
        // Adjusting for Reachability method availability
        do {
            if let hostReachability = try? Reachability(hostname: "www.apple.com") {
                self.hostReachability = hostReachability
                self.hostReachability?.startNotifier()
                updateInterfaceWithReachability(self.hostReachability!)
            }
            
            if let internetReachability = try? Reachability.forInternetConnection() {
                self.internetReachability = internetReachability
                self.internetReachability?.startNotifier()
                updateInterfaceWithReachability(self.internetReachability!)
            }
        } catch {
            print("Failed to initialize reachability: \(error)")
        }
    }

    @objc func reachabilityChanged(_ notification: Notification) {
        guard let reachability = notification.object as? Reachability else {
            return
        }
        updateInterfaceWithReachability(reachability)
    }

    func updateInterfaceWithReachability(_ reachability: Reachability) {
        let netStatus = reachability.currentReachabilityStatus()
        var statusString = ""
        
        // Replace `==` with appropriate method or property checks
        switch netStatus {
        case .NotReachable:
            statusString = "Access Not Available"
            self.isReachable = false
        case .ReachableViaWWAN:
            statusString = "Reachable WWAN"
            self.isReachable = true
        case .ReachableViaWiFi:
            statusString = "Reachable WIFi"
            self.isReachable = true
        }
    }


    func showNoInternetMessage() {
        if !isReachable {
            showAlertView(withTitle: "No internet connection", message: "Please turn on your internet connection to access this feature", cancelText: nil, okText: "OK", alertTag: 1000)
        }
    }

    // MARK: - HUD and Alerts

    func showHud(withTitle title: String, detailText: String) {
        let hud = MBProgressHUD.showAdded(to: UIApplication.shared.keyWindow!, animated: true)
        hud.tag = 789
        hud.minSize = CGSize(width: 150, height: 100)
        hud.label.text = title
        hud.detailsLabel.text = detailText
    }

    func showAlertView(withTitle title: String, message: String, cancelText: String?, okText: String?, alertTag: Int) {
        DispatchQueue.global(qos: .default).async {
            var alertController: UIAlertController?
            DispatchQueue.main.sync {
                alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                
                if let okText = okText {
                    let okAction = UIAlertAction(title: okText, style: .default) { _ in
                        self.alertDelegate?.appPreferencesAlertButtonWithIndex(0, withAlertTag: alertTag)
                    }
                    alertController?.addAction(okAction)
                }
                
                if let cancelText = cancelText {
                    let cancelAction = UIAlertAction(title: cancelText, style: .cancel) { _ in
                        self.alertDelegate?.appPreferencesAlertButtonWithIndex(1, withAlertTag: alertTag)
                    }
                    alertController?.addAction(cancelAction)
                }

                if let rootVC = UIApplication.shared.windows.first?.rootViewController {
                    rootVC.present(alertController!, animated: true, completion: nil)
                }
            }
        }
    }

    // MARK: - Other Methods

    func addSkipBackupAttributeToItem(at url: URL) -> Bool {
        let filePath = (url.path as NSString).fileSystemRepresentation
        let attrName = "com.apple.MobileBackup"
        var attrValue: UInt8 = 1
        
        let result = setxattr(filePath, attrName, &attrValue, MemoryLayout.size(ofValue: attrValue), 0, 0)
        return result == 0
    }

    func createDatabaseReplica() {
        let destPath = NSHomeDirectory().appending("/Documents/Cube_DB_Replica.sqlite")
        let sourcePath = NSHomeDirectory().appending("/Documents/Cube_DB.sqlite")
        
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: destPath) {
            try? fileManager.copyItem(atPath: sourcePath, toPath: destPath)
        } else {
            try? fileManager.removeItem(atPath: destPath)
            try? fileManager.copyItem(atPath: sourcePath, toPath: destPath)
        }
    }
}

// MARK: - Delegate Protocol

protocol AppPreferencesDelegate: AnyObject {
    func appPreferencesAlertButtonWithIndex(_ buttonIndex: Int, withAlertTag alertTag: Int)
}
