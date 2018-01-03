//
//  HeaderTVC.swift
//  Budget
//
//  Created by Frank Wang on 2016-03-01.
//  Copyright © 2016 Lemma Inc. All rights reserved.
//

import UIKit

class HeaderTVC: UITableViewCell {

    @IBOutlet var grandTotal: UILabel!
    @IBOutlet var dateCurrent: UILabel!
    @IBOutlet var monthYLabel: UILabel!
    
    
    @IBOutlet var staticLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
