//
//  WebViewCoordinator.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 14.01.2023.
//

import Foundation
import WebKit
import SwiftUI

final class WebViewCoordinator: NSObject, WKNavigationDelegate {
    
    private let session: Session = Session.authentification
    @State private var path = MainView()
    
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url,
              url.path == APIMethods.navigationPath.rawValue,
              let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        if let token = params["access_token"],
           let userId = params["user_id"] {
            
            session.token = token
            session.id = Int(userId)
            decisionHandler(.cancel)
        }
    }
}

