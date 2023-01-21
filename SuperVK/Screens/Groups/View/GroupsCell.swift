//
//  GroupsCell.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 21.01.2023.
//

import SwiftUI

struct GroupsCell: View {
    
    var groupImage: String?
    var groupName: String?
    var groupDescription: String?
    
    var body: some View {
        HStack {
            if groupImage != nil {
                Image(groupImage!)
                    .resizable()
                    .frame(width: 40, height: 40)
            } else {
                Image("defaultUser")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            VStack(alignment: .leading) {
                if groupName != nil {
                    if groupDescription != nil {
                        Text(groupName!)
                            .font(Font.headline)
                            .frame(alignment: .topLeading)
                        Text(groupDescription!)
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
        GroupsCell()
    }
}
