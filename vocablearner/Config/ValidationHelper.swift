//
//  Validation.swift
//  vocablearner
//
//  Created by Rocky on 11/20/20.
//

import UIKit

class Validation {
    
    var message = [String]()
    
    func validateAllField(nameCell: AddCateNameCell, levelCell: AddCateLevelCell) -> Bool {
        return validateAddCateNameCell(cell: nameCell) && validateAddCateLevelCell(cell: levelCell)
    }
    
    func validateAddCateImageCell(cell: AddCateImageCell) -> Bool {
        
        if cell.info == nil || cell.info?[UIImagePickerController.InfoKey.imageURL] == nil {
            message.append("You have not chosen. Use default image.")
            return false
        }
        return true
    }
    
    
    func validateAddCateNameCell(cell: AddCateNameCell) -> Bool {
        
        if cell.nameTF.text == nil {
            message.append("Name field is null")
            return false
        }
        if validateName(name: cell.nameTF.text!) == false {
            message.append("Name field is too long or too short")
            return false
        }
        return true
    }
    
    
    func validateAddCateLevelCell(cell: AddCateLevelCell) -> Bool {
        
        if cell.levelTF.text == nil {
            message.append("Level field is null")
            return false
        }
        return true
    }
    
    
    
    // MARK: Helpers
    
    public func validateName(name: String) -> Bool {
        
        // Length be 18 characters max and 3 characters minimum, you can always modify.
        let nameRegex = "^\\w{3,18}$"
        let trimmedString = name.trimmingCharacters(in: .whitespaces)
        let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        let isValidateName = validateName.evaluate(with: trimmedString)
        return isValidateName
    }
}





//class Validation {
//
//    static func validateAddCateImageCell(cell: AddCateImageCell) throws -> Void {
//
//        if cell.info == nil {
//            throw ValidationError.AddCateImageCell("Image ")
//        }
//    }
//
//
//    static func validateAddCateNameCell(cell: AddCateNameCell) throws -> Void {
//        if cell.nameTF.text == nil {
//            throw ValidationError.AddCateNameCell("Name Field is null")
//        }
//        if validateName(name: cell.nameTF.text!) == false {
//            return
//        }
//        else {
//            throw ValidationError.AddCateNameCell("Name invalid")
//        }
//    }
//
//
//    static func validateAddCateLevelCell(cell: AddCateLevelCell) throws -> Void {
//
//        if cell.nameTF.text == nil {
//            throw ValidationError.AddCateNameCell("Name Field is null")
//        }
//        if validateName(name: cell.nameTF.text!) == false {
//            return
//        }
//        else {
//            throw ValidationError.AddCateNameCell("Name invalid")
//        }
//    }
//
//
//
//    // MARK: Helpers
//
//    static public func validateName(name: String) -> Bool {
//
//        // Length be 18 characters max and 3 characters minimum, you can always modify.
//        let nameRegex = "^\\w{3,18}$"
//        let trimmedString = name.trimmingCharacters(in: .whitespaces)
//        let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
//        let isValidateName = validateName.evaluate(with: trimmedString)
//        return isValidateName
//    }
//}
//
//enum ValidationError: Error {
//
//    case AddCateImageCell(String)
//    case AddCateNameCell(String)
//    case AddCateLevelCell(String)
//}
