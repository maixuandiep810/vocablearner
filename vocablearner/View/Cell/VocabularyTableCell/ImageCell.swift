//
//  ImageCell.swift
//  vocablearner
//
//  Created by Rocky on 11/2/20.
//

import UIKit

class ImageCell: UITableViewCell {
    
    @IBOutlet weak var vocabularyImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configViewUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

extension ImageCell {
    func configViewUI() -> Void {
        self.vocabularyImage.layer.borderWidth = UIConfig.defaultBorderWidth
        self.vocabularyImage.layer.borderColor = UIConfig.defaultBorderColor
        self.vocabularyImage.layer.masksToBounds = true
        self.vocabularyImage.layer.cornerRadius = 40

    }
}
