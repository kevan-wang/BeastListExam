//
//  MainVCCell.swift
//  BeastListExam
//
//  Created by Kevan Wang on 5/18/18.
//  Copyright © 2018 Kevan Wang. All rights reserved.
//

import UIKit

class MainVCCell: UITableViewCell {
    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var beastButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
