//
//  WebView.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 14.01.2023.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    private let networkService = NetworkSevice()
    private let session = Session.authentification
    
    func makeUIView(context: Context) -> some UIView {
        let webView = WKWebView()
        let options: [URLQueryItem] = [
            URLQueryItem(name: "client_id", value: "8140202"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "wall, photos, friends, groups"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "revoke", value: "0")
        ]
        
        networkService.authentification(with: options, webView: webView)
        
        webView.navigationDelegate = context.coordinator
        
        return webView
    }
    
    // MARK: - Make coordinator
    
    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
}
