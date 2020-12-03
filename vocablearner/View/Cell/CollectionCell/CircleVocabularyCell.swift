//
//  VocabularyCell.swift
//  vocablearner
//
//  Created by Rocky on 10/29/20.
//

import UIKit
import SDWebImage

class CircleVocabularyCell: UICollectionViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var vocabularyImage: UIImageView!
    @IBOutlet weak var vocabularyLabel: UILabel!
    
    var data: VocabularyModel? {
        didSet {
            guard let data = data else { return }
            
            if(data.imageUrl.count > 0 && data.imageView == nil){
                self.vocabularyImage.sd_setImage(with: URL(string: "\(API.kFileUrl + data.imageUrl)")!, placeholderImage: UIImage(named: "no_image_banner"))
                vocabularyLabel.text = String(format: " \(data.word)")
            }
            
            self.layer.borderColor = UIConfig.categoryCellBorderColor
            self.layer.borderWidth = UIConfig.categoryCellBorderWidth
        }
    }
    
}

