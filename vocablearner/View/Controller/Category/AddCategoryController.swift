//
//  AddCategoryController.swift
//  vocablearner
//
//  Created by Rocky on 11/12/20.
//

import UIKit

class AddCategoryController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    // MARK: Properties
    
    @IBOutlet weak var cateboryTBL: UITableView!
        
    var levelPK: UIPickerView?
    var indexPathDict: [String:IndexPath] = Dictionary()
    var cellDict: [String: Any] = Dictionary()
    var imageCell: AddCateImageCell?
    var nameCell: AddCateNameCell?
    var levelCell: AddCateLevelCell?
    
    var categoryModel: CategoryModel?
    var isDetail = false
    var isFirstLoad = true
    let addCateRequest = AddCateRequest()
    
    
    
    // MARK: Life-Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configUIViewDidLoad()
        self.cateboryTBL.beginUpdates()
        self.cateboryTBL.endUpdates()
        configKeyBoard()
        configTapTextField()
    }
    override func viewWillAppear(_ animated: Bool) {
        configUIViewWillAppear()
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
            imageCell = cell
            return cell
            
        case AddCategoryTableCell_ENUM.NameCellID.rawValue:
            let cell: AddCateNameCell = self.cateboryTBL.dequeueReusableCell(withIdentifier: AddCategoryTableCell_ENUM.NameCellID.cellID) as! AddCateNameCell
            cell.configViewUI()
            self.indexPathDict[AddCategoryTableCell_ENUM.NameCellID.cellID] = indexPath
            nameCell = cell
            return cell
            
        case AddCategoryTableCell_ENUM.LevelCellID.rawValue:
            let cell: AddCateLevelCell = self.cateboryTBL.dequeueReusableCell(withIdentifier: AddCategoryTableCell_ENUM.LevelCellID.cellID) as! AddCateLevelCell
            cell.configViewUI()
            self.indexPathDict[AddCategoryTableCell_ENUM.LevelCellID.cellID] = indexPath
            levelCell = cell
            configUILevelCell()
            return cell
            
        default:
            let cell = self.cateboryTBL.dequeueReusableCell(withIdentifier: AddCategoryTableCell_ENUM.Default.cellID)!
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
    
    
    func configUIViewWillAppear() -> Void {
                
        if isDetail {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Update", style: .plain, target: self, action: #selector(updateTapped))
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Category", style: .plain, target: self, action: #selector(returnTapped))
        }
        else {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTapped))
        }
    }
    
    func configUIViewDidLoad() {
        
        if isDetail {
            loadUIDetail()
        }
        
        // Init tap gesture
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func configUILevelCell() -> Void {
        
        let cell = self.levelCell as! AddCateLevelCell
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
    
    func loadUIDetail() -> Void {
        
        guard let data = categoryModel else {return}
        
        if(data.imageUrl.count > 0 && data.imageView == nil){
            imageCell?.vocabularyImage.sd_setImage(with: URL(string: "\(API.kFileUrl + data.imageUrl)")!, placeholderImage: UIImage(named: "no_image_banner"))
        }
        
        nameCell?.nameTF.text = data.name
        levelCell?.levelTF.text = String(data.isDifficult)
        
    }
    
    
    
    
    
    // MARK: Target Actions
    
    @objc func updateTapped() -> Void {
        
        gotoCategoryController()
    }

    @objc func returnTapped() -> Void {
        
        gotoCategoryController()
    }

    
    @objc func addTapped() -> Void {
        
        if getData() && validationRequired() {
            addCateRequest.userId = String(CurrentUser.shared.user!.id)
            addCateRequest.description = ""
            addCateRequest.description = addCateRequest.description == nil ? "" : addCateRequest.description
            alertValidation(yesOption: true, noOption: true, message: "Add \n    a topic", completionYes: {
                self.uploadAddCategory(addCateRequest: self.addCateRequest)
            }, completionNo: {
                
            })
            
        }
    }
    
    @objc func cancelTapped() -> Void {
        
        gotoCategoryController()
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
    
    @objc func levelPickerDone() -> Void {
        
        let cell = self.cellDict[AddCategoryTableCell_ENUM.LevelCellID.cellID] as! AddCateLevelCell
        cell.levelTF.resignFirstResponder()
    }
    @objc func levelPickerCancel() -> Void {
        
        let cell = self.cellDict[AddCategoryTableCell_ENUM.LevelCellID.cellID] as! AddCateLevelCell
        cell.levelTF.resignFirstResponder()
    }
    
    

    
    
    
    
    
    
    
    
    
    // MARK: Privates
    
    func gotoCategoryController() -> Void {
    
        self.navigationController?.popViewController(animated: true)
    }
    
    func getData() -> Bool {
        
        if imageCell == nil || nameCell == nil || levelCell == nil {
            return false
        }
        
        
        self.addCateRequest.name = self.nameCell!.nameTF.text!
        
        if self.levelCell!.levelTF.text == "True" {
            self.addCateRequest.isDifficult = true
        }
        else {
            self.addCateRequest.isDifficult = false
        }
        

        if self.imageCell!.info == nil || self.imageCell!.info?[UIImagePickerController.InfoKey.imageURL] == nil {
            self.addCateRequest.imageURL = nil
        }
        else {
            let stringNSURL = (self.imageCell!.info![UIImagePickerController.InfoKey.imageURL] as! NSURL).absoluteString!
            let valueURL = URL(string: stringNSURL)!
            self.addCateRequest.imageURL = valueURL
        }
        
        
        return true
    }
    
    func validationRequired() -> Bool {
        
        if self.addCateRequest.name == nil || self.addCateRequest.name!.isEmpty {
            alertValidation(yesOption: true, noOption: false, message: "Name Field is required")
            return false
        }
        
        return true
    }
    

    func uploadAddCategory(addCateRequest: AddCateRequest) -> Void {
        BaseClient.shared.addCategory(addCateRequest: addCateRequest)
        { (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
            if(isSuccess!) {
                let alert = UIAlertController(title: "Yes", message: "Yes", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {
                    action in
                    self.gotoCategoryController()
                }))
                self.present(alert, animated: true)
                
            } else {
                let alert = UIAlertController(title: "No", message: "No", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }
}
		
