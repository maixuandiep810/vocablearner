//
//  AddCateNameCell.swift
//  vocablearner
//
//  Created by Rocky on 11/18/20.
//

import UIKit

class AddCateNameCell: UITableViewCell {

    @IBOutlet weak var nameTF: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension AddCateNameCell {
    
    func configViewUI() -> Void {
        
        self.nameTF.layer.borderWidth = UIConfig.defaultBorderWidth
        self.nameTF.layer.borderColor = UIConfig.defaultBorderColor
        self.nameTF.layer.masksToBounds = true
        self.nameTF.layer.cornerRadius = 10
    }
}








//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        self.delegate?.AddCateTextFieldBeginEditing(cellID: AddCategoryTableCell_ENUM.NameCellID.cellID, textField: nameTF)
//    }
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.delegate?.AddCateTextFieldShouldReturn(cellID: AddCategoryTableCell_ENUM.NameCellID.cellID, textField: nameTF)
//        return false
//    }
