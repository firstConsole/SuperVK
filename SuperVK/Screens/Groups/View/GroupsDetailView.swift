//
//  GroupsDetailView.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 05.02.2023.
//

import SwiftUI

struct GroupsDetailView: View {
    let group: GroupsItems
    @State private var selection: Int = 0
    
    var body: some View {
        ScrollView {
            HStack {
                if let url = group.photo200 {
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
                Text(group.name)
                    .fontWeight(.bold)
                    .font(.title2)
                    .frame(alignment: .topLeading)
                Text(group.screenName!)
                    .frame(alignment: .bottom)
                    .foregroundColor(.gray)
            }
            
            HStack {
                Picker("Данные", selection: $selection) {
                    Image(systemName: "photo.on.rectangle.angled")
                    Image(systemName: "video.square")
                    Image(systemName: "square.stack.3d.down.forward")
                }
                .pickerStyle(.segmented)
            }
        }
    }
}

//struct GroupsDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupsDetailView()
//    }
//}
