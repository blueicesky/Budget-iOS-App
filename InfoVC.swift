//
//  InfoVC.swift
//  Budget
//
//  Created by Frank Wang on 2016-06-05.
//  Copyright © 2016 Lemma Inc. All rights reserved.
//

import UIKit

class InfoVC: UIViewController {

    @IBOutlet var infoBox: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoBox.numberOfLines = 12
        infoBox.adjustsFontSizeToFitWidth = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
