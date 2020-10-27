//
//  CategoryModel.swift
//  vocablearner
//
//  Created by Rocky on 10/27/20.
//

import UIKit
import ObjectMapper
import RealmSwift

// User Model
// = user information
class CategoryModel: Object, Mappable {

    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var descriptionCategory = ""
    @objc dynamic var imageUrl = ""
    
    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        id                              <- map["Id"]
        name                            <- map["Name"]
        descriptionCategory             <- map["Description"]
        imageUrl                        <- map["ImageUrl"]
    }
}
