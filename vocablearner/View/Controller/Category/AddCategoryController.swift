//
//  AddCategoryController.swift
//  vocablearner
//
//  Created by Rocky on 11/12/20.
//

import UIKit

class AddCategoryController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, AddCateTextFieldDelegate {
    
    
    // MARK: Properties
    
    @IBOutlet weak var cateboryTBL: UITableView!
    
    var levelPK: UIPickerView?
    var indexPathDict: [String:IndexPath] = Dictionary()
    var cellDict: [String: Any] = Dictionary()
    var isFirstLoad = true
    let addCateRequest = AddCateRequest()
    
    
    
    // MARK: Life-Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configViewDidLoad()
        self.cateboryTBL.beginUpdates()
        self.cateboryTBL.endUpdates()
    }
    override func viewWillAppear(_ animated: Bool) {
        configUIWillAppear()
    }
    
    
    
    // MARK: IBActions
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        configUITapGesture()
    }
    
}

extension AddCategoryController {
    
    
    
    // MARK: UITableViewDataSource, UITableViewDelegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        
        case AddCategoryTableCell_ENUM.ImageCellID.rawValue:
            let cell: AddCateImageCell = self.cateboryTBL.dequeueReusableCell(withIdentifier: AddCategoryTableCell_ENUM.ImageCellID.cellID) as! AddCateImageCell
            self.indexPathDict[AddCategoryTableCell_ENUM.ImageCellID.cellID] = indexPath
            self.cellDict[AddCategoryTableCell_ENUM.ImageCellID.cellID] = cell
            return cell
            
        case AddCategoryTableCell_ENUM.NameCellID.rawValue:
            let cell: AddCateNameCell = self.cateboryTBL.dequeueReusableCell(withIdentifier: AddCategoryTableCell_ENUM.NameCellID.cellID) as! AddCateNameCell
            cell.configViewUI()
            cell.delegate = self
            self.indexPathDict[AddCategoryTableCell_ENUM.NameCellID.cellID] = indexPath
            self.cellDict[AddCategoryTableCell_ENUM.NameCellID.cellID] = cell
            return cell
            
        case AddCategoryTableCell_ENUM.LevelCellID.rawValue:
            let cell: AddCateLevelCell = self.cateboryTBL.dequeueReusableCell(withIdentifier: AddCategoryTableCell_ENUM.LevelCellID.cellID) as! AddCateLevelCell
            cell.delegate = self
            cell.configViewUI()
            self.indexPathDict[AddCategoryTableCell_ENUM.LevelCellID.cellID] = indexPath
            self.cellDict[AddCategoryTableCell_ENUM.LevelCellID.cellID] = cell
            configUILevelCell()
            return cell
            
        default:
            let cell = self.cateboryTBL.dequeueReusableCell(withIdentifier: AddCategoryTableCell_ENUM.Default.cellID)!
            self.indexPathDict[AddCategoryTableCell_ENUM.Default.cellID] = indexPath
            self.cellDict[AddCategoryTableCell_ENUM.Default.cellID] = cell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        
        case AddCategoryTableCell_ENUM.ImageCellID.rawValue:
            return AddCategoryTableCell_ENUM.ImageCellID.heightCell
            
        case AddCategoryTableCell_ENUM.NameCellID.rawValue:
            return AddCategoryTableCell_ENUM.NameCellID.heightCell
        //        return CGFloat(200)
        
        case AddCategoryTableCell_ENUM.LevelCellID.rawValue:
            return AddCategoryTableCell_ENUM.LevelCellID.heightCell
            
        default:
            return CGFloat(100)
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        
        case AddCategoryTableCell_ENUM.ImageCellID.rawValue:
            return AddCategoryTableCell_ENUM.ImageCellID.heightCell
        case AddCategoryTableCell_ENUM.NameCellID.rawValue:
            
            return AddCategoryTableCell_ENUM.NameCellID.heightCell
            
        case AddCategoryTableCell_ENUM.LevelCellID.rawValue:
            return AddCategoryTableCell_ENUM.LevelCellID.heightCell
            
