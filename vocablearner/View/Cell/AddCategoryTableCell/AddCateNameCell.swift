//
//  AddCateNameCell.swift
//  vocablearner
//
//  Created by Rocky on 11/18/20.
//

import UIKit

protocol AddCateTextViewDelegate: class {
    func AddCateTextViewBeginEditing(cellID: String)
    func AddCateTextViewDidChange(cellID: String)
}

class AddCateNameCell: UITableViewCell, UITextViewDelegate {

    @IBOutlet weak var nameTV: UITextView!
    weak var delegate: AddCateTextViewDelegate?
    
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
        self.nameTV.layer.borderWidth = UIConfig.defaultBorderWidth
        self.nameTV.layer.borderColor = UIConfig.defaultBorderColor
        self.nameTV.layer.masksToBounds = true
        self.nameTV.layer.cornerRadius = 40
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.delegate?.AddCateTextViewBeginEditing(cellID: AddCategoryTableCell_ENUM.NameID.cellID)
    }

    func textViewDidChange(_ textView: UITextView) {
        self.delegate?.AddCateTextViewDidChange(cellID: AddCategoryTableCell_ENUM.NameID.cellID)
    }
}
