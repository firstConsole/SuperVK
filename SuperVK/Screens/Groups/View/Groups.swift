//
//  Groups.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 08.01.2023.
//

import SwiftUI

struct Groups: View {
    
    @State var isLoaded: Bool = false
    @State var isTapped: Bool = false
    @StateObject var viewModel = GroupsViewModel()
    
    private let networkService = NetworkSevice()
    private let queryItems: [URLQueryItem] = [
        URLQueryItem(name: "access_token", value: Session.authentification.token),
        URLQueryItem(name: "v", value: "5.131"),
        URLQueryItem(name: "extended", value: "1")
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationBar(title: "Группы")
                VStack {
                    List {
                        ForEach(viewModel.groups, id: \.id) { group in
                            HStack {
                                if let url = group.photo200 {
                                    ListCell(image: URLImage(url: url,
                                                             width: 40,
                                                             height: 40),
                                             name: group.name,
                                             description: group.screenName)
                                }
                            }
                            .onTapGesture {
                                self.isTapped.toggle()
                            }
                            .sheet(isPresented: $isTapped) {
                                GroupsDetailView(group: group)
                            }
                        }
                    }
                    
                    .listStyle(.plain)
                    .onAppear {
                        viewModel.fetch(token: Session.authentification.token,
                                        host: .host,
                                        scheme: .scheme,
                                        path: .getGroups,
                                        urlSession: Session.authentification.urlSession,
                                        queryItems: queryItems)
                    }
                }
            }
        }
    }
}


struct Groups_Previews: PreviewProvider {
    static var previews: some View {
        Groups()
    }
}
