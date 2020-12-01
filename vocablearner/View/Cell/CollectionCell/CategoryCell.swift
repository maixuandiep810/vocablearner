//
//  CategoryCell.swift
//  vocablearner
//
//  Created by Rocky on 10/27/20.
//

import UIKit
import SDWebImage

class CategoryCell: UICollectionViewCell {
    
    //MARK: Properties
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var testButton: GoTestControllerButton!
    
    var data: CategoryModel? {
        didSet {
            configUI()
            didSetData()
        }
    }
     
    var navigationParentController: UINavigationController?
    var parentController: CategoryController?
    
}

extension CategoryCell {
    
    func configUI() -> Void {
        
        self.layer.borderColor = UIConfig.categoryCellBorderColor
        self.layer.borderWidth = UIConfig.categoryCellBorderWidth
        
        if data!.isTested == false {
            self.testButton.isHidden = true
        }
        else {
            self.testButton.isHidden = false
        }
        self.testButton.layer.masksToBounds = true
        self.testButton.layer.cornerRadius = 10
        self.testButton.layer.maskedCorners = [.layerMinXMaxYCorner]
    }
    
    
    func didSetData() -> Void {
        
        guard let data = data else { return }
        if(data.imageUrl.count > 0){
            self.categoryImage.sd_setImage(with: URL(string: "\(API.kFileUrl + data.imageUrl)")!, placeholderImage: UIImage(named: "no_image_banner"))
            categoryLabel.text = String(format: " \(data.name)")
            testButton.categoryModel = data
        }
    }
}

















//    func addTestButtonAction() -> Void {
//        self.testButton.addTarget(self.parentController!, action: #selector(gotoTestController), for: .touchUpInside)
//    }
//
//
//
//    @objc func gotoTestController() -> Void {
//        let controller: TestController = self.parentController?.storyboard?.instantiateViewController(withIdentifier: StoryboardId.TestControllerID) as! TestController
//        if let data = self.data, let navigationController = self.navigationParentController {
//            controller.categoryModel = data
//            navigationController.pushViewController(controller, animated: true)
//        }
//    }
