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
    
    /**
    * Login
    * @param: username, password md5
    * @return : token
    */
    func loginWithUrl(username:String, password: String, completion:@escaping ServiceResponse) {

            let request = Services.login(username: username, password: password) as URLRequestConvertible
            Alamofire.request(request)
                .responseJSON { ( response : DataResponse <Any>) in
                
                switch response.result {
                case .success (_):
                        var data = response.result
//                        completion(true, nil, data);
                        print()
                        break
                    case .failure(let error):
//                        completion(false, error as NSError?, nil);
                        break
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
