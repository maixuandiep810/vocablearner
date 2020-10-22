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
                        let user = data.data as? UserModel
                        self.token = user?.token
                        CurrentUser.shared.user = user
                        RealmManager.shared.userDA.saveUser(user: user)
                        var newUser = RealmManager.shared.userDA.getCurrentUser()
                        completion(true, nil, data);
                        break

                    case let .failure(error):
                        completion(false, error as NSError?, nil);
                        
                        break
                    }
                }
        }
    }
    

    
}
