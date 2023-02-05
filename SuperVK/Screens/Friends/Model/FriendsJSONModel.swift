//
//  FriendsJSONModel.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 05.02.2023.
//

import Foundation

struct FriendsJSONModel: Hashable, Codable {
    let response: ResponseFriends
}

struct ResponseFriends: Hashable, Codable {
    let items: [FriendsItems]
}

struct FriendsItems: Hashable, Codable, Identifiable {
    let id: Int?
    let firstName: String
    let lastName: String
    let photo: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_200"
    }
}
