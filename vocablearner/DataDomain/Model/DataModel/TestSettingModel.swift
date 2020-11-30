//
//  TestSettingModel.swift
//  vocablearner
//
//  Created by Rocky on 11/25/20.
//


import UIKit
import ObjectMapper
import RealmSwift

class TestSettingModel: Object, Mappable {
    
    @objc dynamic var Name = ""
    @objc dynamic var Value = 0
    @objc dynamic var Time = 0.0
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        Name        <- map["Name"]
        Value        <- map["Value"]
        Time           <- map["Time"]
        
    }
}
