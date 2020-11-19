//
//  AddCategoryController.swift
//  vocablearner
//
//  Created by Rocky on 11/12/20.
//

import UIKit

class AddCategoryController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource, AddCateTextFieldDelegate {
    
    
    // MARK: Properties
    @IBOutlet weak var cateboryTBL: UITableView!

    var levelPK: UIPickerView?
    var levelCell: AddCateLevelCell?
    var indexPathDict: [String:IndexPath] = Dictionary()
    var isFirstLoad = true
    
    
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
            return cell
        case AddCategoryTableCell_ENUM.NameCellID.rawValue:
            let cell: AddCateNameCell = self.cateboryTBL.dequeueReusableCell(withIdentifier: AddCategoryTableCell_ENUM.NameCellID.cellID) as! AddCateNameCell
            cell.configViewUI()
            cell.delegate = self
            self.indexPathDict[AddCategoryTableCell_ENUM.NameCellID.cellID] = indexPath
            return cell
        case AddCategoryTableCell_ENUM.LevelCellID.rawValue:
            let cell: AddCateLevelCell = self.cateboryTBL.dequeueReusableCell(withIdentifier: AddCategoryTableCell_ENUM.LevelCellID.cellID) as! AddCateLevelCell
            self.levelCell = cell
            cell.delegate = self
            cell.configViewUI()
            self.indexPathDict[AddCategoryTableCell_ENUM.LevelCellID.cellID] = indexPath
            configUILevelCell()
            return cell
            
        default:
            return self.cateboryTBL.dequeueReusableCell(withIdentifier: AddCategoryTableCell_ENUM.Default.cellID)!
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
            return CGFloat(1000)
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
        return LevelOptions.pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return LevelOptions.pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard self.levelCell != nil else {
            return
        }
        self.levelCell?.levelTF.text = LevelOptions.pickerData[row]
    }
    
    // MARK: AddCateTextFieldDelegate
    func AddCateTextFieldBeginEditing(cellID: String) {
        self.cateboryTBL.scrollToRow(at: self.indexPathDict[cellID]!, at: .top, animated: true)
    }
    func AddCateTextFieldShouldReturn() {
        dismissKeyboard()
    }
    
    
    // MARK: Target Actions
    @objc func addTapped() -> Void {
        gotoCategoryController()
    }
    @objc func cancelTapped() -> Void {
        gotoCategoryController()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func levelPickerDone() -> Void {
        self.levelCell!.levelTF.resignFirstResponder()
        //        let levelTFText = self.levelCell!.levelTF.text
        //        let levelId = String(LevelOptions.pickerId[levelTFText!]!)
    }
    @objc func levelPickerCancel() -> Void {
        self.levelCell!.levelTF.resignFirstResponder()
    }
    
    // MARK: Properties
    
    func configUIWillAppear() -> Void {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTapped))
    }
    
    func gotoCategoryController() -> Void {
        self.navigationController?.popViewController(animated: true)
    }
    
    func configViewDidLoad() {
        // Init tap gesture
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func configUILevelCell() -> Void {
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
        
        self.levelCell!.levelTF.inputView = self.levelPK!
        self.levelCell!.levelTF.inputAccessoryView = toolBar
        self.levelCell!.levelTF.text = LevelOptions.pickerData[1]
    }
}
