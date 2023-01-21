//
//  Groups.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 08.01.2023.
//

import SwiftUI

struct Groups: View {
    
    @State var groups: [GroupsItems] = []
    @State var imageGroup: UIImage?
    let getGroups = GetGroups()
    
    var body: some View {
        VStack {
            Button {
                loadGroups()
            } label: {
                Text("LOAD GROUPS DATA")
            }
            
            List(groups) { item in
                GroupsCell(groupImage: item.photo200,
                           groupName: item.name,
                           groupDescription: item.screenName)
            }
        }
    }
}


struct Groups_Previews: PreviewProvider {
    static var previews: some View {
        Groups()
    }
}
