//
//  AddCateDefinitionCell.swift
//  vocablearner
//
//  Created by Rocky on 11/18/20.
//

import UIKit

class AddCateDefinitionCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}



////
////  AddCateNameCell.swift
////  vocablearner
////
////  Created by Rocky on 11/18/20.
////
//
//import UIKit
//
//protocol AddCateTextViewDelegate: class {
//    func AddCateTextViewBeginEditing(cellID: String)
//    func AddCateTextViewDidChange(cellID: String)
//}
//
//class AddCateNameCell: UITableViewCell, UITextViewDelegate {
//
//    @IBOutlet weak var nameTV: UITextView!
//    weak var delegate: AddCateTextViewDelegate?
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
//
//}
//
//extension AddCateNameCell {
//    func configViewUI() -> Void {
//        self.nameTV.layer.borderWidth = UIConfig.defaultBorderWidth
//        self.nameTV.layer.borderColor = UIConfig.defaultBorderColor
//        self.nameTV.layer.masksToBounds = true
//        self.nameTV.layer.cornerRadius = 40
//    }
//
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        self.delegate?.AddCateTextViewBeginEditing(cellID: AddCategoryTableCell_ENUM.NameID.cellID)
//    }
//
//    func textViewDidChange(_ textView: UITextView) {
//        self.delegate?.AddCateTextViewDidChange(cellID: AddCategoryTableCell_ENUM.NameID.cellID)
//    }
//}


//func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    switch indexPath.row {
//    case AddCategoryTableCell_ENUM.ImageCellID.rawValue:
//        return AddCategoryTableCell_ENUM.ImageCellID.heightCell
//    case AddCategoryTableCell_ENUM.NameCellID.rawValue:
//        if isFirstLoad {
//            isFirstLoad = false
//            return AddCategoryTableCell_ENUM.NameCellID.heightCell
//        }
//        return UITableView.automaticDimension
////        return CGFloat(200)
//        
//    default:
//        return CGFloat(1000)
//    }
//}
