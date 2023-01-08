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

extension Login {
    func logIn() {
        let networkService = NetworkSevice()
        let urlSession = networkService.urlSession
        let options: [URLQueryItem] = [
            URLQueryItem(name: "client_id", value: "8140202"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "wall, photos, friends, groups"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "revoke", value: "0")
        ]
    }
}
