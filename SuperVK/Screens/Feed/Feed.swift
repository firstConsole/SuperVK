//
//  Feed.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 05.11.2022.
//

import SwiftUI

struct Feed: View {
    
    var body: some View {
        NavigationBar(title: "Новости",
                      description: "Здесь будет лента новостей")
    }
}

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        Feed()
    }
}
