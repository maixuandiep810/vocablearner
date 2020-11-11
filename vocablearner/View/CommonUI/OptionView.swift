//
//  OptionView.swift
//  vocablearner
//
//  Created by Rocky on 11/10/20.
//

import UIKit

class OptionView: UIView {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var titleImage: UIImageView!
    var parentController = TestController()
    var parentCell = TestCell()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let touch = touches.first {
//            let currentPoint = touch.location(in: self)
//            // do something with your currentPoint
//        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let touch = touches.first {
//            let currentPoint = touch.location(in: self)
//            // do something with your currentPoint
//        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.resultLabel.text == parentCell.data!.word {
            resultImage.image = UIImage(named: "correct_001")
        } else {
            resultImage.image = UIImage(named: "incorrect_001")
        }
    }

}
