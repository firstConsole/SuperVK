//
//  NavigationBar.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 29.01.2023.
//

import SwiftUI

struct NavigationBar: View {
    
    @State var title: String
    
    var body: some View {
        NavigationView {
            
        }
        .navigationTitle(Text(title))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "Title")
    }
}
