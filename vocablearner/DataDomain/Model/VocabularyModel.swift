//
//  VocabularyModel.swift
//  vocablearner
//
//  Created by Rocky on 10/23/20.
//

import UIKit
import ObjectMapper
import RealmSwift

// Vocabulary Model
// = vocabulary data
class VocabularyModel: Object, Mappable {

    @objc dynamic var word = ""
    @objc dynamic var meaning = ""
    @objc dynamic var definition = ""
    @objc dynamic var sentence = ""
    @objc dynamic var imageUrl = ""
    @objc dynamic var audioUrl = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        word            <- map["word"]
        meaning         <- map["meaning"]
        definition      <- map["definition"]
        sentence        <- map["sentence"]
        imageUrl        <- map["imageUrl"]
        audioUrl        <- map["audioUrl"]
    }
}
