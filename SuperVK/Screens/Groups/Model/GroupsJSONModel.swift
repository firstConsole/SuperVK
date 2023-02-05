//
//  GroupsJSONModel.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 29.01.2023.
//

import Foundation

struct GroupsJSONModel: Hashable, Codable {
    let response: Response
}

struct Response: Hashable, Codable {
    let items: [GroupsItems]
    let nextFrom: String?
    
    enum CodingKeys: String, CodingKey {
        case items
        case nextFrom = "next_from"
    }
}

struct GroupsItems: Hashable, Codable, Identifiable {
    let id: Int?
    let name: String
    let screenName: String?
    let photo200: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case screenName = "screen_name"
        case photo200 = "photo_200"
    }
}
