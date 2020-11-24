//
//  OptionView.swift
//  vocablearner
//
//  Created by Rocky on 11/10/20.
//

import UIKit

class OptionView: UIView {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var titleImage: UIImageView!
    var parentController = TestController()
    var parentCell = TestCell()
    var order = -1

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.parentCell.resetUI_CHOSEN()
        parentController.resultTest[parentCell.order].resetOption_CHOSEN()
        configUI_CHOSEN()
        parentController.resultTest[parentCell.order].option_CHOSEN[order] = true
        
        if parentController.resultTest[parentCell.order].isFinished == false {
            parentController.finishedTest = parentController.finishedTest + 1
            parentController.resultTest[parentCell.order].isFinished = true
        }
        if resultLabel.text == parentCell.data!.word {
            parentController.resultTest[parentCell.order].isTrue = true
        }
        else {
            parentController.resultTest[parentCell.order].isTrue = false
        }
        
        parentController.updateFinishedLB()
    }
    
    func configUI(isChosen: Bool) -> Void {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 20
        self.layer.borderWidth = UIConfig.optionViewBorderWidth
        self.layer.borderColor = UIConfig.optionViewBorderColor
        
        self.titleImage.layer.masksToBounds = true
        self.titleImage.layer.cornerRadius = 20
        
        isChosen ? configUI_CHOSEN() : nil
    }
  
    func resetUI_CHOSEN(isChosen: Bool) -> Void {
        layer.borderColor = isChosen ? UIConfig.optionViewBorderColorCHOSEN : UIConfig.optionViewBorderColor
    }
    
    func configUI_CHOSEN() -> Void {
        layer.borderColor = UIConfig.optionViewBorderColorCHOSEN
    }
    
    func assignData(answer: String, parentCell: TestCell, parentController: TestController, order: Int) -> Void {
        self.parentController = parentController
        self.parentCell = parentCell
        self.order = order
        resultLabel.text = answer
    }
    
    func resetData() -> Void {
        self.resultLabel.text = nil
    }
}





//override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
////        if let touch = touches.first {
////            let currentPoint = touch.location(in: self)
////            // do something with your currentPoint
////        }
//}
//
//override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
////        if let touch = touches.first {
////            let currentPoint = touch.location(in: self)
////            // do something with your currentPoint
////        }
//}
