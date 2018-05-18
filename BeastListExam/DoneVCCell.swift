//
//  DoneVCCell.swift
//  BeastListExam
//
//  Created by Kevan Wang on 5/18/18.
//  Copyright © 2018 Kevan Wang. All rights reserved.
//

import UIKit

class DoneVCCell: UITableViewCell {
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
