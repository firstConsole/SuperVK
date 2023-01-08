//
//  Extension.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 04.11.2022.
//

import SwiftUI

// MARK: - Format text for login screen

struct formatTextForLoginScreen: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding(10)
            .font(.custom("Helvetica", size: 18))
            .padding(.leading)
    }
}

// MARK: - Format textfield for login screen

struct formatTextFieldForLoginScreen: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.blue, lineWidth: 2)
            }
            .padding(.horizontal)
    }
}

// MARK: - Format for welcome text

extension Text {
    func formatWelcomeText() -> some View {
        self.foregroundColor(.white)
            .fontWeight(.medium)
            .frame(maxHeight: 40, alignment: .center)
            .font(.largeTitle)
            .padding(10)
            .background(Color.accentColor)
            .cornerRadius(10)
            .shadow(radius: 5)
            .offset(y: 30)
    }
}

// MARK: - Login check

extension Login {
    func checkLogin(login: String, password: String) {
        if login == "Admin" && password == "123" {
            isSelected = true
        } else {
            isAlertShow = true
        }
    }
}



