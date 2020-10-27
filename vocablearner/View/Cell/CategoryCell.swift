//
//  CategoryCell.swift
//  vocablearner
//
//  Created by Rocky on 10/27/20.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    // Mark: Properties
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var data: CategoryModel? {
        didSet {
            guard let data = data else { return }
            
            if(data.imageUrl.count > 0){
                self.categoryImage.sd_setImage(with: URL(string: "\(API.kFileUrl + data.imageUrl)")!, placeholderImage: UIImage(named: "no_image_banner"))
                categoryLabel.text = String(format: " \(data.name)")
            }
            
            self.layer.borderColor = UIConfig.categoryCellBorderColor
            self.layer.borderWidth = UIConfig.categoryCellBorderWidth
        }
    }
    
}
