//
//  UserModel.swift
//  vocablearner
//
//  Created by Rocky on 10/21/20.
//

import UIKit
import ObjectMapper
import RealmSwift

class UserModel: Object, Mappable {

    var username = ""
    var email = ""
    var avatarUrl = ""
    var token = ""
    
    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        username             <- map["username"]
        email           <- map["email"]
        avatarUrl                <- map["avatar_url"]
        token              <- map["token"]
    }
}

