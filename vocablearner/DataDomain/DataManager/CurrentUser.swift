//
//  BaseUser.swift
//  vocablearner
//
//  Created by Rocky on 10/22/20.
//

import Foundation


class CurrentUser: NSObject {
    
    var user: UserModel?
    
    //Singleton
    static let shared = CurrentUser()
    
    
}
