//
//  mainTVC.swift
//  Budget
//
//  Created by Frank Wang on 2016-02-27.
//  Copyright © 2016 Lemma Inc. All rights reserved.
//

import UIKit

class mainTVC: UITableViewCell {
    
    @IBOutlet var imageFirst: UIImageView!
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var descLabel: UILabel!
    
    @IBOutlet var dollarLabel: UILabel!
    
    @IBOutlet var typeLabel: UILabel!
    
    @IBOutlet var incLabel: UIImageView!
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
