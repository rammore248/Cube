//
//  User.swift
//  Cube
//
//  Created by XTSW-MAC-1137-2 on 10/09/24.
//

import Foundation

class User: NSObject {
    var userId: String
    var password: String
    var userPin: String

    init(userId: String, password: String, userPin: String) {
        self.userId = userId
        self.password = password
        self.userPin = userPin
    }
}
