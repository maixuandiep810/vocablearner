//
//  BaseClient+Vocabulary.swift
//  vocablearner
//
//  Created by Rocky on 10/23/20.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

extension BaseClient {
        
    
    func getVocabularyWithUrl(completion:@escaping ServiceResponse) {
        DispatchQueue.global(qos: .background).async {

            // Run on background thread
            let request = Services.getVocabulary as URLRequestConvertible
            Alamofire.request(request)
                .responseObject { (response: DataResponse<VocabularyResponse>) in
                    switch response.result {
                        case let .success(data):
                            let listVocabModelData = data.data as? ListVocabularyModelData
                            let listVocabModel = listVocabModelData?.list
                            completion(true, nil, listVocabModel);
                            break
                        case let .failure(error):
                            completion(false, error as NSError?, nil);
                            break
                    }
                }
        }
    }
    
    func getVocabularyByCategoryIdWithUrl(categoryId: String, completion:@escaping ServiceResponse) {
        DispatchQueue.global(qos: .background).async {

            // Run on background thread
            let request = Services.getVocabularyByCategoryId(categoryId: categoryId) as URLRequestConvertible
            Alamofire.request(request)
                .responseObject { (response: DataResponse<VocabularyResponse>) in
                    switch response.result {
                        case let .success(data):
                            let listVocabModelData = data.data as? ListVocabularyModelData
                            let listVocabModel = listVocabModelData?.list
                            completion(true, nil, listVocabModel);
                            break
                        case let .failure(error):
                            completion(false, error as NSError?, nil);
                            break
                    }
                }
        }
    }
    

    
}

