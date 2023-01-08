//
//  Feed.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 05.11.2022.
//

import SwiftUI

struct Feed: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationBarBackButtonHidden(true)
    }
}

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        Feed()
    }
}
