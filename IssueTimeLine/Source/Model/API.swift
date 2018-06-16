//
//  API.swift
//  IssueTimeLine
//
//  Created by SolChan Ahn on 2018. 6. 16..
//  Copyright © 2018년 SolChan Ahn. All rights reserved.
//

import UIKit

private let baseURL = "https://serverless.arteight.co.kr/v1"

// API Protocol
protocol APIProtocol
{
    var urlString: String { get }
}


enum API: APIProtocol
{
    // GET API URL 리스트를 열거형으로 정의 %02d
    // 참조) String format에 아규먼트 값을 넣을 경우 필요한 형식
    // %d = Int, %ld = Double, %f = Float, %@ = String
    // %.4f 는 Float의 소숫점 4자리까지만 표기함, 참고로 API에 사용되는 위도 경도 값은 소숫점 6자리 까지
    // %03 는 000, 001, 002 로 형 변환하며, %02는 01, 02, 03 로 형 변환
    enum GET_LIST: String
    {
        case readIssue = "/issue/"
    }
    // POST API URL 리스트를 열거형으로 정의
    enum POST_LIST: String
    {
        case createIssue = "/issue/"
    }
    
    // GET API
    case getReadIssue
    
    // POST API
    case postCreateIssue
    
    // endPoint에 파라미터 값을 반환하는 변수
    private var endpointString: String {
        get {
            switch self {
            
            case .getReadIssue:
                return String(format: GET_LIST.readIssue.rawValue)
            case .postCreateIssue:
                return String(format: POST_LIST.createIssue.rawValue)
            }
            
        }
    }
    
    // 기본 URL 주소와 Endpoint를 합쳐주는 변수
    var urlString: String {
        get {
            return baseURL + self.endpointString
        }
    }
    
    var URL: NSURL? {
        get {
            return NSURL(string: self.urlString)
        }
    }
}
