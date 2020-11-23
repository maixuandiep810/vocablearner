//
//  AddVocabularyController.swift
//  vocablearner
//
//  Created by Rocky on 11/18/20.
//

import UIKit

class AddVocabularyController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var addVocabTBL: UITableView!
    // MARK: Properties
    var categoryId = 0
    var categoryModel = CategoryModel()
    
    
    // MARK: Life-Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configKeyBoard()
        configTapTextField()
    }
    
    
    // MARK: IBActions
}



extension AddVocabularyController {
    
    
    // MARK: UITableViewDataSource, UITableViewDelegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        
        case AddVocabularyTableCell_ENUM.ImageCellID.rawValue:
            let cell = self.addVocabTBL.dequeueReusableCell(withIdentifier: AddVocabularyTableCell_ENUM.ImageCellID.cellID)
            return cell!
            
        case AddVocabularyTableCell_ENUM.NameCellID.rawValue:
            let cell = self.addVocabTBL.dequeueReusableCell(withIdentifier: AddVocabularyTableCell_ENUM.NameCellID.cellID)
            return cell!

        case AddVocabularyTableCell_ENUM.IPACellID.rawValue:
            let cell = self.addVocabTBL.dequeueReusableCell(withIdentifier: AddVocabularyTableCell_ENUM.IPACellID.cellID)
            return cell!

        case AddVocabularyTableCell_ENUM.AudioCellID.rawValue:
            let cell = self.addVocabTBL.dequeueReusableCell(withIdentifier: AddVocabularyTableCell_ENUM.AudioCellID.cellID)

            return cell!
            
//        case AddVocabularyTableCell_ENUM.DefinitionCellID.rawValue:
//            let cell = self.addVocabTBL.dequeueReusableCell(withIdentifier: AddVocabularyTableCell_ENUM.DefinitionCellID.cellID)
//            return cell!
            
        default:
            let cell = self.addVocabTBL.dequeueReusableCell(withIdentifier: AddVocabularyTableCell_ENUM.Default.cellID)
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {

        case AddVocabularyTableCell_ENUM.ImageCellID.rawValue:
            return AddVocabularyTableCell_ENUM.ImageCellID.heightCell

        case AddVocabularyTableCell_ENUM.NameCellID.rawValue:
            return AddVocabularyTableCell_ENUM.NameCellID.heightCell

        case AddVocabularyTableCell_ENUM.IPACellID.rawValue:
            return AddVocabularyTableCell_ENUM.IPACellID.heightCell

        case AddVocabularyTableCell_ENUM.AudioCellID.rawValue:
            return AddVocabularyTableCell_ENUM.AudioCellID.heightCell

 //       case AddVocabularyTableCell_ENUM.DefinitionCellID.rawValue:
 //           return UITableView.automaticDimension

        default:
            return CGFloat(1000)
        }
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {

        switch indexPath.row {

        case AddVocabularyTableCell_ENUM.ImageCellID.rawValue:
            return AddVocabularyTableCell_ENUM.ImageCellID.heightCell

        case AddVocabularyTableCell_ENUM.NameCellID.rawValue:
            return AddVocabularyTableCell_ENUM.NameCellID.heightCell

        case AddVocabularyTableCell_ENUM.IPACellID.rawValue:
            return AddVocabularyTableCell_ENUM.IPACellID.heightCell

        case AddVocabularyTableCell_ENUM.AudioCellID.rawValue:
            return AddVocabularyTableCell_ENUM.AudioCellID.heightCell

//        case AddVocabularyTableCell_ENUM.DefinitionCellID.rawValue:
//            return AddVocabularyTableCell_ENUM.DefinitionCellID.heightCell

        default:
            return CGFloat(1000)
        }
    }
    
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        dismissKeyboard()
        return false
    }
    
    
    // MARK: ConfigUIs
    
    func configKeyBoard() -> Void {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    func configTapTextField() {
        
        // Init tap gesture
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    
    // MARK: Actions
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    

    @objc func keyboardWillHide(notification: NSNotification) {
        
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    
    // MARK: Private Methods

}
