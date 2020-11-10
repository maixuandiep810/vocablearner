//
//  VocabularyResponse.swift
//  vocablearner
//
//  Created by Rocky on 10/23/20.
//

import UIKit
import ObjectMapper
import RealmSwift


// VOCABULARY RESPONSE
class VocabularyResponse: BaseResponse<ListVocabularyModelData> {
    
}


// LIST OF VOCABULARY MODEL DATA
class ListVocabularyModelData: Object, Mappable {
    
    var list = List<VocabularyModel>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        list           <- (map["List"], ListTransform<VocabularyModel>())
    }
}












// CTRL IIIIIIIIIIIIIIII
