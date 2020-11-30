//
//  TestModel.swift
//  vocablearner
//
//  Created by Rocky on 10/29/20.
//

import UIKit
import ObjectMapper
import RealmSwift

// User Model
// = user information
class TestModel: Object, Mappable {

    var id = ""
    
    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        id        <- map["id"]
    }
}
