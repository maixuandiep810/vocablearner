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

    // Table
    static let LearnVocabularyTableID = "LearnVocabularyTableID"
    
    // Cell
    static let CategoryCellID = "CategoryCellID"
    static let VocabularyCellID = "VocabularyCellID"
    static let LearnVocabularyCellID = "LearnVocabularyCellID"
    static let TestCellID = "TestCellID"
    static let AddCustomTopicHeaderID = "AddCustomTopicHeaderID"
    static let AddVocabCellID = "AddVocabCellID"
    static let FinishCellID = "FinishCellID"
    static let KeyBoardCellID = "KeyBoardCellID"
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
    case NameCellID = 1
    case IPACellID = 2
    case AudioCellID = 3
    case DefinitionCellID = 4
    case Default = 9
    
    var cellID: String {
        switch self {
        case .ImageCellID:
            return "ImageCellID"
        case .NameCellID:
            return "NameCellID"
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
        case .NameCellID:
            height = 100
            return height
        case .IPACellID:
            height = 100
            return height
        case .AudioCellID:
            height = 120
            return height
        case .DefinitionCellID:
            height = 120
            return height
        case .Default:
            height = 100
            return height
        }
    }
}


struct LevelOptions {
    static let pickerData = ["All", "A1", "A2", "B1", "B2", "C1", "C2"]
    static let AddCatePickerData = ["A1", "A2", "B1", "B2", "C1", "C2"]
    static let pickerId = ["All": 0, "A1": 1, "A2": 2, "B1": 3, "B2": 4, "C1": 5, "C2": 6]
}

struct IpaKeyBoard {
    static let value = [0: "ɑ", 1: "ɒ", 2: "æ", 3: "æ", 4: "æ", 5: "æ"]
}

