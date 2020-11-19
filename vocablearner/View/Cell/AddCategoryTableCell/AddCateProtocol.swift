//
//  AddCateProtocol.swift
//  vocablearner
//
//  Created by Rocky on 11/19/20.
//

import Foundation

protocol AddCateTextFieldDelegate: class {
    func AddCateTextFieldBeginEditing(cellID: String)
    func AddCateTextFieldShouldReturn()
}
