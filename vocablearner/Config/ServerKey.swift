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
    static let ApplicationJson = "application/json; charset=utf-8"
}

struct ResponseKey {
    static let StatusCode = "code"
    static let MessageCode = "message"
    static let Data = "data"
    static let Token = "token"
    static let User = "user"
}

enum ErrorCode: Int {
    case Success = 0
    case Fail = 1
}

