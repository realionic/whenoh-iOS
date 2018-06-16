//
//  NetworkService.swift
//  IssueTimeLine
//
//  Created by SolChan Ahn on 2018. 6. 16..
//  Copyright © 2018년 SolChan Ahn. All rights reserved.
//

import Alamofire
import Foundation

protocol NetworkServiceType {
    
    // get service에 대한 개별 프로토콜 함수
    static func getIssueList(completion: @escaping (Result<[Issue]>) -> ())
    
    // post service에 대한 개별 프로토콜 함수
    static func postCreateIssue(text: String, completion: @escaping (Result<Issue>) -> ())
    
}

struct NetworkService: NetworkServiceType {
    
    static func getIssueList(completion: @escaping (Result<[Issue]>) -> ()) {
        Alamofire
            .request(API.getReadIssue.urlString)
            .validate()
            .responseData(completionHandler: { (response) in
                switch response.result {
                case .success(let value):
                    do {
                        let issueData = try value.decode([Issue].self)
                        completion(.success(issueData))
                    } catch {
                        completion(.error(error))
                    }
                case .failure(let error):
                    completion(.error(error))
                }
            })
    }
    
    static func postCreateIssue(text: String, completion: @escaping (Result<Issue>) -> ()) {
        let params: Parameters = [
            "text": text
        ]
        
        Alamofire.request("https://serverless.arteight.co.kr/v1/issue/", method: .post, parameters: params, encoding: JSONEncoding.default)
            .validate()
            .responseData { (response) in
                switch response.result {
                case .success(let value):
                    do {
                        let IssueData = try value.decode(Issue.self)
                        print("--------!!--------")
                        completion(.success(IssueData))
                    } catch {
                        print("------??------")
                        completion(.error(error))
                    }
                case .failure(let error):
                    completion(.error(error))
                    print(API.postCreateIssue.urlString)
                }
        }
    }
}


// MARK: - 코더블 인자 전달 유틸리티
extension Data {
    func decode<T>(_ type: T.Type, decoder: JSONDecoder = JSONDecoder()) throws -> T where T: Decodable {
        return try decoder.decode(type, from: self)
    }
}

