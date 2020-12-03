//
//  CategoryModel.swift
//  vocablearner
//
//  Created by Rocky on 10/27/20.
//

import UIKit
import ObjectMapper
import RealmSwift


class CategoryModel: Object, Mappable {
    
    @objc dynamic var id = 0
    @objc dynamic var userId = 0
    @objc dynamic var categoryId = 0
    @objc dynamic var name = ""
    @objc dynamic var imageUrl = ""
    @objc dynamic var levelId = 0
    @objc dynamic var isDifficult = false
    @objc dynamic var isCustomCategory = false
    @objc dynamic var isTested = false
    @objc dynamic var days = 0

    var imageView: UIImageView?
    
    
    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        id                              <- map["Id"]
        userId                          <- map["UserId"]
        categoryId                      <- map["CategoryId"]
        name                            <- map["Name"]
        imageUrl                        <- map["ImageUrl"]
        levelId                         <- map["LevelId"]
        isDifficult                     <- map["IsDifficult"]
        isCustomCategory                <- map["IsCustomCategory"]
        isTested                        <- map["IsTested"]
        days                            <- map["Days"]

    }
}
