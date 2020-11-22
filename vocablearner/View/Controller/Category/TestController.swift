//
//  TestController.swift
//  vocablearner
//
//  Created by Rocky on 11/10/20.
//

import UIKit
import RealmSwift

class TestController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: Properties
    
    @IBOutlet weak var testClt: UICollectionView!
    var categoryModel = CategoryModel()
    var listVocabularyModel = List<VocabularyModel>()
    var currentIndex = 0
    
    
    
    // MARK: Life - cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }	
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadVocabulary()
    }
}

extension TestController {
    
    // MARK: UICollectionViewDelegate, UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listVocabularyModel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TestCell = self.testClt.dequeueReusableCell(withReuseIdentifier: StoryboardId.TestCellID, for: indexPath) as! TestCell
        cell.resetData()
        cell.parentController = self
        cell.data = self.listVocabularyModel[indexPath.row]
        return cell
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.currentIndex = (self.currentIndex == self.listVocabularyModel.count - 1) && (self.testClt.scrollDirection == .right) ? (-1) : (self.currentIndex)
        let scrollDirection = self.testClt.scrollDirection
        self.testClt.isScrollEnabled = false
        self.testClt.isScrollEnabled = true
        self.currentIndex = (scrollDirection == .right) ? (self.currentIndex + 1) : (self.currentIndex - 1)
        let nextIndexPath = IndexPath(indexes: [0, self.currentIndex])
        self.testClt.scrollToItem(at: nextIndexPath, at: self.testClt.scrollDirectionExt, animated: true)
    }
    
    // MARK: Private Methods
    func gotoCurrentCellSelected(animated: Bool) -> Void {
        let nextIndexPath = IndexPath(indexes: [0, self.currentIndex])
        self.testClt.scrollToItem(at: nextIndexPath, at: .right, animated: animated)
    }
    
    
    // MARK: Private Methods
    
    func loadVocabulary() {
        BaseClient.shared.getVocabularyByCategoryIdWithUrl(categoryId: String(categoryModel.id),
            completion:{ (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
                if(isSuccess!) {
                    self.listVocabularyModel = value as! List<VocabularyModel>
                    self.testClt.reloadData()
                }
            }

        )
    }
    

    

    
    func finishTest(addFinishRequest: AddFinishRequest) {
        BaseClient.shared.addFinishTestByUrl (addFinishRequest: addFinishRequest,
            completion:{ (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
                if(isSuccess!) {
                    self.gotoCategoryController()
                }
            }

        )
    }
    
    func gotoCategoryController() -> Void {
    
        self.navigationController?.popViewController(animated: true)
    }


}
