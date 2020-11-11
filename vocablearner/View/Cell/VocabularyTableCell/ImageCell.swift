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
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension ImageCell {
    func configViewUI() -> Void {
        self.layer.borderWidth = UIConfig.defaultBorderWidth
        self.layer.borderColor = UIConfig.defaultBorderColor
    }
}
