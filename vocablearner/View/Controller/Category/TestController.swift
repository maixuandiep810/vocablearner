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
    @IBOutlet weak var resultLB: UILabel!
    @IBOutlet weak var finishedLB: UILabel!
    @IBOutlet weak var checkBTN: UIButton!
    var categoryModel = CategoryModel()
    var listVocabularyModel = List<VocabularyModel>()
    var resultTest = [TestResult]()
    var currentIndex = 0
    var finishedTest = 0
    var rightTest = 0
    
    
    
    // MARK: Life - cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }	
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadVocabulary()
    }
    
    // MARK: Actions
    
    @IBAction func checkBTNTouchUpInSide(_ sender: Any) {
        if finishedTest == self.resultTest.count {
            checkTest()
        }
        checkBTN.isEnabled = false
        
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
        cell.result = self.resultTest[indexPath.row]
        cell.order = indexPath.row
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
    
    
    func loadVocabulary() {
        BaseClient.shared.getVocabularyByCategoryIdWithUrl(categoryId: String(categoryModel.categoryId),
            completion:{ (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
                if(isSuccess!) {
                    self.listVocabularyModel = value as! List<VocabularyModel>
                    for i in 0...self.listVocabularyModel.count - 1 {
                        self.listVocabularyModel[i].createTest()
                        let resultTest = TestResult()
                        
                        self.resultTest.append(resultTest)
                    }
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
    
    func updateFinishedLB() -> Void {
        
        self.finishedLB.text = String(self.finishedTest) + "/" + String(self.resultTest.count)
    }

    func checkTest() -> Void {
        
        for i in 0..<self.resultTest.count {
            if self.resultTest[i].isTrue {
                self.rightTest = self.rightTest + 1
            }
        }
        self.resultLB.text = String(self.rightTest) + "/" + String(self.resultTest.count)
    }

}

class TestResult {
    
    var option_CHOSEN = [Bool](repeating: false, count: 4)
    var isTrue = false
    var isFinished = false

    func resetOption_CHOSEN() -> Void {
        option_CHOSEN[0] = false
        option_CHOSEN[1] = false
        option_CHOSEN[2] = false
        option_CHOSEN[3] = false
    }
}
