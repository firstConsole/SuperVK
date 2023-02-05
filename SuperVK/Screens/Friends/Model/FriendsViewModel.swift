//
//  FriendsViewModel.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 05.02.2023.
//

import Foundation

final class FriendsViewModel: ObservableObject {
    @Published var friends: [FriendsItems] = []
    
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
                print(error)
            }
            
            do {
                let result = try JSONDecoder().decode(FriendsJSONModel.self, from: data).response.items
                
                DispatchQueue.main.async {
                    self?.friends = result
                    print("Success loaded friends")
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
