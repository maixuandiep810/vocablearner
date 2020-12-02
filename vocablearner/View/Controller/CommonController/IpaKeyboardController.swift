//
//  IpaKeyboardController.swift
//  vocablearner
//
//  Created by Rocky on 11/23/20.
//

import UIKit

class IpaKeyboardController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var ipaTF: UITextField!
    var parentController: AddVocabularyController?
    var parentCell: AddVocabIpaCell?
    
    
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell: IpaKeyBoardCell = self.keyBoardCLT.cellForItem(at: indexPath) as! IpaKeyBoardCell
        if cell.ipaLB.text == "<-" && ipaTF.text!.count > 0 {
            let index = ipaTF.text!.index(ipaTF.text!.startIndex, offsetBy: ipaTF.text!.count - 1)
            let mySubstring = ipaTF.text![..<index] // Hello
            ipaTF.text = String(mySubstring)
        }
        else if cell.ipaLB.text != "<-"{
            ipaTF.text = ipaTF.text! + cell.ipaLB.text!
        }
        parentCell!.ipaLB.text = ipaTF.text
    }
}
