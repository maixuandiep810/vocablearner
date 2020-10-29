//
//  TestBaseResponse.swift
//  vocablearner
//
//  Created by Rocky on 10/29/20.
//

import UIKit
import ObjectMapper
import RealmSwift


// BASE RESPONSE from api server
// = frame of response
class TestResponse: Object, Mappable {
    
    var status = 0
    var message = ""
    var data = List<TestModel>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        status             <- map["status"]
        message          <- map["message"]
        data             <- (map["data"], ListTransform<TestModel>())
    }
}
