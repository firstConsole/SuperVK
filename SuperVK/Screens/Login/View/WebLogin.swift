//
//  WebLogin.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 14.01.2023.
//

import SwiftUI

struct WebLogin: View {
    
    @State var isSelected: Bool = false
    //
    //    private let token = Session.authentification.token
    //    private let id = Session.authentification.id
    
    @StateObject private var session = Session.authentification
    
    var body: some View {
        NavigationView {
            HStack {
                WebView()
                    .onReceive(session.token.publisher) { _ in
                        isSelected = true
                    }
                
                NavigationLink(destination: MainView(),
                               isActive: $isSelected) {
                    EmptyView()
                }
            }
        }
    }
}


struct WebLogin_Previews: PreviewProvider {
    static var previews: some View {
        WebLogin()
    }
}
