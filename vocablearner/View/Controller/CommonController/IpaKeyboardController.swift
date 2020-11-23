//
//  IpaKeyboardController.swift
//  vocablearner
//
//  Created by Rocky on 11/23/20.
//

import UIKit

class IpaKeyboardController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    // MARK: Properties
    
    @IBOutlet weak var keyBoardCLT: UICollectionView!
    

    // MARK: Life-Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension IpaKeyboardController {
    
    
    // MARK: UICollectionViewDelegate, UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        IpaKeyBoard.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: IpaKeyBoardCell = self.keyBoardCLT.dequeueReusableCell(withReuseIdentifier: StoryboardId.KeyBoardCellID, for: indexPath) as! IpaKeyBoardCell
        cell.ipaLB.text = IpaKeyBoard.value[indexPath.row]
        return cell
    }
}
