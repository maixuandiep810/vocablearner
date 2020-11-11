//
//  BaseClient+Movie.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/7/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

extension BaseClient {
    
    /**
     * Login
     * @param: username, password md5
     * @return : token
     */
    func loginWithUrl(username:String, password: String, completion:@escaping ServiceResponse) {
        DispatchQueue.global(qos: .background).async {
            // Run on background thread
            let request = Services.login(username: username, password: password) as URLRequestConvertible
            Alamofire.request(request)
                .responseObject { (response: DataResponse<UserInfoResponse>) in
                    switch response.result {
                    
                    case let .success(data):
                        let user = data.data
                        self.token = user?.token
                        CurrentUser.shared.user = user
                        
                        // TODO : save token to
                        // RealmManager.shared.userDA.saveUser(user: CurrentUser.shared.user)
                        switch data.code {
                        case 1:
                            DispatchQueue.main.async {
                                completion(true, nil, nil);
                            }
                        default:
                            ()
                        }
                        break
                        
                    case let .failure(error):
                        DispatchQueue.main.async {
                            completion(false, error as NSError?, nil);
                        }
                        break
                    }
                }
        }
    }
    
    /**
     * Login
     * @param: username, password md5
     * @return : token
     */
    func logoutWithUrl(token:String, completion:@escaping ServiceResponse) {
        DispatchQueue.global(qos: .background).async {
            // Run on background thread
            let request = Services.logout(token: token) as URLRequestConvertible
            Alamofire.request(request)
                .responseJSON { (response: DataResponse<Any>) in
                    switch response.result {
                    case .success(_):
                        CurrentUser.shared.user = nil
                        DispatchQueue.main.async {
                            completion(true, nil, nil);
                        }
                        break
                    case let .failure(error):
                        DispatchQueue.main.async {
                            completion(false, error as NSError?, nil);
                        }
                        break
                    }
                }
        }
    }
    
    
}
