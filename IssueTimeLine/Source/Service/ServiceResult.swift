//
//  ServiceResult.swift
//  IssueTimeLine
//
//  Created by SolChan Ahn on 2018. 6. 16..
//  Copyright © 2018년 SolChan Ahn. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case error(Error)
}

enum PostError: Error {
    case missingParameter(param: String)
    case encodingError
}

enum ServiceError: Error {
    case invalidToken
    case invalidURL
    case parsingError
}
