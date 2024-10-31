//
//  APIManager.swift
//  Cube
//
//  Created by XTSW-MAC-1137-2 on 04/09/24.
//

import Foundation
import UIKit

class APIManager {
 
    var resourseData: [String: Any] = [:]
    
    func checkDeviceRegistrationMacID(_macID: String) {
        self.resourseData = [:]
        
        if AppPreferences.shared.isReachable {
            
            // remove any no internet message from the view
            
            UIApplication.shared.keyWindow?.viewWithTag(222)?.removeFromSuperview()
            
            //create a dictionary with MAC ID
            let dictionary1: [String: String] = ["macid": _macID]
            
            do {
               
            }
        }
    }
}
