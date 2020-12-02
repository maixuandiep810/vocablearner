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
    var cellDict: [String: Any] = Dictionary()
    var addVocabRequest = AddVocabularyRequest()
    
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
            self.cellDict[AddVocabularyTableCell_ENUM.ImageCellID.cellID] = cell
            return cell!
            
        case AddVocabularyTableCell_ENUM.WordCellID.rawValue:
            let cell = self.addVocabTBL.dequeueReusableCell(withIdentifier: AddVocabularyTableCell_ENUM.WordCellID.cellID)
            self.cellDict[AddVocabularyTableCell_ENUM.WordCellID.cellID] = cell
            return cell!
            
        case AddVocabularyTableCell_ENUM.MeaningCellID.rawValue:
            let cell = self.addVocabTBL.dequeueReusableCell(withIdentifier: AddVocabularyTableCell_ENUM.MeaningCellID.cellID)
            self.cellDict[AddVocabularyTableCell_ENUM.MeaningCellID.cellID] = cell
            return cell!
            
        case AddVocabularyTableCell_ENUM.IPACellID.rawValue:
            let cell = self.addVocabTBL.dequeueReusableCell(withIdentifier: AddVocabularyTableCell_ENUM.IPACellID.cellID)
            self.cellDict[AddVocabularyTableCell_ENUM.IPACellID.cellID] = cell
            return cell!
            
        case AddVocabularyTableCell_ENUM.AudioCellID.rawValue:
            let cell = self.addVocabTBL.dequeueReusableCell(withIdentifier: AddVocabularyTableCell_ENUM.AudioCellID.cellID)
            self.cellDict[AddVocabularyTableCell_ENUM.AudioCellID.cellID] = cell
            return cell!
            
        case AddVocabularyTableCell_ENUM.DefinitionCellID.rawValue:
            let cell = self.addVocabTBL.dequeueReusableCell(withIdentifier: AddVocabularyTableCell_ENUM.DefinitionCellID.cellID)
            self.cellDict[AddVocabularyTableCell_ENUM.DefinitionCellID.cellID] = cell
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
            
        case AddVocabularyTableCell_ENUM.WordCellID.rawValue:
            return AddVocabularyTableCell_ENUM.WordCellID.heightCell
            
        case AddVocabularyTableCell_ENUM.MeaningCellID.rawValue:
            return AddVocabularyTableCell_ENUM.MeaningCellID.heightCell
            
        case AddVocabularyTableCell_ENUM.IPACellID.rawValue:
            return AddVocabularyTableCell_ENUM.IPACellID.heightCell
            
        case AddVocabularyTableCell_ENUM.AudioCellID.rawValue:
            return AddVocabularyTableCell_ENUM.AudioCellID.heightCell
            
        case AddVocabularyTableCell_ENUM.DefinitionCellID.rawValue:
            return AddVocabularyTableCell_ENUM.DefinitionCellID.heightCell
            
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
            
        case AddVocabularyTableCell_ENUM.WordCellID.rawValue:
            return AddVocabularyTableCell_ENUM.WordCellID.heightCell
            
        case AddVocabularyTableCell_ENUM.MeaningCellID.rawValue:
            return AddVocabularyTableCell_ENUM.MeaningCellID.heightCell
            
        case AddVocabularyTableCell_ENUM.IPACellID.rawValue:
            return AddVocabularyTableCell_ENUM.IPACellID.heightCell
            
        case AddVocabularyTableCell_ENUM.AudioCellID.rawValue:
            return AddVocabularyTableCell_ENUM.AudioCellID.heightCell
            
        case AddVocabularyTableCell_ENUM.DefinitionCellID.rawValue:
            return AddVocabularyTableCell_ENUM.DefinitionCellID.heightCell
            
            //        case AddVocabularyTableCell_ENUM.DefinitionCellID.rawValue:
            //            return AddVocabularyTableCell_ENUM.DefinitionCellID.heightCell
            
        default:
            return CGFloat(100)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoryboardId.SugueIpaKeyboardController {
            if let nextViewController = segue.destination as? IpaKeyboardController {
                let cell: AddVocabIpaCell = self.cellDict[AddVocabularyTableCell_ENUM.IPACellID.cellID] as! AddVocabIpaCell
                nextViewController.parentCell = cell
                nextViewController.ipaTF.text = cell.ipaLB.text
            }
        }
    }
    
    func configUIWillAppear() -> Void {
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTapped))
    }
    
    @objc func addTapped() -> Void {
        
        if getData() {
            uploadAddCategory(addCateRequest: addCateRequest)
        }
    }
    @objc func cancelTapped() -> Void {
        
        gotoCategoryController()
    }
    
    func getData() -> Bool {
        
        let imageCell = self.cellDict[AddVocabularyTableCell_ENUM.ImageCellID.cellID] as! AddVocabImageCell
        let wordCell = self.cellDict[AddVocabularyTableCell_ENUM.WordCellID.cellID] as! AddVocabWordCell
        let meaningCell = self.cellDict[AddVocabularyTableCell_ENUM.MeaningCellID.cellID] as! AddVocabMeaningCell
        let ipaCell = self.cellDict[AddVocabularyTableCell_ENUM.IPACellID.cellID] as! AddVocabIpaCell
        let audioCell = self.cellDict[AddVocabularyTableCell_ENUM.AudioCellID.cellID] as! AddVocabAudioCell
        let definitionCell = self.cellDict[AddVocabularyTableCell_ENUM.DefinitionCellID.cellID] as! AddVocabDefinitionCell
        
        
        if wordCell.wordTF.text == "" {
            alertValidation(yesOption: true, noOption: false, message: "Word Field is required")
            return false
        }
        self.addVocabRequest.word = wordCell.wordTF.text!
        
        if wordCell.wordTF.text == "" {
            alertValidation(yesOption: true, noOption: false, message: "Word Field is required")
            return false
        }
        self.addVocabRequest.word = wordCell.wordTF.text!
        
        
        
        if levelCell.levelTF.text == "True" {
            self.addCateRequest.isDifficult = true
        }
        else {
            self.addCateRequest.isDifficult = false
        }
        
        if imageCell.info == nil || imageCell.info?[UIImagePickerController.InfoKey.imageURL] == nil {
            self.addCateRequest.imageURL = nil
        }
        else {
            let stringNSURL = (imageCell.info![UIImagePickerController.InfoKey.imageURL] as! NSURL).absoluteString!
            let valueURL = URL(string: stringNSURL)!
            self.addCateRequest.imageURL = valueURL
        }
        
        return true
    }
    
}

