//
//  Login.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 04.11.2022.
//

import SwiftUI

struct Login: View {
    @State var login: String = ""
    @State var password: String = ""
    @State var isSelected: Bool = false
    @State var isAlertShow: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                HStack {
                    VStack(spacing: 10) {
                        Text("Добро пожаловать")
                            .formatWelcomeText()
                        
                        Image("logo_2048_clean")
                            .resizable()
                            .frame(width: 80, height: 78)
                            .offset(y: 35)
                            .shadow(radius: 3)
                        Spacer()
                    }
                }
                
                VStack(spacing: 5) {
                    HStack {
                        Text("Логин")
                            .modifier(formatTextForLoginScreen())
                    }
                    
                    TextField("Введите номер телефона или E-mail",
                              text: $login)
                        .modifier(formatTextFieldForLoginScreen())
                        .keyboardType(.emailAddress)
                    
                    HStack(spacing: 20) {
                        Text("Пароль")
                            .modifier(formatTextForLoginScreen())
                    }
                    
                    SecureField("Введите пароль", text: $password)
                        .modifier(formatTextFieldForLoginScreen())
                    
                    Button("Войти") {
                        checkLogin(login: login, password: password)
                    }
                    .alert(Text("Ошибка логина или пароля"),
                           isPresented: $isAlertShow) {
                        Button("OK", role: .cancel) {}
                    }
                    .foregroundColor(.white)
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding()
                    .padding(.horizontal)
                    .padding(.vertical, 0)
                    .background(Color(UIColor(.accentColor)))
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .padding(20)
                    
                    NavigationLink(destination: MainView(),
                                   isActive: $isSelected) {
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
