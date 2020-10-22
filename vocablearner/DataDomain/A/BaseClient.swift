//
//  BaseClient.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/7/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import Foundation
import Alamofire

class BaseClient: NSObject {
    
    var token: String?
    
    //Singleton
    static let shared = BaseClient()
    
    //Block
    typealias ServiceResponse = (Bool?, NSError?, AnyObject?) -> Void
    
   // Create basic url
    enum Services: URLRequestConvertible
    {
        case login(username: String,
                   password: String)

        static let baseHTTPS = API.kBaseUrlSSL
        static let baseHTTP = API.kBaseUrl
        
        var method: HTTPMethod
        {
            switch self {
            case .login: return HTTPMethod.post

            }
            
        }

        var path: String
        {
            switch self {
            case .login:
                return String(format: API.kLoginUrl)
                
            
            }
        
        }
            
        // MARK: URLRequestConvertible
            func asURLRequest() throws -> URLRequest
            {
                
                // Create http url
                let urlHttp = try Services.baseHTTP.appending(path).asURL()
                var urlHttpRequest = URLRequest(url: urlHttp)
                urlHttpRequest.httpMethod = method.rawValue
                urlHttpRequest.setValue(Header.ApplicationJson, forHTTPHeaderField: Header.ContentType)

                switch self {
                
                case .login(let username, let password):
                    
                    var bodyRaw: [String: Any] = [
                        "username": "user1",
                        "password": "123"
                    ]
                    
                    do {
                        //  Auto add header ContentType = ApplicationJson
                        try urlHttpRequest = try JSONEncoding.default.encode(urlHttpRequest, with: bodyRaw)
                        print(urlHttpRequest.httpBody)
                    } catch {
                        print()
                    }

                    return urlHttpRequest
                    
                }
            }
    }
}

