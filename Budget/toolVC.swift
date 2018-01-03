//
//  toolVC.swift
//  Budget
//
//  Created by Frank Wang on 2016-02-14.
//  Copyright © 2016 Lemma Inc. All rights reserved.
//

import Foundation
import UIKit

class toolVC: UIViewController{
    
    
    @IBOutlet var prof: UIImageView!
    @IBOutlet var labelName: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let imageData = UserDefaults.standard.object(forKey: "profImage") as! Data
        
        
        prof.image = UIImage(data: imageData, scale: 1.0)
        prof.layer.cornerRadius = prof.frame.size.width / 2
        prof.clipsToBounds = true
        labelName.text = UserDefaults.standard.object(forKey: "user") as? String
        labelName.numberOfLines = 1
        labelName.adjustsFontSizeToFitWidth = true
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
}
