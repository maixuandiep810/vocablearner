//
//  AddCateNameCell.swift
//  vocablearner
//
//  Created by Rocky on 11/18/20.
//

import UIKit

class AddCateNameCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var nameTF: UITextField!
    weak var delegate: AddCateTextFieldDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension AddCateNameCell {
    func configViewUI() -> Void {
        self.nameTF.delegate = self
        self.nameTF.layer.borderWidth = UIConfig.defaultBorderWidth
        self.nameTF.layer.borderColor = UIConfig.defaultBorderColor
        self.nameTF.layer.masksToBounds = true
        self.nameTF.layer.cornerRadius = 10
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.delegate?.AddCateTextFieldBeginEditing(cellID: AddCategoryTableCell_ENUM.NameCellID.cellID)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.delegate?.AddCateTextFieldShouldReturn()
        return false
    }
}
