//
//  Message.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 08.01.2023.
//

import SwiftUI

struct Message: View {
    var body: some View {
        NavigationBar(title: "Чаты",
                      description: "Здесь будет список чатов")
    }
}

struct Message_Previews: PreviewProvider {
    static var previews: some View {
        Message()
    }
}
