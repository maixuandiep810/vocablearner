//
//  RealmManager.swift
//  vocablearner
//
//  Created by Rocky on 10/22/20.
//


// TODO XXXXXXXXX



import Foundation
import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    public let userDA: UserDA
    
    init() {
        let config = Realm.Configuration(
           schemaVersion: 1
        )
        self.userDA = UserDA(config: config)
        if let realmUrl = Realm.Configuration.defaultConfiguration.fileURL {
            UserDefaults.standard.set("realm_url", forKey: realmUrl.absoluteString)
            UserDefaults.standard.synchronize()
        }
    }
    
    
}


class UserDA {
    private var config: Realm.Configuration
    init(config: Realm.Configuration) {
       self.config = config
   }
    
    func getCurrentUser() -> UserModel? {
        return try! Realm(configuration: self.config).objects(UserModel.self).first
    }
    
    func saveUser(user: UserModel?){
       if let user = user {
          let realm = try! Realm(configuration: self.config)
          if realm.isInWriteTransaction {
            realm.add(user)
          } else {
                  try! realm.write {
                    realm.add(user)
               }
            }
        }
    }
    
    func deleteCurrentUser() {
//        let user = try! Realm(configuration: self.config).objects(UserModel.self).first
    }
}
