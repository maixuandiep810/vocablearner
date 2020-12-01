//
//  BaseResponse.swift
//  vocablearner
//
//  Created by Rocky on 10/21/20.
//

import UIKit
import ObjectMapper
import RealmSwift


// BASE RESPONSE from api server
// = frame of response
class BaseResponse<T: Mappable>: Object, Mappable {
    
    var code = 0
    var message = ""
    var data: T?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        code             <- map["Code"]
        message          <- map["Message"]
        data             <- map["Data"]
    }
}


class NullModel: Object, Mappable {
    
    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
    }
}