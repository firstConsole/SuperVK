//
//  JSONManager.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 15.01.2023.
//

import Foundation

final class JSONManager {
    
}

extension Groups {
    func getJSON(host: URLOptions,
                 scheme: URLOptions,
                 path: APIMethods,
                 HTTPMethod: HTTPMethods,
                 queryItems: [URLQueryItem]) {
        
        var urlComponents = URLComponents()
        urlComponents.host = host.rawValue
        urlComponents.scheme = scheme.rawValue
        urlComponents.path = path.rawValue
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            fatalError("Can not make url")
        }
        print(url)
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.rawValue
        
        let session = Session.authentification.urlSession
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
            }
            
            guard let data = data else {
                return
            }
            
            guard let json = try? JSONSerialization.jsonObject(with: data,
                                                               options: JSONSerialization.ReadingOptions.fragmentsAllowed) else {
                fatalError("Can not load JSON")
            }
            print(json)
        }
        task.resume()
    }
}
