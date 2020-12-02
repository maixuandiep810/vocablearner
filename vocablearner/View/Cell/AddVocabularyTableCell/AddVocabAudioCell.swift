//
//  AddVocabAudioCell.swift
//  vocablearner
//
//  Created by p on 12/2/20.
//

import UIKit

class AddVocabAudioCell: UITableViewCell {

    @IBOutlet weak var fileLB: UILabel!
    var audioURL = URL(string: "")
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
