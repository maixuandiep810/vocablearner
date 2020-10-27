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
        word            <- map["Word"]
        meaning         <- map["Meaning"]
        definition      <- map["Definition"]
        sentence        <- map["Sentence"]
        imageUrl        <- map["ImageUrl"]
        audioUrl        <- map["AudioUrl"]
    }
}
