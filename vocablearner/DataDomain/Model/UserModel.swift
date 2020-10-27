//
//  UserModel.swift
//  vocablearner
//
//  Created by Rocky on 10/21/20.
//

import UIKit
import ObjectMapper
import RealmSwift

// User Model
// = user information
class UserModel: Object, Mappable {

    @objc dynamic var id = 0
    @objc dynamic var username = ""
    @objc dynamic var email = ""
    @objc dynamic var avatarUrl = ""
    @objc dynamic var token = ""
    
    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        id        <- map["Id"]
        username        <- map["Username"]
        email           <- map["Email"]
        avatarUrl       <- map["AvatarUrl"]
        token           <- map["Token"]
    }
}

