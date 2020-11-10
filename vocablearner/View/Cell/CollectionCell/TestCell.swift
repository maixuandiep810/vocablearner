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
            configUI()
            guard let data = data else { return }
            if data.questions.count > 0 {
                let randomNum = Int.random(in: 0..<data.questions.count)
                question = data.questions[randomNum]

                guard let question = question else { return }
                
                var answer = List<String>()
                answer.append(question.firstAnswer)
                answer.append(question.secondAnswer)
                answer.append(question.thirdAnswer)
                answer = mixOrder(answer: answer)
                
                self.optionView_1.resultLabel.text = answer[0]
//                self.optionView_2.resultLabel.text = answer[1]
            }
        }
    }
    
    func mixOrder(answer: List<String>) -> List<String> {
        let num_1 = Int.random(in: 0..<3)
        let num_2 = Int.random(in: 0..<3)
        let answerTemp = answer[num_1]
        answer[num_1] = answer[num_2]
        answer[num_2] = answerTemp
        return answer
    }
    
    func configUI() -> Void {
        self.vocabularyImage.layer.masksToBounds = true
        self.vocabularyImage.layer.cornerRadius = 20
        
        configOptionViewUI(optionView: optionView_1)
        configOptionViewUI(optionView: optionView_2)
        configOptionViewUI(optionView: optionView_3)
        configOptionViewUI(optionView: optionView_4)
    }
    
    func configOptionViewUI(optionView: OptionView) -> Void {
        optionView.layer.masksToBounds = true
        optionView.layer.cornerRadius = 20
        
        optionView.titleImage.layer.masksToBounds = true
        optionView.titleImage.layer.cornerRadius = 20
        optionView.resultImage.layer.masksToBounds = true
        optionView.resultImage.layer.cornerRadius = 20
        
        configIBAction(optionView: optionView)
    }
    
    func configIBAction(optionView: OptionView) -> Void {
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkTapAction))
        self.addGestureRecognizer(gesture)
    }

    @objc func checkTapAction(sender : UITapGestureRecognizer) {
        let alert = UIAlertController(title: "OK", message: "OK", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        self.parentController.present(alert, animated: true)
    }
    
    func resetData() -> Void {
        self.data = nil
    }
}

