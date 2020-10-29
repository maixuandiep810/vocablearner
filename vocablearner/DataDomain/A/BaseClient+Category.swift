//
//  BaseClient+Category.swift
//  vocablearner
//
//  Created by Rocky on 10/27/20.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import RealmSwift

extension BaseClient {
        
    func getCategoryWithUrl(completion:@escaping ServiceResponse) {
        DispatchQueue.global(qos: .background).async {
            // Run on background thread
            let request = Services.getCategory as URLRequestConvertible
            Alamofire.request(request)
                .responseObject { (response: DataResponse<CategoryResponse>) in
                    switch response.result {
                        case let .success(data):
                            let listCategoryModelData = data.data as? ListCategoryModelData
                            let listCategoryModel = listCategoryModelData?.list
                            completion(true, nil, listCategoryModel);
                            break
                        case let .failure(error):
                            completion(false, error as NSError?, nil);
                            break
                    }
                }
        }
    }


    
}
