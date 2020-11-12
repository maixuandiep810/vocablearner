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

    // Table
    static let LearnVocabularyTableID = "LearnVocabularyTableID"
    
    // Cell
    static let CategoryCellID = "CategoryCellID"
    static let VocabularyCellID = "VocabularyCellID"
    static let LearnVocabularyCellID = "LearnVocabularyCellID"
    static let TestCellID = "TestCellID"
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


