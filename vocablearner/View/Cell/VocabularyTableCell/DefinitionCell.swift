//
//  DefinitionCell.swift
//  vocablearner
//
//  Created by Rocky on 11/6/20.
//

import UIKit

class DefinitionCell: UITableViewCell {

    @IBOutlet weak var definitionLabel: UILabel!
    var heightDefinitionTextView = CGFloat()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
