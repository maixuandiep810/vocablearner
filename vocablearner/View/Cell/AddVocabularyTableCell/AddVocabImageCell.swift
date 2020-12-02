//
//  AddVocabImageCell.swift
//  vocablearner
//
//  Created by Rocky on 11/18/20.
//

import UIKit

class AddVocabImageCell: UITableViewCell {
    
    @IBOutlet weak var vocabularyImage: UIImageView!
    var info: [UIImagePickerController.InfoKey: Any]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configViewUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

extension AddVocabImageCell {
    func configViewUI() -> Void {
        self.vocabularyImage.layer.borderWidth = UIConfig.defaultBorderWidth
        self.vocabularyImage.layer.borderColor = UIConfig.defaultBorderColor
        self.vocabularyImage.layer.masksToBounds = true
        self.vocabularyImage.layer.cornerRadius = 40

    }
}
