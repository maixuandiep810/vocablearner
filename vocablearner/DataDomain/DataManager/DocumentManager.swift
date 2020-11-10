//
//  DocumentManager.swift
//  vocablearner
//
//  Created by Rocky on 11/9/20.
//

import UIKit

class DocumentManager: NSObject {

    static let shared = DocumentManager()
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
}
