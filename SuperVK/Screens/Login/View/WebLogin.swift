//
//  WebLogin.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 14.01.2023.
//

import SwiftUI

struct WebLogin: View {
    
    @State var isSelected: Bool = false
    private let tokenSavedPublisher = NotificationCenter.default.publisher(for: NSNotification.Name("vkTokenSaved"))
    
    var body: some View {
        NavigationView {
            HStack {
                WebView()
                NavigationLink(destination: MainView(), isActive: $isSelected) {
                    EmptyView()
                }
            }
            .onReceive(tokenSavedPublisher) { _ in
                isSelected = true
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct WebLogin_Previews: PreviewProvider {
    static var previews: some View {
        WebLogin()
    }
}
