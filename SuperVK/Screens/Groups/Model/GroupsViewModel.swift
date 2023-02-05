//
//  ViewModel.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 29.01.2023.
//

import SwiftUI

final class GroupsViewModel: ObservableObject {
    @Published var groups: [GroupsItems] = []
    
    func fetch(token: String?,
               host: URLOptions,
               scheme: URLOptions,
               path: APIMethods,
               urlSession: URLSession,
               queryItems: [URLQueryItem]) {
        
        var urlComponents = URLComponents()
        urlComponents.host = host.rawValue
        urlComponents.scheme = scheme.rawValue
        urlComponents.path = path.rawValue
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            return
        }
        
        let task = urlSession.dataTask(with: url) { [weak self] data, response, error in
            
            guard let data = data else {
                return
            }
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            do {
                let result = try JSONDecoder().decode(GroupsJSONModel.self, from: data).response.items
                
                DispatchQueue.main.async {
                    self?.groups = result
                    print("Success loaded groups")
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