        default:
            return AddCategoryTableCell_ENUM.Default.heightCell
        }
    }
    
    
    
    
    // MARK: UIPickerViewDelegate, UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return LevelOptions.AddCate_IsDifficult_PK_Data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return LevelOptions.AddCate_IsDifficult_PK_Data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let cell = self.cellDict[AddCategoryTableCell_ENUM.LevelCellID.cellID] as! AddCateLevelCell
        cell.levelTF.text = LevelOptions.AddCate_IsDifficult_PK_Data[row]
    }
    
    
    
    // MARK: AddCateTextFieldDelegate
    
    func AddCateTextFieldBeginEditing(cellID: String, textField: UITextField) {
        
        self.cateboryTBL.scrollToRow(at: self.indexPathDict[cellID]!, at: .top, animated: true)
    }
    
    func AddCateTextFieldShouldReturn(cellID: String, textField: UITextField) {
        
        switch cellID {
        case AddCategoryTableCell_ENUM.NameCellID.cellID:
            self.addCateRequest.name = textField.text!
        default:
            self.addCateRequest.levelId = Int(textField.text!)!
        }
        dismissKeyboard()
    }
    
    
    
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was  the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        let cell: AddCateImageCell = self.cellDict[AddCategoryTableCell_ENUM.ImageCellID.cellID] as! AddCateImageCell
        cell.info = info
        cell.vocabularyImage.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: Target Actions
    
    @objc func addTapped() -> Void {
        
        if getData() {
            uploadAddCategory(addCateRequest: addCateRequest)
        }
    }
    @objc func cancelTapped() -> Void {
        
        gotoCategoryController()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func levelPickerDone() -> Void {
        
        let cell = self.cellDict[AddCategoryTableCell_ENUM.LevelCellID.cellID] as! AddCateLevelCell
        cell.levelTF.resignFirstResponder()
    }
    @objc func levelPickerCancel() -> Void {
        
        let cell = self.cellDict[AddCategoryTableCell_ENUM.LevelCellID.cellID] as! AddCateLevelCell
        cell.levelTF.resignFirstResponder()
    }
    
    // MARK: ConfigUI
    
    func configUIWillAppear() -> Void {
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTapped))
    }
    
    func configViewDidLoad() {
        
        // Init tap gesture
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func configUILevelCell() -> Void {
        
        let cell = self.cellDict[AddCategoryTableCell_ENUM.LevelCellID.cellID] as! AddCateLevelCell
        self.levelPK = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.levelPK!.delegate = self
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(CategoryController.levelPickerDone))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(CategoryController.levelPickerCancel))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        cell.levelTF.inputView = self.levelPK!
        cell.levelTF.inputAccessoryView = toolBar
        cell.levelTF.text = LevelOptions.AddCate_IsDifficult_PK_Data[0]
    }
    
    
    func configUITapGesture() -> Void {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    
    // MARK: Properties
    
    func gotoCategoryController() -> Void {
    
        self.navigationController?.popViewController(animated: true)
    }
    
    func getData() -> Bool {
        
        let imageCell = self.cellDict[AddCategoryTableCell_ENUM.ImageCellID.cellID] as! AddCateImageCell
        let nameCell = self.cellDict[AddCategoryTableCell_ENUM.NameCellID.cellID] as! AddCateNameCell
        let levelCell = self.cellDict[AddCategoryTableCell_ENUM.LevelCellID.cellID] as! AddCateLevelCell
        
        let validation = Validation()
        
        if validation.validateAllField(nameCell: nameCell, levelCell: levelCell) == false {
            alertValidation(yesOption: true, noOption: false, message: "a", cellId: "", parentController: self)
            return false
        }
        else {
            self.addCateRequest.name = nameCell.nameTF.text!
            self.addCateRequest.levelId = LevelOptions.pickerId[levelCell.levelTF.text!]!
        }
        
        if validation.validateAddCateImageCell(cell: imageCell) == false {
            self.addCateRequest.imageURL = nil
            alertValidation(yesOption: true, noOption: true, message: "B", cellId: AddCategoryTableCell_ENUM.ImageCellID.cellID, parentController: self)
        }
        else {
            let stringNSURL = (imageCell.info![UIImagePickerController.InfoKey.imageURL] as! NSURL).absoluteString!
            let valueURL = URL(string: stringNSURL)!
            self.addCateRequest.imageURL = valueURL
        }
        
        return true
    }
    
    func alertValidation(yesOption: Bool, noOption: Bool, message: String, cellId: String, parentController: AddCategoryController) -> Void {
        
        // create the alert
        let alert = UIAlertController(title: "Notice", message: message, preferredStyle: UIAlertController.Style.alert)
        
        // add the actions (buttons)
        if yesOption {
            alert.addAction(UIAlertAction(title: "YES", style: UIAlertAction.Style.default, handler: { action in
                if cellId == AddCategoryTableCell_ENUM.ImageCellID.cellID {
                    parentController.uploadAddCategory(addCateRequest: parentController.addCateRequest)
                }
            }))
        }
        if noOption {
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: {action in
            }))
        }
        
        // show the alert
        self.present(alert, animated: true, completion: {
        })
    }
    
    func uploadAddCategory(addCateRequest: AddCateRequest) -> Void {
        BaseClient.shared.addCategory(addCateRequest: addCateRequest)
        { (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
            if(isSuccess!) {
                let alert = UIAlertController(title: "Yes", message: "Yes", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
                self.present(alert, animated: true)
                self.gotoCategoryController()
            } else {
                let alert = UIAlertController(title: "No", message: "No", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }
}
