//
//  BaseClient+TestSetting.swift
//  vocablearner
//
//  Created by Rocky on 11/25/20.
//


import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import RealmSwift

extension BaseClient {
    
    func getTestSetting(userId: String, completion:@escaping ServiceResponse) {
        DispatchQueue.global(qos: .background).async {
            
            // Run on background thread
            let request = Services.getTestSetting(userId: userId) as URLRequestConvertible
            Alamofire.request(request)
                .responseObject { (response: DataResponse<TestSettingResponse>) in
                    switch response.result {
                    case let .success(data):
                        DispatchQueue.main.async {
                            let listTestSettingData = data.data
                            let listTestSetting = listTestSettingData?.list
                            completion(true, nil, listTestSetting)
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

