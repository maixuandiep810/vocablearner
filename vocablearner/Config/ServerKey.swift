//
//  ServerKey.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/7/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import Foundation
import Alamofire

struct Header {
     static let ContentType = "Content-Type"
     static let ApplicationJson = "application/json"
     static let AccessTokenKey = "Access-Token"
}

struct ResponseKey {
    static let AccessToken = "AccessTokenKey"
    static let ErrorKey = "e"
    static let RawKey = "r"
}

enum ErrorCode: Int {
    case Success = 0
    case Fail = 1
}

