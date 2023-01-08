//
//  NetworkService.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 08.01.2023.
//

import Foundation
import WebKit

final class NetworkSevice {
    
    var urlSession: URLSession {
        let sessionConfiguration = URLSessionConfiguration.default
        let urlSession = URLSession(configuration: sessionConfiguration)
        
        return urlSession
    }
    
    func authentification(with options: [URLQueryItem], webView: WKWebView) {
        var urlComponents = URLComponents()
        urlComponents.scheme = URLOptions.scheme.rawValue
        urlComponents.host = URLOptions.authorization.rawValue
        urlComponents.path = APIMethods.authorization.rawValue
        urlComponents.queryItems = options
        
        guard let url = urlComponents.url else {
            return
        }
        
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
}
