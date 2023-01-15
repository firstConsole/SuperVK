//
//  LoginModel.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 08.01.2023.
//

import Foundation

// MARK: - Login check

extension Login {
    func checkLogin(login: String, password: String) {
        if login == "Admin" && password == "1234" {
            isSelected = true
        } else {
            isAlertShow = true
        }
    }
}

extension WebLogin {
    func checkLogin(token: String?, id: Int?) {
//        guard let token = token,
//              let id = id
//        else {
//            return
//        }
        
        if token != nil && id != nil {
            isSelected = true
        } else {
            print("Token & ID is nil")
        }
    }
}
