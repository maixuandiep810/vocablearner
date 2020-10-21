//
//  BaseClient.swift
//  vocablearner
//
//  Created by Rocky on 10/21/20.
//

import Foundation
import Alamofire

class BaseClient: NSObject {
    
    var accessToken: String?
    
    //Singleton
    static let shared = BaseClient()
    
    //Block
    typealias ServiceResponse = (Bool?, NSError?, AnyObject?) -> Void
    
   // Create basic url
    enum Services: URLRequestConvertible
    {
        case login(username: String, password: String)


        static let baseHTTPS = API.kBaseUrlSSL
        static let baseHTTP = API.kBaseUrl
        
        var method: HTTPMethod
        {
            switch self {
            case .login: return .post

            }
            
        }

        var path: String
        {
            switch self {
            case .login(_, _):
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

                
                // Create https url
                let urlHttps = try Services.baseHTTPS.appending(path).asURL()
                var urlHttpsRequest = URLRequest(url: urlHttps)
                urlHttpsRequest.httpMethod = method.rawValue
                urlHttpsRequest.setValue(Header.ApplicationJson, forHTTPHeaderField: Header.ContentType)
                
                switch self {
                case .login(let username, let password):
                    let data : [String: Any] = [
                        "username": username,
                        "password": password
                    ]
                    do {
                        urlHttpRequest = try URLEncoding.default.encode(urlHttpRequest, with: data)
                    } catch {
                        print("Encoding fail")
                    }
                    return urlHttpRequest
                    

                }
        }
    }
}

