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
        case login(username: String, password: String)
        case logout(token: String)
        
        case getVocabulary
        case getVocabularyByCategoryId(categoryId: String)
        case checkPronunciation(vocabularyId: String)
        
        case getCategory
        case getCategoryByLevel(levelId: String)
        case addCategory(addCateRequest: AddCateRequest)

        static let baseHTTPS = API.kBaseUrlSSL
        static let baseHTTP = API.kBaseUrl
        
        var method: HTTPMethod
        {
            switch self {
            case .login(_, _): return HTTPMethod.post
            case .logout(_): return HTTPMethod.get

            case .getVocabulary: return HTTPMethod.get
            case .getVocabularyByCategoryId(_): return HTTPMethod.get
            case .checkPronunciation(_): return HTTPMethod.post
                
            case .getCategory: return HTTPMethod.get
            case .getCategoryByLevel(_): return HTTPMethod.get
            case .addCategory(_): return HTTPMethod.post
            }
            
        }

        var path: String
        {
            switch self {
            case .login(_, _):
                return String(format: API.kLoginUrl)
            case .logout(_):
                return String(format: API.kLogoutUrl)
                
            case .getVocabulary:
                return String(format: API.kVocabularyUrl)
            case .getVocabularyByCategoryId(let categoryId):
                return String(format: API.kVocabularyByCategoryIdUrl, categoryId)
            case .checkPronunciation(let vocabularyId):
                return String(format: API.kCheckPronunciationByVocabularyIdUrl, vocabularyId)
                
            case .getCategory:
                return String(format: API.kCategoryUrl)
            case .getCategoryByLevel(let levelId):
                return String(format: API.kCategoryByLevelUrl, levelId)
            case .addCategory:
                return String(format: API.kCategoryUrl)
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
                let bodyRaw: [String: Any] = [
                    "username": username,
                    "password": password
                ]
                do {
                    //  Auto add header ContentType = ApplicationJson
                    urlHttpRequest = try JSONEncoding.default.encode(urlHttpRequest, with: bodyRaw)
                } catch {
                    print()
                }
                return urlHttpRequest
                
            case .logout(let token):
                urlHttpRequest.setValue(token, forHTTPHeaderField: Header.Token)
                return urlHttpRequest
            case .getVocabulary:
                return urlHttpRequest
            case .getVocabularyByCategoryId(_):
                return urlHttpRequest
            case .checkPronunciation(_):
                urlHttpRequest.setValue(Header.MultipartFormdata, forHTTPHeaderField: Header.ContentType)
                return urlHttpRequest
                
            case .getCategory:
                return urlHttpRequest
            case .getCategoryByLevel(_):
                return urlHttpRequest
            case .addCategory:
                return urlHttpRequest
            }
            
        }
    }
    
    
    
}




//var multipartFormData: MultipartFormData {
//    let multipartFormData = MultipartFormData()
//    switch self {
//    case .checkPronunciation(_):
//        multipartFormData.append(DocumentManager.shared.getDocumentsDirectory().appendingPathComponent(DocumentUrl.defaultAudioUrl), withName: "audio")
//    default: ()
//    }
//    return multipartFormData
//}
//
//func getMultipartFormData() -> MultipartFormData {
//    let multipartFormData = MultipartFormData()
//    switch self {
//    case .checkPronunciation(_):
//        multipartFormData.append(DocumentManager.shared.getDocumentsDirectory().appendingPathComponent(DocumentUrl.defaultAudioUrl), withName: "audio")
//    default: ()
//    }
//    return multipartFormData
//}
