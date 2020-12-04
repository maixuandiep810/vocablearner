//
//  StoryboardId.swift
//  vocablearner
//
//  Created by Rocky on 10/21/20.
//

import Foundation
import UIKit

struct StoryboardId {
    
    // ControllerID
    static let LoginControllerID = "LoginControllerID"
    static let ParentControllerID = "ParentControllerID"
    
    static let CategoryControllerID = "CategoryControllerID"
    static let VocabularyControllerID = "VocabularyControllerID"
    static let LearnVocabularyControllerID = "LearnVocabularyControllerID"
    
    static let TestControllerID = "TestControllerID"
    static let AddCategoryControllerID = "AddCategoryControllerID"
    static let AddVocabularyControllerID = "AddVocabularyControllerID"
    static let UserSettingControllerID = "UserSettingControllerID"
    static let TestSettingControllerID = "TestSettingControllerID"
    static let IpaKeyboardControllerID = "IpaKeyboardControllerID"

    
    // Sugue
    static let SugueIpaKeyboardController = "SugueIpaKeyboardController"
    
    // Table
    static let LearnVocabularyTableID = "LearnVocabularyTableID"
    
    // Cell
    static let CategoryCellID = "CategoryCellID"
    static let CircleVocabularyCellID = "CircleVocabularyCellID"
    static let CrudVocabularyCellID = "CrudVocabularyCellID"
    static let AddVocabularyCellID = "AddVocabularyCellID"
    static let LearnVocabularyCellID = "LearnVocabularyCellID"
    static let TestCellID = "TestCellID"
    static let AddCustomTopicHeaderID = "AddCustomTopicHeaderID"
    static let VocabularyHeaderCellID = "VocabularyHeaderCellID"
    static let FinishCellID = "FinishCellID"
    static let KeyBoardCellID = "KeyBoardCellID"
    static let TestSettingCellID = "TestSettingCellID"
}


struct StoryboardConstVar {
    static let CategoryControllerNavTitle = "Category"
    static let UserControllerNavTitle = "User"
}

struct heightConfig {
    static var DefinitionCellID_Title = CGFloat(100)
    static var DefinitionCellID_TextView = CGFloat()
}

enum LearnVocabularyTableCell_ENUM: Int {
    
    case ImageCellID = 0
    case AudioCellID = 1
    case CheckAudioCellID = 2
    case DefinitionCellID = 3
    case Default = 9
    
    var cellID: String {
        switch self {
        case .ImageCellID:
            return "ImageCellID"
        case .AudioCellID:
            return "AudioCellID"
        case .CheckAudioCellID:
            return "CheckAudioCellID"
        case .DefinitionCellID:
            return "DefinitionCellID"
        case .Default:
            return "DefaultCellID"
        }
    }
        
    var heightCell: CGFloat {
        var height = CGFloat()
        switch self {
        case .ImageCellID:
            height = 360
            return height
        case .AudioCellID:
            height = 160
            return height
        case .CheckAudioCellID:
            height = 120
            return height
        case .DefinitionCellID:
            return heightConfig.DefinitionCellID_Title + heightConfig.DefinitionCellID_TextView
        case .Default:
            height = 200
            return height
        }
    }
}

enum AddCategoryTableCell_ENUM: Int {
    
    case ImageCellID = 0
    case NameCellID = 1
    case LevelCellID = 2
    case DefinitionCellID = 3
    case Default = 9
    
    var cellID: String {
        switch self {
        case .ImageCellID:
            return "ImageCellID"
        case .NameCellID:
            return "NameCellID"
        case .LevelCellID:
            return "LevelCellID"
        case .DefinitionCellID:
            return "DefinitionCellID"
        case .Default:
            return "DefaultCellID"
        }
    }
        
    var heightCell: CGFloat {
        var height = CGFloat()
        switch self {
        case .ImageCellID:
            height = 360
            return height
        case .NameCellID:
            height = 110
            return height
        case .LevelCellID:
            height = 120
            return height
        case .DefinitionCellID:
            return heightConfig.DefinitionCellID_Title + heightConfig.DefinitionCellID_TextView
        case .Default:
            height = 200
            return height
        }
    }
}


enum AddVocabularyTableCell_ENUM: Int {
    
    case ImageCellID = 0
    case WordCellID = 1
    case MeaningCellID = 2
    case IPACellID = 3
    case AudioCellID = 4
    case DefinitionCellID = 5
    case Default = 9
    
    var cellID: String {
        switch self {
        case .ImageCellID:
            return "ImageCellID"
        case .WordCellID:
            return "WordCellID"
        case .MeaningCellID:
            return "MeaningCellID"
        case .IPACellID:
            return "IPACellID"
        case .AudioCellID:
            return "AudioCellID"
        case .DefinitionCellID:
            return "DefinitionCellID"
        case .Default:
            return "DefaultCellID"
        }
    }
        
    var heightCell: CGFloat {
        var height = CGFloat()
        switch self {
        case .ImageCellID:
            height = 360
            return height
        case .WordCellID:
            height = 100
            return height
        case .MeaningCellID:
            height = 100
            return height
        case .IPACellID:
            height = 100
            return height
        case .AudioCellID:
            height = 170
            return height
        case .DefinitionCellID:
            height = 250
            return height
        case .Default:
            height = 100
            return height
        }
    }
}


struct LevelOptions {
    static let pickerData = ["All", "A1", "A2", "B1", "B2", "C1", "C2", "Difficult", "Todo Test", "Test"]
    static let AddCate_IsDifficult_PK_Data = ["True", "False"]
    static let AddCate_IsDifficult_PK_Value = ["True": true, "False": false]
    static let pickerId = ["All": 0, "A1": 1, "A2": 2, "B1": 3, "B2": 4, "C1": 5, "C2": 6, "Difficult": 7, "Todo Test": 8, "Test": 9]
}

struct TopicDayOptions {
    static let pickerData = [1, 2, 3, 4, 5, 6 ,7 ,8 , 9]
}

struct IpaKeyBoard {
    static let value = [0: "ʌ", 1: "ɑ:", 2: "æ", 3: "e", 4: "ə", 5: "ɜ:", 6: "ɪ", 7: "i:", 8: "ɒ", 9: "ɔ:", 10: "ʊ", 11: "u:", 12: "aɪ", 13: "aʊ", 14: "eɪ", 15: "oʊ", 16: "ɔɪ", 17: "eə", 18: "ɪə", 19: "ʊə", 20: "b", 21: "d", 22: "f", 23: "g", 24: "h", 25: "j", 26: "k", 27: "l", 28: "m", 29: "n", 30: "ŋ", 31: "p", 32: "r", 33: "s", 34: "ʃ", 35: "t", 36: "tʃ", 37: "θ", 38: "ð", 39: "v", 40: "w", 41: "z", 42: "ʒ", 43: "dʒ", 44: "<-"]
}
	
