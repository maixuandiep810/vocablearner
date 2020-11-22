//
//  BaseClient+Test.swift
//  vocablearner
//
//  Created by p on 11/22/20.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import RealmSwift

extension BaseClient {
    
    func addFinishTestByUrl(addFinishRequest: AddFinishRequest, completion:@escaping ServiceResponse) {
        DispatchQueue.global(qos: .background).async {
            // Run on background thread
            let request = Services.addFinishTest(addFinishRequest: addFinishRequest) as URLRequestConvertible
            Alamofire.request(request)
                .responseObject { (response: DataResponse<SuccessResponse>) in
                    switch response.result {
                    case let .success(data):
                        DispatchQueue.main.async {
                            completion(true, nil, nil)
                        }
                        break
                    case let .failure(error):
                        DispatchQueue.main.async {
                            completion(false, error as NSError?, nil)
                        }
                        break
                    }
                }
        }
    }
}


// CTRL + I
