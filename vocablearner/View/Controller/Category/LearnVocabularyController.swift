//
//  LearnVocabularyController.swift
//  vocablearner
//
//  Created by Rocky on 10/30/20.
//

import UIKit
import RealmSwift



//class LearnVocabularyController: UIViewController {
//    var listVocabularyModel = List<VocabularyModel>()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//}




class LearnVocabularyController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{

    // MARK: Properties

    @IBOutlet weak var vocabularyClt: UICollectionView!
    @IBOutlet weak var pageStepper: UIStepper!
    var listVocabularyModel = List<VocabularyModel>()
    var currentIndex = 0


    // MARK: Life - cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.vocabularyClt.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configUI()
    }
    
    
    // MARK: Outlet Actions
    
    @IBAction func pageStepperValueChanged(_ sender: Any) {
        print(self.pageStepper.value)
       
        let nextIndexRaw = Int(self.pageStepper.value)
        let nextIndexPath = IndexPath(indexes: [0, nextIndexRaw])
        self.vocabularyClt.isScrollEnabled = true
        self.vocabularyClt.scrollToItem(at: nextIndexPath, at: .left, animated: true)
        self.vocabularyClt.isScrollEnabled = false
    }
    
    // MARK: ConfigUI
    
    func configUI() -> Void {
        self.pageStepper.maximumValue = Double(self.listVocabularyModel.count)
    }
    
}



extension LearnVocabularyController {

    // MARK: UICollectionViewDelegate, UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listVocabularyModel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: LearnVocabularyCell = self.vocabularyClt.dequeueReusableCell(withReuseIdentifier: StoryboardId.LearnVocabularyCellID, for: indexPath) as! LearnVocabularyCell
        cell.resetData()
        cell.data = self.listVocabularyModel[indexPath.row]
        return cell
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.currentIndex = (self.currentIndex == self.listVocabularyModel.count - 1) && (self.vocabularyClt.scrollDirection == .right) ? (-1) : (self.currentIndex)
        let scrollDirection = self.vocabularyClt.scrollDirection
        self.vocabularyClt.isScrollEnabled = false
        self.vocabularyClt.isScrollEnabled = true
        self.currentIndex = (scrollDirection == .right) ? (self.currentIndex + 1) : (self.currentIndex - 1)
        let nextIndexPath = IndexPath(indexes: [0, self.currentIndex])
        self.vocabularyClt.scrollToItem(at: nextIndexPath, at: self.vocabularyClt.scrollDirectionExt, animated: true)
    }
    
    // MARK: Private Methods
}




// BIN

//        self.currentIndex = Int(self.pageStepper.value)
//        let nextIndexPath = self.vocabularyClt.indexPathsForVisibleItems[0]
//        var indexPathList: [IndexPath] = []
