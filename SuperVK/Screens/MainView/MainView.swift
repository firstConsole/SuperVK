//
//  MainView.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 08.01.2023.
//

import SwiftUI

struct MainView: View {
    
    @State var selectedTab: Tab = .feed
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        switch tab {
                        case .feed:
                            Feed()
                                .tag(tab)
                        case .friends:
                            Friends()
                                .tag(tab)
                        case .groups:
                            Groups()
                                .tag(tab)
                        case .message:
                            Message()
                                .tag(tab)
                        }
                    }
                }
            }
            
            VStack {
                Spacer()
                TabBar(selectedTab: $selectedTab)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
