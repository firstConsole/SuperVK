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
                Message()
                    .tabItem {
                        Label("Сообщения", systemImage: "bubble.middle.bottom")
                    }
            }
            .navigationTitle(Text("Новости"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image(systemName: "newspaper")
                        Text("Новости")
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
