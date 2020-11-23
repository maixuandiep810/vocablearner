//
//  VocabularyModel.swift
//  vocablearner
//
//  Created by Rocky on 10/23/20.
//

import UIKit
import ObjectMapper
import RealmSwift

// Vocabulary Model
// = vocabulary data
class VocabularyModel: Object, Mappable {
    
    @objc dynamic var id = 0
    @objc dynamic var word = ""
    @objc dynamic var meaning = ""
    @objc dynamic var ipaTranscription = ""
    @objc dynamic var definition = ""
    @objc dynamic var sentence = ""
    @objc dynamic var imageUrl = ""
    @objc dynamic var audioUrl = ""
    // TODO: WHY     @objc dynamic var questions = List<QuestionModel>() cannot be reprented OBJC
    var questions = List<QuestionModel>()
    var test: QuestionModel? = nil

    var imageView: UIImageView?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id              <- map["Id"]
        word            <- map["Word"]
        meaning         <- map["Meaning"]
        definition      <- map["Definition"]
        sentence        <- map["Sentence"]
        imageUrl        <- map["ImageUrl"]
        audioUrl        <- map["AudioUrl"]
        questions       <- (map["Questions"], ListTransform<QuestionModel>())
    }
    
    func createTest() {
        let index = Int.random(in: 0..<questions.count)
        if self.questions.count > 0 {
            let test = self.questions[index]
            
            var answer = List<String>()
            answer.append(test.firstAnswer)
            answer.append(test.secondAnswer)
            answer.append(test.thirdAnswer)
            answer.append(self.word)
        
            answer = mixOrder(answer: answer)
            test.firstAnswer = answer[0]
            test.secondAnswer = answer[1]
            test.thirdAnswer = answer[2]
            test.fourthAnswer = answer[3]
            self.test = test
        }
    }
    
    func mixOrder(answer: List<String>) -> List<String> {
        let num_1 = Int.random(in: 0..<4)
        let num_2 = Int.random(in: 0..<4)
        let answerTemp = answer[num_1]
        answer[num_1] = answer[num_2]
        answer[num_2] = answerTemp
        return answer
    }
}

// Question Model
// = question
class QuestionModel: Object, Mappable {
    
    @objc dynamic var id = 0
    @objc dynamic var firstAnswer = ""
    @objc dynamic var secondAnswer = ""
    @objc dynamic var thirdAnswer = ""
    var fourthAnswer = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id                      <- map["Id"]
        firstAnswer             <- map["FirstAnswer"]
        secondAnswer            <- map["SecondAnswer"]
        thirdAnswer             <- map["ThirdAnswer"]
    }
}
