//
//  ImageCell.swift
//  vocablearner
//
//  Created by Rocky on 11/2/20.
//

import UIKit

class ImageCell: UITableViewCell {
    
    @IBOutlet weak var vocabularyImage: UIImageView!
    @IBOutlet weak var meaningLB: UILabel!
    @IBOutlet weak var backgroundMeaningLB: UIView!

    
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
        self.vocabularyImage.clipsToBounds = true
        self.vocabularyImage.layer.cornerRadius = 40

        self.backgroundMeaningLB.clipsToBounds = true
        self.backgroundMeaningLB.layer.cornerRadius = 40
        self.backgroundMeaningLB.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
}
