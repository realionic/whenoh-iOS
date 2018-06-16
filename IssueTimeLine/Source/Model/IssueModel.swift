//
//  IssueModel.swift
//  IssueTimeLine
//
//  Created by SolChan Ahn on 2018. 6. 16..
//  Copyright © 2018년 SolChan Ahn. All rights reserved.
//

import Foundation

struct Issue: Decodable {
    let text: String?
    let id: String?
    let checked: Bool?
    let updatedAt: Int?
    
    let message: String?
    
    private enum CodingKeys: String, CodingKey {
        case text
        case id
        case checked
        case updatedAt
        
        case message
    }
}
