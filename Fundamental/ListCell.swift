//
//  ListCell.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 21.01.2023.
//

import SwiftUI

struct ListCell: View{
    
    var image: URLImage?
    var name: String?
    var lastName: String?
    var description: String?
    
    var body: some View {
        HStack {
            if image != nil {
                image
                    .cornerRadius(20)
                    .shadow(color: .gray, radius: 3)
            } else {
                Image("defaultUser")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(20)
            }
            VStack(alignment: .leading) {
                if name != nil {
                    if description != nil {
                        HStack {
                            Text(name!)
                                .font(Font.headline)
                                .frame(alignment: .topLeading)
                            if lastName != nil {
                                Text(lastName!)
                                    .font(Font.headline)
                                    .frame(alignment: .topLeading)
                            } else {
                                Text("")
                                    .font(Font.headline)
                                    .frame(alignment: .topLeading)
                            }
                            
                        }
                        Text(description!)
                            .foregroundColor(.gray)
                            .font(Font.footnote)
                            .frame(alignment: .bottom)
                    }
                } else {
                    Text("Default User Or Group")
                        .font(Font.headline)
                        .frame(alignment: .topLeading)
                    Text("Group Description")
                        .foregroundColor(.gray)
                        .font(Font.footnote)
                        .frame(alignment: .bottom)
                }
            }
        }
    }
}

struct GroupsCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(name: "Default", lastName: "User")
    }
}
