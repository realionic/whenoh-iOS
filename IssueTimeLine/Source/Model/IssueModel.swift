//
//  IssueModel.swift
//  IssueTimeLine
//
//  Created by SolChan Ahn on 2018. 6. 16..
//  Copyright © 2018년 SolChan Ahn. All rights reserved.
//

import Foundation

struct Issue: Decodable {
    
    let id: String
    let title: String
    let description: String
    let image: String
    let category: String
    let checked: Bool
    let updatedAt: Int?
    let createdAt: Int?
    let articles : [Article]
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case image
        case category
        case checked
        case updatedAt
        case createdAt
        case articles
    }
}

struct Article: Decodable {
    
    let time: Int
    let position: String
    let title: String
    let article: String
    let updatedAt: Int?
    let createdAt: Int?
    
    private enum CodingKeys: String, CodingKey {
        case time
        case position
        case title
        case article
        case updatedAt
        case createdAt
    }
}
