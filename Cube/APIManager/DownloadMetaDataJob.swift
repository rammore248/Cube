//
//  DownloadMetaDataJob.swift
//  Cube
//
//  Created by XTSW-MAC-1137-2 on 03/09/24.
//

import Foundation

// Protocol for DownloadMetaDataJobDelegate
protocol DownloadMetaDataJobDelegate: AnyObject {
    func messageSentResponseDidReceive(_ responseDict: [String: Any])
}

// Class for DownloadMetaDataJob
class DownloadMetaDataJob: NSObject, URLSessionDelegate, URLSessionDataDelegate {
    
    var downLoadEntityJobName: String?
    var downLoadResourcePath: String?
    var downloadMethodType: String?
    var statusCode: Int = 0
    
    var requestParameter: [String: Any]?
    var dataArray: [Any]?
    
    var httpMethod: String?
    weak var downLoadJobDelegate: DownloadMetaDataJobDelegate?
    
    var addTrintsAfterSomeTimeTimer: Timer?
    
    var currentSaveTrintIndex: Int = 0
    var isNewMatchFound: NSNumber = 1
    var session: URLSession?
    
    var responseData = Data()
    
    // Initializer
    init(downLoadEntityJobName: String, requestParameter: [Any], resourcePath: String, httpMethod: String, downloadMethodType: String) {
        self.downLoadEntityJobName = downLoadEntityJobName
        self.dataArray = requestParameter
        self.downLoadResourcePath = resourcePath
        self.httpMethod = httpMethod
        self.downloadMethodType = downloadMethodType
        self.isNewMatchFound = 1
    }
    
    func connection(_ connection: NSURLConnection, didReceive response: URLResponse) {
        responseData.removeAll() // Resetting the data and removing all bytes

        if let httpResponse = response as? HTTPURLResponse {
            statusCode = httpResponse.statusCode
        }
    }

    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        responseData.append(data)
    }
    func shortError(from error: NSError) -> String {
        return error.localizedDescription
    }
    func connection(_ connection: NSURLConnection, didFailWithError error: Error) {
        print("Failed \(error.localizedDescription)")
        print("\(self.downLoadEntityJobName ?? "") Entity Job -")
        
        let response: [String: String] = [
            APIConstants.RESPONSE_CODE: "-1001",
            APIConstants.RESPONSE_MESSAGE: error.localizedDescription
        ]
        
        if self.downLoadEntityJobName == APIConstants.CHECK_DEVICE_REGISTRATION {
            NotificationCenter.default.post(name: Notification.Name(APIConstants.NOTIFICATION_CHECK_DEVICE_REGISTRATION), object: response)
        } else if self.downLoadEntityJobName == APIConstants.AUTHENTICATE_API {
            NotificationCenter.default.post(name: Notification.Name(APIConstants.NOTIFICATION_AUTHENTICATE_API), object: response)
            AppPreferences.shared.showAlertView(withTitle: "Error occurred!", message: error.localizedDescription, cancelText: nil, okText: "Ok", alertTag: 1000)
        } else if self.downLoadEntityJobName == APIConstants.ACCEPT_PIN_API {
            NotificationCenter.default.post(name: Notification.Name(APIConstants.NOTIFICATION_ACCEPT_PIN_API), object: response)
            AppPreferences.shared.showAlertView(withTitle: "Error occurred!", message: error.localizedDescription, cancelText: nil, okText: "Ok", alertTag: 1000)
        } else if self.downLoadEntityJobName == APIConstants.VALIDATE_PIN_API {
            NotificationCenter.default.post(name: Notification.Name(APIConstants.NOTIFICATION_VALIDATE_PIN_API), object: response)
            AppPreferences.shared.showAlertView(withTitle: "Error occurred!", message: error.localizedDescription, cancelText: nil, okText: "Ok", alertTag: 1000)
        } else if self.downLoadEntityJobName == APIConstants.GET_APNTMNT_LIST_API {
            NotificationCenter.default.post(name: Notification.Name(APIConstants.NOTIFICATION_GET_APNTMNT_LIST), object: response)
            AppPreferences.shared.showAlertView(withTitle: "Error occurred!", message: error.localizedDescription, cancelText: nil, okText: "Ok", alertTag: 1000)
        } else if self.downLoadEntityJobName == APIConstants.UPDATE_APNTMNT_STATUS_API {
            NotificationCenter.default.post(name: Notification.Name(APIConstants.NOTIFICATION_UPDATE_APNTMNT_STATUS), object: response)
            AppPreferences.shared.showAlertView(withTitle: "Error occurred!", message: error.localizedDescription, cancelText: nil, okText: "Ok", alertTag: 1000)
        } else {
            AppPreferences.shared.showAlertView(withTitle: "Error occurred!", message: error.localizedDescription, cancelText: nil, okText: "Ok", alertTag: 1000)
        }
    }

}
