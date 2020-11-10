//
//  ServerKey.swift
//  HomeMovie
//
//  Created by Rocky on 10/21/20.
//
//

import Foundation
import Alamofire

struct Header {
    static let ContentType = "Content-Type"
    static let ApplicationJson = "application/json; charset=utf-8"
    static let MultipartFormdata = "multipart/form-data"
    static let Token = "Token"
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

