//
//  VocabularyController.swift
//  vocablearner
//
//  Created by Rocky on 10/23/20.
//

import UIKit
import RealmSwift

class CategoryController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: Properties
    
    @IBOutlet weak var categoryClt: UICollectionView!
    var listCategoryModel = List<CategoryModel>()
    
    
    // MARK: Life - cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = StoryboardConstVar.CategoryControllerNavTitle
        loadCategory()
    }

    
    
    // MARK: Private Methods
    
    func loadCategory() {
        BaseClient.shared.getCategoryWithUrl(
            completion:{ (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
                if(isSuccess!) {
                    self.listCategoryModel = value as! List<CategoryModel>
                    self.categoryClt.reloadData()
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



extension CategoryController {
    
    // MARK: UICollectionViewDelegate, UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listCategoryModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoryCell = self.categoryClt.dequeueReusableCell(withReuseIdentifier: StoryboardId.CategoryCellID, for: indexPath) as! CategoryCell
        cell.data = listCategoryModel[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell: CategoryCell = self.categoryClt.cellForItem(at: indexPath) as! CategoryCell
        let controller: VocabularyController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardId.VocabularyControllerID) as! VocabularyController
        
        if let categoryModel = cell.data {
            controller.categoryModel = categoryModel

            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
       
    
}
