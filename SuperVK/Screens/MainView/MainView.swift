//
//  MainView.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 08.01.2023.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        NavigationView {
            TabView {
                Feed()
                    .tabItem {
                        Label("Новости", systemImage: "newspaper")
                    }
                Groups()
                    .tabItem {
                        Label("Группы", systemImage: "person.2.crop.square.stack")
                    }
                Friends()
                    .tabItem {
                        Label("Друзья", systemImage: "person.2")
                    }
                Message()
                    .tabItem {
                        Label("Чаты", systemImage: "bubble.middle.bottom")
                    }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Text("VK APP SWIFTUI"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
