//
//  SumTVC.swift
//  Budget
//
//  Created by Frank Wang on 2016-03-28.
//  Copyright © 2016 Lemma Inc. All rights reserved.
//

import UIKit

class SumTVC: UITableViewCell {

    @IBOutlet var mainDate: UILabel!
    
    @IBOutlet var highestLabel: UILabel!
    
    @IBOutlet var moneyLabel: UILabel!
    
    @IBOutlet var staticText: UILabel!
    
    
    @IBOutlet var incomeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        highestLabel.numberOfLines = 1
        highestLabel.adjustsFontSizeToFitWidth = true
        mainDate.numberOfLines = 1
        mainDate.adjustsFontSizeToFitWidth = true
        moneyLabel.numberOfLines = 1
        moneyLabel.adjustsFontSizeToFitWidth = true
        staticText.numberOfLines = 1
        staticText.adjustsFontSizeToFitWidth = true
        incomeLabel.numberOfLines = 1
        incomeLabel.adjustsFontSizeToFitWidth = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
