//
//  AddCateProtocol.swift
//  vocablearner
//
//  Created by Rocky on 11/19/20.
//

import UIKit

protocol AddCateTextFieldDelegate: class {
    func AddCateTextFieldBeginEditing(cellID: String, textField: UITextField)
    func AddCateTextFieldShouldReturn(cellID: String, textField: UITextField)
}
