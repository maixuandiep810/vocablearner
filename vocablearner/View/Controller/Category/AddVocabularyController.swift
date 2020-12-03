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
    var imageCell: AddVocabImageCell?
    var wordCell: AddVocabWordCell?
    var meaningCell: AddVocabMeaningCell?
    var ipaCell: AddVocabIpaCell?
    var audioCell: AddVocabAudioCell?
    var definitionCell: AddVocabDefinitionCell?
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
            let cell: AddVocabImageCell = self.addVocabTBL.dequeueReusableCell(withIdentifier: AddVocabularyTableCell_ENUM.ImageCellID.cellID) as! AddVocabImageCell
            imageCell = cell
            return cell
            
        case AddVocabularyTableCell_ENUM.WordCellID.rawValue:
            let cell: AddVocabWordCell = self.addVocabTBL.dequeueReusableCell(withIdentifier: AddVocabularyTableCell_ENUM.WordCellID.cellID) as! AddVocabWordCell
            wordCell = cell
            return cell
            
        case AddVocabularyTableCell_ENUM.MeaningCellID.rawValue:
            let cell: AddVocabMeaningCell = self.addVocabTBL.dequeueReusableCell(withIdentifier: AddVocabularyTableCell_ENUM.MeaningCellID.cellID) as! AddVocabMeaningCell
            meaningCell = cell
            return cell
            
        case AddVocabularyTableCell_ENUM.IPACellID.rawValue:
            let cell: AddVocabIpaCell = self.addVocabTBL.dequeueReusableCell(withIdentifier: AddVocabularyTableCell_ENUM.IPACellID.cellID) as! AddVocabIpaCell
            ipaCell = cell
            return cell
            
        case AddVocabularyTableCell_ENUM.AudioCellID.rawValue:
            let cell: AddVocabAudioCell = self.addVocabTBL.dequeueReusableCell(withIdentifier: AddVocabularyTableCell_ENUM.AudioCellID.cellID) as! AddVocabAudioCell
            audioCell = cell
            return cell
            
        case AddVocabularyTableCell_ENUM.DefinitionCellID.rawValue:
            let cell: AddVocabDefinitionCell = self.addVocabTBL.dequeueReusableCell(withIdentifier: AddVocabularyTableCell_ENUM.DefinitionCellID.cellID) as! AddVocabDefinitionCell
            definitionCell = cell
            return cell
            
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
    
    @objc func addTapped() -> Void {
        
        if getData() && validationRequired() {
            self.addVocabRequest.sentence = self.addVocabRequest.sentence == nil ? "" : self.addVocabRequest.sentence
            self.addVocabRequest.definition = self.addVocabRequest.definition == nil ? "" : self.addVocabRequest.definition
            //            uploadAddCategory(addCateRequest: addCateRequest)
        }
    }
    @objc func cancelTapped() -> Void {
        
        //        gotoCategoryController()
    }
    
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
    
    
    func getData() -> Bool {
        
        if imageCell == nil || wordCell == nil || meaningCell == nil || ipaCell == nil || audioCell == nil || definitionCell == nil {
            return false
        }
        
        self.addVocabRequest.word = wordCell!.wordTF.text
        self.addVocabRequest.meaning = meaningCell!.meaningTF.text
        self.addVocabRequest.sentence = ipaCell!.ipaLB.text
        self.addVocabRequest.definition = definitionCell!.definitionTV.text
        self.addVocabRequest.audioURL = audioCell!.audioURL
        
        if imageCell!.info == nil || imageCell!.info?[UIImagePickerController.InfoKey.imageURL] == nil {
            self.addVocabRequest.imageURL = nil
        }
        else {
            let stringNSURL = (imageCell!.info![UIImagePickerController.InfoKey.imageURL] as! NSURL).absoluteString!
            let valueURL = URL(string: stringNSURL)!
            self.addVocabRequest.imageURL = valueURL
        }
        
        return true
    }
    
    func validationRequired() -> Bool {
        if addVocabRequest.word == nil || addVocabRequest.word!.isEmpty {
            alertValidation(yesOption: true, noOption: false, message: "Word Field is required")
            return false
        }
        if addVocabRequest.meaning == nil || addVocabRequest.meaning!.isEmpty {
            alertValidation(yesOption: true, noOption: false, message: "Meaning Field is required")
            return false
        }
        return true
    }
    
    
    
}

