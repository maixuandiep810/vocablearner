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
    var listVocabularyModel = List<VocabularyModel>()


    // MARK: Life - cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.vocabularyClt.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }



    // MARK: Private Methods



}



extension LearnVocabularyController {

    // MARK: UICollectionViewDelegate, UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listVocabularyModel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: LearnVocabularyCell = self.vocabularyClt.dequeueReusableCell(withReuseIdentifier: StoryboardId.LearnVocabularyCellID, for: indexPath) as! LearnVocabularyCell
        cell.data = self.listVocabularyModel[indexPath.row]
        return cell
    }
}
