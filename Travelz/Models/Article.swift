//
//  Article.swift
//  Travelz
//
//  Created by claire.roughan on 26/04/2021.
//  Copyright © 2021 claire.roughan. All rights reserved.
//

//   let welcome = try? newJSONDecoder().decode(Result.self, from: jsonData)

import Foundation

// MARK: - ArticleList

struct ArticleList: Decodable {
    let data: [Article]?
}

// MARK: - Article

struct Article: Decodable {
    let metaData: MetaData?
    let id: String?
    let title: String?
    let imageUrl: String?
    let isSaved: Bool?
    let isLiked: Bool?
    let likesCount: Int?
    let category: String?
    let author: Author?
}

// MARK: - Author

struct Author: Decodable {
    let id: String?
    let authorName: String?
    let authorAvatar: AuthorAvatar?
}

// MARK: - AuthorAvatar

struct AuthorAvatar: Decodable {
    let imageUrl: String?
}

// MARK: - MetaData

struct MetaData: Decodable {
    let creationTime: String?
    let updateTime: String?
}
