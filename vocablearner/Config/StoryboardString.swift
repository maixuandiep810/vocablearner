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

    // Table
    static let LearnVocabularyTableID = "LearnVocabularyTableID"
    
    // Cell
    static let CategoryCellID = "CategoryCellID"
    static let VocabularyCellID = "VocabularyCellID"
    static let LearnVocabularyCellID = "LearnVocabularyCellID"
}


struct StoryboardConstVar {
    static let CategoryControllerNavTitle = "Category"
    static let UserControllerNavTitle = "User"
}

enum LearnVocabularyTableCell_ENUM: Int {
    
    case ImageCellID = 0
    case AudioCellID = 1
    case CheckAudioCellID = 2
    case Default = 9
    
    var cellID: String {
        switch self {
        case .ImageCellID:
            return "ImageCellID"
        case .AudioCellID:
            return "AudioCellID"
        case .CheckAudioCellID:
            return "CheckAudioCellID"
        case .Default:
            return ""
        }
    }
    
    var heightCell: CGFloat {
        var height = CGFloat()
        switch self {
        case .ImageCellID:
            height = 400
            return height
        case .AudioCellID:
            height = 160
            return height
        case .CheckAudioCellID:
            height = 120
            return height
        case .Default:
            height = 0
            return height
        }
    }
}
