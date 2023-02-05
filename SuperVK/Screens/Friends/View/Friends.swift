//
//  Friends.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 14.01.2023.
//

import SwiftUI

struct Friends: View {
    
    @State var isLoaded: Bool = false
    @State var isTapped: Bool = false
    @StateObject var viewModel = FriendsViewModel()
    
    private let networkService = NetworkSevice()
    private let queryItems: [URLQueryItem] = [
        URLQueryItem(name: "access_token", value: Session.authentification.token),
        URLQueryItem(name: "v", value: "5.131"),
        URLQueryItem(name: "fields", value: "first_name"),
        URLQueryItem(name: "fields", value: "last_name"),
        URLQueryItem(name: "fields", value: "photo_200")
    ]
    
    var body: some View {
        
        NavigationView {
            ZStack {
                NavigationBar(title: "Друзья")
                VStack {
                    List {
                        ForEach(viewModel.friends, id: \.id) { friends in
                            VStack {
                                if let url = friends.photo {
                                    ListCell(image: URLImage(url: url,
                                                             width: 40,
                                                             height: 40),
                                             name: friends.firstName,
                                             description: friends.lastName).tag(friends.id)
                                }
                            }
                            .onTapGesture {
                                self.isTapped.toggle()
                            }
                            .sheet(isPresented: $isTapped) {
                                FriendsDetailView(friends: friends)
                            }
                        }
                        
                    }
                    .listStyle(.plain)
                    .onAppear {
                        viewModel.fetch(token: Session.authentification.token,
                                        host: .host,
                                        scheme: .scheme,
                                        path: .getFriends,
                                        urlSession: Session.authentification.urlSession,
                                        queryItems: queryItems)
                    }
                }
            }
        }
    }
}

struct Friends_Previews: PreviewProvider {
    static var previews: some View {
        Friends()
    }
}
