//
//  FriendsDetailView.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 05.02.2023.
//

import SwiftUI

enum Selection: String, CaseIterable, Identifiable {
    case one
    case two
    case three
    
    var id: Self {
        self
    }
    
    var title: String {
        switch self {
        case .one:
            return "Фото"
        case .two:
            return "Видео"
        case .three:
            return "Друзья"
        }
    }
}

struct FriendsDetailView: View {
    
    let friends: FriendsItems
    @State private var selection: Selection = .one
    
    var body: some View {
        ScrollView {
            HStack {
                if let url = friends.photo {
                    URLImage(url: url, width: 100, height: 100)
                        .cornerRadius(50)
                        .shadow(radius: 3)
                        .padding()
                } else {
                    Image("defaultUser")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .leading)
                        .cornerRadius(20)
                        .shadow(radius: 3)
                        .padding()
                }
            }
            
            VStack {
                Text(friends.firstName)
                    .fontWeight(.bold)
                    .font(.title2)
                    .frame(alignment: .topLeading)
                Text(friends.lastName)
                    .fontWeight(.bold)
                    .font(.title2)
                    .frame(alignment: .bottom)
            }
            
            VStack {
                Picker("Данные", selection: $selection) {
                    ForEach(Selection.allCases, id: \.self) {
                        Text($0.title)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                SelectedFriendPicker(selected: selection)
            }
        }
    }
}

struct SelectedFriendPicker: View {
    var selected: Selection
    
    var body: some View {
        
        switch selected {
        case .one:
            PhotoCollectionView()
        case .two:
            EmptyView()
        case .three:
            EmptyView()
        }
    }
}
