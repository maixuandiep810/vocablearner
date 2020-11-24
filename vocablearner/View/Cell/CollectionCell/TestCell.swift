//
//  TestCell.swift
//  vocablearner
//
//  Created by Rocky on 11/10/20.
//

import UIKit
import RealmSwift

class TestCell: UICollectionViewCell {
    @IBOutlet weak var vocabularyImage: UIImageView!
    @IBOutlet weak var optionView_1: OptionView!
    @IBOutlet weak var optionView_2: OptionView!
    @IBOutlet weak var optionView_3: OptionView!
    @IBOutlet weak var optionView_4: OptionView!
//    var question: QuestionModel?
    var parentController = TestController()
    var order = -1
    
    var result = TestResult()
    
    var data: VocabularyModel? {
        didSet {
            guard let data = data else { return }
            configUI()
            if data.questions.count > 0 && data.test != nil{
                assignData()
            }
        }
    }
    
    func resetData() -> Void {
        self.data = nil
        resetUI()
    }
    
    func mixOrder(answer: List<String>) -> List<String> {
        let num_1 = Int.random(in: 0..<4)
        let num_2 = Int.random(in: 0..<4)
        let answerTemp = answer[num_1]
        answer[num_1] = answer[num_2]
        answer[num_2] = answerTemp
        return answer
    }
    
    func configUI() -> Void {
        self.vocabularyImage.layer.masksToBounds = true
        self.vocabularyImage.layer.cornerRadius = 20
        
        if(data!.imageView == nil){
            self.vocabularyImage.sd_setImage(with: URL(string: "\(API.kFileUrl + data!.imageUrl)")!, placeholderImage: UIImage(named: "no_image_banner"))
        }
        
        optionView_1.configUI(isChosen: result.option_CHOSEN[0])
        optionView_2.configUI(isChosen: result.option_CHOSEN[1])
        optionView_3.configUI(isChosen: result.option_CHOSEN[2])
        optionView_4.configUI(isChosen: result.option_CHOSEN[3])
    }
    

    func resetUI() -> Void {
        optionView_1.resetData()
        optionView_2.resetData()
        optionView_3.resetData()
        optionView_4.resetData()
    }
    
    func resetUI_CHOSEN() -> Void {
        optionView_1.resetUI_CHOSEN(isChosen: false)
        optionView_2.resetUI_CHOSEN(isChosen: false)
        optionView_3.resetUI_CHOSEN(isChosen: false)
        optionView_4.resetUI_CHOSEN(isChosen: false)
    }
    
    func assignData() -> Void {
        optionView_1.assignData(answer: self.data!.test!.firstAnswer, parentCell: self, parentController: self.parentController, order: 0)
        optionView_2.assignData(answer: self.data!.test!.secondAnswer, parentCell: self, parentController: self.parentController, order: 1)
        optionView_3.assignData(answer: self.data!.test!.thirdAnswer, parentCell: self, parentController: self.parentController, order: 2)
        optionView_4.assignData(answer: self.data!.test!.fourthAnswer, parentCell: self, parentController: self.parentController, order: 3)
    }
    

}



// BIN
//
//func configIBAction(optionView: OptionView) -> Void {
//    let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkTapAction))
//    optionView.addGestureRecognizer(gesture)
//}
//
//@objc func checkTapAction(sender : UITapGestureRecognizer) {
//    let alert = UIAlertController(title: "OK", message: "OK", preferredStyle: .alert)
//    alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
//    self.parentController.present(alert, animated: true)
//}
//
// BIN
