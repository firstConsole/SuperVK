//
//  PhotoCollectionView.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 05.02.2023.
//

import SwiftUI

struct PhotoCollectionView: View {
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        var body: some View {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(0...100, id: \.self) { _ in
                        Color.blue.frame(width: 120, height: 120)
                    }
                }
                .padding()
            }
        }
}

struct PhotoCollectionView_Preview: PreviewProvider {
    static var previews: some View {
        PhotoCollectionView()
    }
}
