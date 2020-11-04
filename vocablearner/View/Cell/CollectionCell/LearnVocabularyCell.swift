//
//  LearnVocabularyCell.swift
//  vocablearner
//
//  Created by Rocky on 11/2/20.
//

import UIKit

class LearnVocabularyCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Properties
    
    @IBOutlet weak var vocabularyTable: UITableView!
    
    var data: VocabularyModel? {
        didSet {
            guard let data = data else { return }
            self.vocabularyTable.reloadData()
//            self.layer.borderColor = UIConfig.categoryCellBorderColor
//            self.layer.borderWidth = UIConfig.categoryCellBorderWidth
        }
    }
}

extension LearnVocabularyCell {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let data = self.data {
            return 1
        }
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case LearnVocabularyTableCell_ENUM.ImageCellID.rawValue:
            let cell: ImageCell = self.vocabularyTable.dequeueReusableCell(withIdentifier: LearnVocabularyTableCell_ENUM.ImageCellID.cellID) as! ImageCell
            cell.vocabularyImage.image = nil
            if(data!.imageUrl.count > 0 && data!.imageView == nil){
                cell.imageView?.sd_setImage(with: URL(string: "\(API.kFileUrl + data!.imageUrl)")!, placeholderImage: UIImage(named: "no_image_banner"))
            }
            return cell
        case LearnVocabularyTableCell_ENUM.AudioCellID.rawValue:
            let cell: AudioCell = self.vocabularyTable.dequeueReusableCell(withIdentifier: LearnVocabularyTableCell_ENUM.AudioCellID.cellID) as! AudioCell
            cell.pronunciationLabel.text = nil
            cell.pronunciationLabel.text = data!.word
            return cell
        case LearnVocabularyTableCell_ENUM.CheckAudioCellID.rawValue:
            let cell: CheckAudioCell = self.vocabularyTable.dequeueReusableCell(withIdentifier: LearnVocabularyTableCell_ENUM.CheckAudioCellID.cellID) as! CheckAudioCell
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case LearnVocabularyTableCell_ENUM.ImageCellID.rawValue:
            return LearnVocabularyTableCell_ENUM.ImageCellID.heightCell
        case LearnVocabularyTableCell_ENUM.AudioCellID.rawValue:
            return LearnVocabularyTableCell_ENUM.AudioCellID.heightCell
        case LearnVocabularyTableCell_ENUM.CheckAudioCellID.rawValue:
            return LearnVocabularyTableCell_ENUM.CheckAudioCellID.heightCell
        default:
            return LearnVocabularyTableCell_ENUM.Default.heightCell
        }
    }
    
    func resetData () -> Void {
        self.data = nil
    }
}