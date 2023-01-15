//
//  JSONModel.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 15.01.2023.
//

import Foundation

struct JSONModel: Codable {
    let response: Response
}

struct Response: Codable {
    let items: [FeedItems]
    let profiles: [ProfilesItems]
    let groups: [GroupsItems]
    let nextFrom: String
    
    enum CodingKeys: String, CodingKey {
        case items, profiles, groups
        case nextFrom = "next_from"
    }
}

struct GroupsItems: Codable {
    let id: Int
    let name: String
    let screenName: String
    let photo200: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case screenName = "screen_name"
        case photo200 = "photo_200"
    }
}

struct FeedItems: Codable {
    
}

struct ProfilesItems: Codable {
    
}
