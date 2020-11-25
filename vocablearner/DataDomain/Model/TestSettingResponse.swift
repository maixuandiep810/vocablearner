//
//  TestSettingResponse.swift
//  vocablearner
//
//  Created by Rocky on 11/25/20.
//

import UIKit
import ObjectMapper
import RealmSwift


// VOCABULARY RESPONSE
class TestSettingResponse: BaseResponse<ListTestSettingModelData> {
    
}


// LIST OF CAREGORY MODEL DATA
class ListTestSettingModelData: Object, Mappable {
    
    var list = List<TestSettingModel>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        list           <- (map["List"], ListTransform<TestSettingModel>())
    }
}
