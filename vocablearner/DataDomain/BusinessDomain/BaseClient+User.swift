//
//  BaseClient+User.swift
//  vocablearner
//
//  Created by Rocky on 10/21/20.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

extension BaseClient {
    
    /**†
    * Login
    * @param: username, password md5
    * @return : token
    */
    func loginWithUrl(username:String, password: String, completion:@escaping ServiceResponse) {
            DispatchQueue.global(qos: .background).async {
                
                // Run on background thread
                let request = Service.login(username: username, password: password) as URLRequestConvertible
                Alamofire.request(request)
                    .responseJSON { ( response : DataResponse <Any>) in
                    
                    switch response.result {
                    case .success (_):
                        
                        
                        let data = response.result.value as? NSDictionary
                        let errorKey = data?.object(forKey: ResponseKey.StatusCode) as? Int
                        let rawValue = data?.object(forKey: ResponseKey.Data)
                        
                        if ( errorKey == ErrorCode.Success.rawValue) {
                                // Login succes
                            let access_token = ((rawValue as!  NSDictionary).object(forKey: ResponseKey.Token)) as? NSDictionary
                            self.accessToken = access_token?.object(forKey: ResponseKey.AccessToken) as? String
                            
                           // let usersId = ((rawValue as!  NSDictionary).object(forKey: ResponseKey.User)) as? NSDictionary
                            //self.userId = usersId?.object(forKey: "id") as? String
                            
                            //DataManager.shared.AddValue(key: Header.Authorization, value: "Bearer \(self.accessToken!)")
                            DispatchQueue.main.async {
                                // Run on main thread
                                completion(true, nil, data as AnyObject);
                            }
                            
                            
                        } else {
                            // Login fail
                            //let message = String(format: "\(rawValue as? String ?? Message.LoginFailMessage)")
                            
                            //let error = NSError(domain: Services.baseHTTP,
//                                                code: 0,
//                                                userInfo: [NSLocalizedDescriptionKey :message])
                            DispatchQueue.main.async {
                                // Run on main thread
                                //completion(false, error, nil);
                            }
                        }
                            break
                        case .failure(let error):
                            DispatchQueue.main.async {
                                // Run on main thread
                                completion(false, error as NSError?, nil);
                            }
                            break
                    }
                }
            }
        }
    
//    /**
//     * Get list movie
//     * @param: genre(0,1,2), tag: (from dictionary), page
//     * @return listData in callback
//     */
//    func listMovieByGenre(genre: String, tag: String, page: String, completion:@escaping ServiceResponse) {
//        DispatchQueue.global(qos: .background).async {
//            // Run on background
//            let request = Services.listMovie(genre: genre, tag: tag, page: page, token: self.accessToken!) as URLRequestConvertible
//            Alamofire.request(request)
//                    .responseObject { (response: DataResponse<ResponseMovie>) in
//                    switch response.result {
//                    case let .success(data):
//                        completion(true, nil, data);
//                        break
//
//                    case let .failure(error):
//                        completion(false, error as NSError?, nil);
//
//                        break
//                    }
//            }
//        }
//    }
    
}
