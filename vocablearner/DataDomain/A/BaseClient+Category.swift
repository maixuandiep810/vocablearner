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
    
    func getCategoryWithUrl(userId: String, levelIdValue: String, isDifficultValue: String, isTodoTestValue: String, completion:@escaping ServiceResponse) {
        DispatchQueue.global(qos: .background).async {
            // Run on background thread
            let request = Services.getCategory(userId: userId, levelIdValue: levelIdValue, isDifficultValue: isDifficultValue, isTodoTestValuecategoryId: isTodoTestValue) as URLRequestConvertible
            Alamofire.request(request)
                .responseObject { (response: DataResponse<CategoryResponse>) in
                    switch response.result {
                    case let .success(data):
                        let listCategoryModelData = data.data
                        let listCategoryModel = listCategoryModelData?.list
                        DispatchQueue.main.async {
                            completion(true, nil, listCategoryModel)
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
    
    func getCategoryByLevelWithUrl(levelId: String, completion:@escaping ServiceResponse) {
        
        DispatchQueue.global(qos: .background).async {
            // Run on background thread
            let request = Services.getCategoryByLevel(levelId: levelId) as URLRequestConvertible
            Alamofire.request(request)
                .responseObject { (response: DataResponse<CategoryResponse>) in
                    switch response.result {
                    case let .success(data):
                        let listCategoryModelData = data.data
                        let listCategoryModel = listCategoryModelData?.list
                        DispatchQueue.main.async {
                            completion(true, nil, listCategoryModel)
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
    
    func addCategory(addCateRequest: AddCateRequest, completion:@escaping ServiceResponse) {
        
        DispatchQueue.global(qos: .background).async {

            let request = Services.addCategory(addCateRequest: addCateRequest) as URLRequestConvertible
            Alamofire.upload(multipartFormData: { (multipartFormData) in
                if let urlImage = addCateRequest.imageURL {
                    multipartFormData.append(urlImage, withName: "Image")
                }
                else {
                    multipartFormData.append(addCateRequest.name.data(using: String.Encoding.utf8)!, withName: "Image" as String)
                }
                multipartFormData.append(addCateRequest.name.data(using: String.Encoding.utf8)!, withName: "Name" as String)
                multipartFormData.append(String(addCateRequest.levelId).data(using: String.Encoding.utf8)!, withName: "LevelId" as String)
            }, usingThreshold: UInt64.init(), with: request){ (result) in
                switch result{
                case .success(let upload, _, _):
                    print("aaa")
                    upload.responseJSON { response in
                        print("Succesfully uploaded  = \(response)")
                    }
                //                        upload.responseObject { (response: DataResponse<VocabularyResponse>) in
                //                            switch response.result {
                //                            case let .success(data):
                //                                let listVocabModelData = data.data as? ListVocabularyModelData
                //                                let listVocabModel = listVocabModelData?.list
                //                                completion(true, nil, listVocabModel);
                //                                break
                //                            case let .failure(error):
                //                                completion(false, error as NSError?,_;
                //                                break
                //                            }
                //                        }
                case .failure( _):
                    print("bbbb")
                }
            }
        }
    }
       
}


// CTRL + I
