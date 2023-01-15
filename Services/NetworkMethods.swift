//
//  NetworkMethods.swift
//  SuperVK
//
//  Created by Алексей Артамонов on 08.01.2023.
//

import Foundation

// MARK: - API Methods

enum APIMethods: String {
    case getFriends = "/method/friends.get"
    case getGroups = "/method/groups.get"
    case getFeed = "/method/newsfeed.get"
    case getPhotos = "/method/photos.getAll"
    case authorization = "/authorize"
    case navigationPath = "/blank.html"
}

// MARK: - HTTP Methods

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

// MARK: - URL Options

enum URLOptions: String {
    case scheme = "https"
    case host = "api.vk.com"
    case authorization = "oauth.vk.com"
}
