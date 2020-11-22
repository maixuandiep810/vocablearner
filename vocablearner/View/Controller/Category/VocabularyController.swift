//
//  VocabularyController.swift
//  vocablearner
//
//  Created by Rocky on 10/29/20.
//

import UIKit
import RealmSwift
import SDWebImage

class VocabularyController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: Properties
    
    @IBOutlet weak var vocabularyClt: UICollectionView!
    var categoryModel = CategoryModel()
    var listVocabularyModel = List<VocabularyModel>()
    
    
    // MARK: Life - cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
// TODO: fix exactly title when back to parent controller
//        self.navigationController?.navigationBar.topItem?.title = categoryModel.name
        loadVocabulary()
    }
}



extension VocabularyController {

    // MARK: UICollectionViewDelegate, UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listVocabularyModel.count + 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case self.listVocabularyModel.count:
            let cell = self.vocabularyClt.dequeueReusableCell(withReuseIdentifier: StoryboardId.AddVocabCellID, for: indexPath)
            return cell
        default:
                    let cell: VocabularyCell = self.vocabularyClt.dequeueReusableCell(withReuseIdentifier: StoryboardId.VocabularyCellID, for: indexPath) as! VocabularyCell
            cell.data = self.listVocabularyModel[indexPath.row]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case self.listVocabularyModel.count:
            gotoAddVocabController()
        default:
            //        let cell: VocabularyCell = self.vocabularyClt.cellForItem(at: indexPath) as! VocabularyCell
            gotoLearnVocabController(indexPath: indexPath)
            //        if let listVocabularyModel = self.listVocabularyModel {
            //            controller.listVocabularyModel = listVocabularyModel
            //
            //            self.navigationController?.pushViewController(controller, animated: true)
            //        }
        }
    }
    
    // MARK: Private Methods
    
    func loadVocabulary() {
        BaseClient.shared.getVocabularyByCategoryIdWithUrl(categoryId: String(categoryModel.id),
            completion:{ (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
                if(isSuccess!) {
                    self.listVocabularyModel = value as! List<VocabularyModel>
                    self.vocabularyClt.reloadData()
                }
            }
        )
    }
 
    func gotoLearnVocabController(indexPath: IndexPath) -> Void {
        let controller: LearnVocabularyController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardId.LearnVocabularyControllerID) as! LearnVocabularyController
        controller.listVocabularyModel = self.listVocabularyModel
        controller.currentIndex = indexPath.row
        controller.categoryModel = self.categoryModel
        self.navigationController?.pushViewController(controller, animated: true)
    }
    func gotoAddVocabController() -> Void {
        let controller: AddVocabularyController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardId.AddVocabularyControllerID) as! AddVocabularyController
        controller.categoryModel = self.categoryModel
        self.navigationController?.pushViewController(controller, animated: true)
    }

}
