//
//  AddCateLevelCell.swift
//  vocablearner
//
//  Created by Rocky on 11/18/20.
//

import UIKit

class AddCateLevelCell: UITableViewCell {
    
    @IBOutlet weak var levelTF: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension AddCateLevelCell {
    
    func configViewUI() -> Void {

        self.levelTF.layer.borderWidth = UIConfig.defaultBorderWidth
        self.levelTF.layer.borderColor = UIConfig.defaultBorderColor
        self.levelTF.layer.masksToBounds = true
        self.levelTF.layer.cornerRadius = 10
    }
}





//func textFieldDidBeginEditing(_ textField: UITextField) {
//    self.delegate?.AddCateTextFieldBeginEditing(cellID: AddCategoryTableCell_ENUM.LevelCellID.cellID, textField: levelTF)
//}
//func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//    self.delegate?.AddCateTextFieldShouldReturn(cellID: AddCategoryTableCell_ENUM.LevelCellID.cellID, textField: levelTF)
//    return false
//}





//
//@IBAction func levelTFUpInside(_ sender: Any) {
//    self.delegate?.AddCateTextFieldBeginEditing(cellID: AddCategoryTableCell_ENUM.LevelCellID.cellID)
//}
