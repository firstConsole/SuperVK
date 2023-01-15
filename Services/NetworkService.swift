//
//  NetworkService.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 08.01.2023.
//

import Foundation
import WebKit

final class NetworkSevice {
    
    /// URL Session
    var urlSession: URLSession {
        let sessionConfiguration = URLSessionConfiguration.default
        let urlSession = URLSession(configuration: sessionConfiguration)
        
        return urlSession
    }
    
    /// Load request for webView
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
        
        DispatchQueue.main.async {
            webView.load(request)
        }
    }
    
    /// To make URL from array of URLQueryItem
    func getURL(with options: [URLQueryItem]) -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = URLOptions.scheme.rawValue
        urlComponents.host = URLOptions.authorization.rawValue
        urlComponents.path = APIMethods.authorization.rawValue
        urlComponents.queryItems = options
        
        guard let url = urlComponents.url else {
            return URL(string: "")!
        }
        
        return url
    }
}
