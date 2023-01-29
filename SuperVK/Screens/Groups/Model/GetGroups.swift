//
//  GetGroups.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 21.01.2023.
//

import SwiftUI

final class GetGroups {
    
    // MARK: - Private properties
    
    private let decoder = JSONDecoder()
    private let networkService = NetworkSevice()
    
    // MARK: - Fundamental
    
    func loadGroups(completion: @escaping(Result<[GroupsItems], Error>) -> Void) {
        
        guard let token = Session.authentification.token else {
            return
        }
        
        var urlComponents = URLComponents()
        urlComponents.host = URLOptions.host.rawValue
        urlComponents.scheme = URLOptions.scheme.rawValue
        urlComponents.path = APIMethods.getGroups.rawValue
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "v", value: "5.131"),
            URLQueryItem(name: "extended", value: "1")
        ]
        
        guard let url = urlComponents.url else {
            return
        }
        
        print(url)
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.get.rawValue
        
        let task = Session.authentification.urlSession.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else {
                return
            }
            
            if let error = error {
                print(error)
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let result = try self.decoder.decode(JSONModel.self, from: data).response.items
                completion(.success(result))
                print(result)
            } catch {
                completion(.failure(error))
                print(error)
            }
        }
        task.resume()
    }
    
    func loadImage(url: String, completion: @escaping(UIImage) -> Void) {
        guard let url = URL(string: url) else {
            return
        }
        
        networkService.imageLoad(url: url) { result in
            switch result {
            case .success(let data):
                guard let image = UIImage(data: data) else { return }
                completion(image)
            case .failure(let error):
                print(error)
            }
        }
    }
}
