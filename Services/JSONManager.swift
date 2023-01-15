//
//  JSONManager.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 15.01.2023.
//

import Foundation

final class JSONManager {
    
}

extension Bundle {
    func decode<T: Decodable>(with file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in the project")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) in the project")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) in the project")
        }
        
        return loadedData
    }
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
