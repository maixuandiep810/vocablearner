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
                        let listVocabModelData = data.data
                        let listVocabModel = listVocabModelData?.list
                        DispatchQueue.main.async {
                            completion(true, nil, listVocabModel);
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
    
    func getVocabularyByCategoryIdWithUrl(categoryId: String, completion:@escaping ServiceResponse) {
        DispatchQueue.global(qos: .background).async {
            // Run on background thread
            let request = Services.getVocabularyByCategoryId(categoryId: categoryId) as URLRequestConvertible
            Alamofire.request(request)
                .responseObject { (response: DataResponse<VocabularyResponse>) in
                    switch response.result {
                    case let .success(data):
                        let listVocabModelData = data.data
                        let listVocabModel = listVocabModelData?.list
                        DispatchQueue.main.async {
                            completion(true, nil, listVocabModel);
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
    
    
    
    
    
    func addVocabularyByCategoryIdWithUrl(addVocabularyRequest: AddVocabularyRequest, completion:@escaping ServiceResponse) {        DispatchQueue.global(qos: .background).async {
            
            // Run on background thread
            let request = Services.addVocabularyByCategoryId(addVocabularyRequest: addVocabularyRequest) as URLRequestConvertible
            
            
            
            Alamofire.upload(multipartFormData: { (multipartFormData) in

                if let urlImage = addVocabularyRequest.imageURL {
                    multipartFormData.append(urlImage, withName: "Image")
                }
                else {
                    multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "Image" as String)
                }
                
                if let urlAudio = addVocabularyRequest.audioURL {
                    multipartFormData.append(urlAudio, withName: "Audio")
                }
                else {
                    multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "Audio" as String)
                }
                
                multipartFormData.append(addVocabularyRequest.word!.data(using: String.Encoding.utf8)!, withName: "Word" as String)
                multipartFormData.append(addVocabularyRequest.meaning!.data(using: String.Encoding.utf8)!, withName: "Meaning" as String)
                multipartFormData.append(addVocabularyRequest.sentence!.data(using: String.Encoding.utf8)!, withName: "Sentence" as String)
                multipartFormData.append(addVocabularyRequest.definition!.data(using: String.Encoding.utf8)!, withName: "Definition" as String)
            }, usingThreshold: UInt64.init(), with: request){ (result) in
                switch result{
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        print("")
                        DispatchQueue.main.async {
                            completion(true, nil, nil)
                        }
                    }
                case .failure( _):
                    DispatchQueue.main.async {
                        completion(false, nil, nil)
                    }
                    print("")
                }
            }
        
        
        
    }
}



func checkPronunciation(vocabularyId: String, completion:@escaping ServiceResponse) {
    DispatchQueue.global(qos: .background).async {
        // Run on background thread
        let request = Services.checkPronunciation(vocabularyId: vocabularyId) as URLRequestConvertible
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(DocumentManager.shared.getDocumentsDirectory().appendingPathComponent(DocumentUrl.defaultAudioUrl), withName: "audio")
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

