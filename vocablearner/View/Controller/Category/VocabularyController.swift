//
//  VocabularyController.swift
//  vocablearner
//
//  Created by Rocky on 10/29/20.
//

import UIKit
import RealmSwift

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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



extension VocabularyController {

    // MARK: UICollectionViewDelegate, UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listVocabularyModel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: VocabularyCell = self.vocabularyClt.dequeueReusableCell(withReuseIdentifier: StoryboardId.VocabularyCellID, for: indexPath) as! VocabularyCell
        cell.data = self.listVocabularyModel[indexPath.row]
        return cell
    }
}
