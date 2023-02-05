//
//  TabBar.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 29.01.2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case feed = "newspaper"
    case friends = "person.2.crop.square.stack"
    case groups = "person.2"
    case message = "bubble.middle.bottom"
}

struct TabBar: View {
    @Binding var selectedTab: Tab
    
    private var image: String {
        selectedTab.rawValue + ".fill"
    }
    private var tabColor: Color {
        switch selectedTab {
        case .feed:
            return .accentColor
        case .friends:
            return .purple
        case .groups:
            return .green
        case .message:
            return .indigo
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? image : tab.rawValue)
                        .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                        .foregroundColor(selectedTab == tab ? tabColor : .gray)
                        .font(.system(size: 18))
                        .onTapGesture {
                            withAnimation(.easeOut(duration: 0.25)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 55)
            .background(.thinMaterial)
            .cornerRadius(20)
            .padding(5)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(selectedTab: .constant(.friends))
    }
}
