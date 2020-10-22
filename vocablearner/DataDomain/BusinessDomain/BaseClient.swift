//
//  BaseClient.swift
//  vocablearner
//
//  Created by Rocky on 10/21/20.
//

import Foundation
import Alamofire

class BaseClient: NSObject{
    
    var accessToken : String?
    var userId : String?
    
    
    //singleton
    static let shared = BaseClient()
    
    //block
    typealias ServiceResponse = (Bool?, NSError?, AnyObject?) -> Void
    
    enum Service: URLRequestConvertible {
        case login(username: String, password: String)
        
    
        
        static let baseHTTP = API.kBaseUrl
        
  
        //MARK: -Method
        private var method: HTTPMethod{
            switch self {
            case .login:
                return .post
            }
        }
            
        //MARK: -Path
        private var path: String{
            switch self {
            case .login:
                return API.kLoginUrl
            
            }
        }
            
        //MARK: -Header
        private var headers: HTTPHeaders {
            let headers = ["Accept": "application/json"]
            //var headers = ["Accept" : "multipart/form-data"]
            switch self {
           
            case .login:
                break
            
            }
            return headers;
        }
        

        
        // MARK: - Parameters
        private var parameters: Parameters? {
            switch self {
            case .login(let username,
                        let password):
                return [
                    "username": username,
                    "password": password
                ]
           
            }
        }
        
        //MARK: -Url request
        func asURLRequest() throws -> URLRequest {
            //create
            let url = try API.kBaseUrl.asURL()
            
            // setting path
            var urlRequest: URLRequest = URLRequest(url: url.appendingPathComponent(path))
            
            // setting method
            urlRequest.httpMethod = method.rawValue
            
            // setting header
            for (key, value) in headers {
                urlRequest.addValue(value, forHTTPHeaderField: key)
            }
            
            if let parameters = parameters {
                do {
                    urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
                } catch {
                    print("Encoding fail")
                }
            }
            
            switch self {
            case .login:
                return urlRequest
                            
//            case .GetPatientInfo(UserId: _, token: let accessToken):
//                urlRequest.setValue("Bearer \(accessToken)", forHTTPHeaderField: Header.Authorization)
//                return urlRequest
            }
        }
    }
}
        
    
    
//    var accessToken: String?
//
//    //Singleton
//    static let shared = BaseClient()
//
//    //Block
//    typealias ServiceResponse = (Bool?, NSError?, AnyObject?) -> Void
//
//   // Create basic url
//    enum Services: URLRequestConvertible
//    {
//        case login(username: String, password: String)
//
//
//        static let baseHTTPS = API.kBaseUrlSSL
//        static let baseHTTP = API.kBaseUrl
//
//        var method: HTTPMethod
//        {
//            switch self {
//            case .login: return .post
//
//            }
//
//        }
//
//        var path: String
//        {
//            switch self {
//            case .login(_, _):
//                return String(format: API.kLoginUrl)
//
//
//
//            }
//
//        }
//
//        // MARK: URLRequestConvertible
//            func asURLRequest() throws -> URLRequest
//            {
//
//                // Create http url
//                let urlHttp = try Services.baseHTTP.appending(path).asURL()
//                var urlHttpRequest = URLRequest(url: urlHttp)
//                urlHttpRequest.httpMethod = method.rawValue
//                urlHttpRequest.setValue(Header.ApplicationJson, forHTTPHeaderField: Header.ContentType)
//
//
//                // Create https url
//                let urlHttps = try Services.baseHTTPS.appending(path).asURL()
//                var urlHttpsRequest = URLRequest(url: urlHttps)
//                urlHttpsRequest.httpMethod = method.rawValue
//                urlHttpsRequest.setValue(Header.ApplicationJson, forHTTPHeaderField: Header.ContentType)
//
//                switch self {
//                case .login(let username, let password):
//                    let data : [String: Any] = [
//                        "username": username,
//                        "password": password
//                    ]
//                    do {
//                        urlHttpRequest = try URLEncoding.default.encode(urlHttpRequest, with: data)
//                    } catch {
//                        print("Encoding fail")
//                    }
//
//
//                    return urlHttpRequest
//
//
//                }
//        }
//    }




// BODY

//do {
//    urlHttpRequest = try URLEncoding.default.encode(urlHttpRequest, with: data)
//} catch {
//    print("Encoding fail")
//}








//                    let data : [String: Any] = [
//                        "username": username,
//                        "password": password
//                    ]
//                    do {
//                        let httpBody = try JSONEncoding.default.encode(urlHttpRequest, with: data).httpBody
//                        if let httpBody = httpBody, let utf8 = String(data: httpBody, encoding: .utf8) {
//                            print("JSON: \(utf8)")
//                            urlHttpRequest.httpBody = httpBody
//                        }
//                    } catch {
//                        print(error)
//                    }
