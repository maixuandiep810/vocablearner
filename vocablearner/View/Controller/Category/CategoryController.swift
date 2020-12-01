//
//  VocabularyController.swift
//  vocablearner
//
//  Created by Rocky on 10/23/20.
//

import UIKit
import RealmSwift

class CategoryController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: Properties
    
    @IBOutlet weak var categoryClt: UICollectionView!
    var categoryHeaderCell: CategoryHeaderCell?
    var levelPK: UIPickerView?
    var listCategoryModel = List<CategoryModel>()
    
    
    // MARK: Life - cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = StoryboardConstVar.CategoryControllerNavTitle
        loadCategory(pickerString: CurrentViewSetting.shared.pickerIdString)
    }
    
    
    // MARK: IBActions
    
    @IBAction func testButtonTouchUpInside(_ sender: Any) {
        let testButton: GoTestControllerButton = sender as! GoTestControllerButton
        gotoTestController(testButton: testButton)
    }
    
    @IBAction func addTopicTouchUpInside(_ sender: Any) {
        gotoAddCategoryController()
    }
    
    
}



extension CategoryController {
    
    // MARK: UICollectionViewDelegate, UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listCategoryModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoryCell = self.categoryClt.dequeueReusableCell(withReuseIdentifier: StoryboardId.CategoryCellID, for: indexPath) as! CategoryCell
        cell.navigationParentController = self.navigationController!
        cell.parentController = self
        cell.data = listCategoryModel[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell: CategoryCell = self.categoryClt.cellForItem(at: indexPath) as! CategoryCell
        let controller: VocabularyController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardId.VocabularyControllerID) as! VocabularyController
        
        if let categoryModel = cell.data {
            controller.categoryModel = categoryModel
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (kind == UICollectionView.elementKindSectionHeader) {
            let headerView: CategoryHeaderCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: StoryboardId.AddCustomTopicHeaderID, for: indexPath) as! CategoryHeaderCell
            self.categoryHeaderCell = headerView
            self.categoryHeaderCell?.levelTF.text = CurrentViewSetting.shared.pickerIdString
            configUICategoryHeaderCell()
            return headerView
        }
        fatalError()
    }
    
    // MARK: UIPickerViewDelegate, UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return LevelOptions.pickerData.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return LevelOptions.pickerData[row] }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard self.categoryHeaderCell != nil else {
            return
        }
        self.categoryHeaderCell?.levelTF.text = LevelOptions.pickerData[row]
    }
    
    // MARK: Private Methods
    
    func loadCategory(pickerString: String) {
        
        var levelIdValue = ""
        var isDifficultValue = "2"
        var isTodoTestValue = "2"
        
        switch LevelOptions.pickerId[pickerString]! {
        case LevelOptions.pickerId["All"]:
            levelIdValue = String(0)
            break
        case LevelOptions.pickerId["A1"]:
            levelIdValue = String(LevelOptions.pickerId[pickerString]!)
            break
        case LevelOptions.pickerId["A2"]:
            levelIdValue = String(LevelOptions.pickerId[pickerString]!)
            break
        case LevelOptions.pickerId["B1"]:
            levelIdValue = String(LevelOptions.pickerId[pickerString]!)
            break
        case LevelOptions.pickerId["B2"]:
            levelIdValue = String(LevelOptions.pickerId[pickerString]!)
            break
        case LevelOptions.pickerId["C1"]:
            levelIdValue = String(LevelOptions.pickerId[pickerString]!)
            break
        case LevelOptions.pickerId["C2"]:
            levelIdValue = String(LevelOptions.pickerId[pickerString]!)
            break
        case LevelOptions.pickerId["Difficult"]:
            levelIdValue = String(0)
            isDifficultValue = String(1)
            break
        case LevelOptions.pickerId["Todo Test"]:
            levelIdValue = String(0)
            isDifficultValue = String(2)
            isTodoTestValue = String(1)
            break
        case LevelOptions.pickerId["Test"]:
            levelIdValue = String(0)
            isDifficultValue = String(2)
            isTodoTestValue = String(0)
            break
        default:
            break
        }
        self.loadCategory(userId: String(CurrentUser.shared.user!.id), levelIdValue: levelIdValue, isDifficultValue: isDifficultValue, isTodoTestValue: isTodoTestValue)
    }
    
    func loadCategory(userId: String, levelIdValue: String, isDifficultValue: String, isTodoTestValue: String) {
        BaseClient.shared.getCategoryWithUrl(userId: userId, levelIdValue: levelIdValue, isDifficultValue: isDifficultValue, isTodoTestValue: isTodoTestValue,
            completion:{ (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
                if(isSuccess!) {
                    self.listCategoryModel = value as! List<CategoryModel>
                    self.categoryClt.reloadData()
                }
            }
        )
    }
    
    func gotoTestController(testButton: GoTestControllerButton) -> Void {
        let controller: TestController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardId.TestControllerID) as! TestController
        if let data = testButton.categoryModel {
            controller.categoryModel = data
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func gotoAddCategoryController() -> Void {
        let controller: AddCategoryController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardId.AddCategoryControllerID) as! AddCategoryController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func configUICategoryHeaderCell() -> Void {
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
        
        self.categoryHeaderCell!.levelTF.inputView = self.levelPK!
        self.categoryHeaderCell!.levelTF.inputAccessoryView = toolBar
        self.categoryHeaderCell!.levelTF.text = CurrentViewSetting.shared.pickerIdString
    }
      
    
    // MARK: Target Action
    
    @objc func levelPickerDone() -> Void {
        self.categoryHeaderCell!.levelTF.resignFirstResponder()
        CurrentViewSetting.shared.pickerIdString = self.categoryHeaderCell!.levelTF.text!
        loadCategory(pickerString: CurrentViewSetting.shared.pickerIdString)
    }
    @objc func levelPickerCancel() -> Void {
        self.categoryHeaderCell!.levelTF.resignFirstResponder()
    }
    
}

// MARK: TODO
/**
 Focus selected row PICKER
 */




























/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

//
//let controller: TestController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardId.TestControllerID) as! TestController
//controller.categoryModel = categoryModel
//self.navigationController?.pushViewController(controller, animated: true)
