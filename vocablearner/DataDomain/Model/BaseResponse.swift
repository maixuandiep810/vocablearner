//
//  BaseResponse.swift
//  vocablearner
//
//  Created by Rocky on 10/21/20.
//

import UIKit
import ObjectMapper
import RealmSwift

class BaseResponse<T: Mappable>: Object, Mappable {
    
    var code = 0
    var message = ""
    var data: T?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        code             <- map["code"]
        message          <- map["message"]
        data             <- map["data"]
    }

    
}
