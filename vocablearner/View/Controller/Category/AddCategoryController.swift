//
//  AddCategoryController.swift
//  vocablearner
//
//  Created by Rocky on 11/12/20.
//

import UIKit

class AddCategoryController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddCateTextViewDelegate {
    

    // MARK: Properties
    @IBOutlet weak var cateboryTBL: UITableView!
    var nameTV: UITextView?
    var indexPathDict: [String:IndexPath] = Dictionary()
    var isFirstLoad = true
    
    
    // MARK: Life-Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cateboryTBL.beginUpdates()
        self.cateboryTBL.endUpdates()

    }
    
    // MARK: IBActions
    

}

extension AddCategoryController {
    
    // MARK: UITableViewDataSource, UITableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case AddCategoryTableCell_ENUM.ImageCellID.rawValue:
            let cell: AddCateImageCell = self.cateboryTBL.dequeueReusableCell(withIdentifier: AddCategoryTableCell_ENUM.ImageCellID.cellID) as! AddCateImageCell
            return cell
        case AddCategoryTableCell_ENUM.NameID.rawValue:
            let cell: AddCateNameCell = self.cateboryTBL.dequeueReusableCell(withIdentifier: AddCategoryTableCell_ENUM.NameID.cellID) as! AddCateNameCell
            self.nameTV = cell.nameTV
            cell.configViewUI()
            cell.delegate = self
            self.indexPathDict[AddCategoryTableCell_ENUM.NameID.cellID] = indexPath
            return cell
            
        default:
            return self.cateboryTBL.dequeueReusableCell(withIdentifier: AddCategoryTableCell_ENUM.Default.cellID)!
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case AddCategoryTableCell_ENUM.ImageCellID.rawValue:
            return AddCategoryTableCell_ENUM.ImageCellID.heightCell
        case AddCategoryTableCell_ENUM.NameID.rawValue:
            if isFirstLoad {
                isFirstLoad = false
                return AddCategoryTableCell_ENUM.NameID.heightCell
            }
            return UITableView.automaticDimension
//        return CGFloat(200)
            
        default:
            return CGFloat(1000)
        }
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case AddCategoryTableCell_ENUM.ImageCellID.rawValue:
            return AddCategoryTableCell_ENUM.ImageCellID.heightCell
        case AddCategoryTableCell_ENUM.NameID.rawValue:
            return UITableView.automaticDimension
            
        default:
            return AddCategoryTableCell_ENUM.Default.heightCell
        }
    }

    // MARK: AddCateTextViewDelegate
    func AddCateTextViewBeginEditing(cellID: String) {
        self.cateboryTBL.scrollToRow(at: self.indexPathDict[cellID]!, at: .top, animated: true)
    }
    
    func AddCateTextViewDidChange(cellID: String) {
        self.cateboryTBL.beginUpdates()
        self.cateboryTBL.endUpdates()
    }
    
    
    // MARK: Target Actions
    
}
