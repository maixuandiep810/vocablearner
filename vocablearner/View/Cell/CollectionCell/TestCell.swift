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
    var question: QuestionModel?
    var parentController = TestController()
    
    var data: VocabularyModel? {
        didSet {
            guard let data = data else { return }
            configUI()
            if data.questions.count > 0 {
                let randomNum = Int.random(in: 0..<data.questions.count)
                question = data.questions[randomNum]

                guard let question = question else { return }
                
                var answer = List<String>()
                answer.append(question.firstAnswer)
                answer.append(question.secondAnswer)
                answer.append(question.thirdAnswer)
                answer.append(data.word)
                answer = mixOrder(answer: answer)
                
                assignData(answer: answer)
            }
        }
    }
    
    func resetData() -> Void {
        self.data = nil
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
        configOptionViewUI(optionView: optionView_1)
        configOptionViewUI(optionView: optionView_2)
        configOptionViewUI(optionView: optionView_3)
        configOptionViewUI(optionView: optionView_4)
    }
    
    func configOptionViewUI(optionView: OptionView) -> Void {
        optionView.layer.masksToBounds = true
        optionView.layer.cornerRadius = 20
        optionView.layer.borderWidth = UIConfig.optionViewBorderWidth
        optionView.layer.borderColor = UIConfig.optionViewBorderColor
        
        optionView.titleImage.layer.masksToBounds = true
        optionView.titleImage.layer.cornerRadius = 20
        optionView.resultImage.layer.masksToBounds = true
        optionView.resultImage.layer.cornerRadius = 20
    }
    
    func assignData(answer: List<String>) -> Void {
        assignOptionViewData(optionView: optionView_1, answer: answer[0])
        assignOptionViewData(optionView: optionView_2, answer: answer[1])
        assignOptionViewData(optionView: optionView_3, answer: answer[2])
        assignOptionViewData(optionView: optionView_4, answer: answer[3])
    }
    
    func assignOptionViewData(optionView: OptionView, answer: String) -> Void {
        optionView.parentController = self.parentController
        optionView.parentCell = self
        optionView.resultLabel.text = answer
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
