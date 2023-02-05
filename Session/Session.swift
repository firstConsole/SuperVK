//
//  Session.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 14.01.2023.
//

import Foundation

final class Session: ObservableObject {
    
    static let authentification = Session()
    
    private init() {}
    
    @Published var token: String?
    
    var id: Int?
    
    var json: Any?
    var urlSession: URLSession {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        return session
    }
}
