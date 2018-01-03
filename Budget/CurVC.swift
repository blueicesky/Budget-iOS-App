//
//  CurVC.swift
//  Budget
//
//  Created by Frank Wang on 2016-05-29.
//  Copyright © 2016 Lemma Inc. All rights reserved.
//

import UIKit
import Foundation

var currency = UserDefaults.standard.object(forKey: "currency") as! Int

class CurVC: UIViewController {

    @IBOutlet var labelMain2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelMain2.numberOfLines = 1
        labelMain2.adjustsFontSizeToFitWidth = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func wall1(_ sender: AnyObject) {
        whichBack = 1
        UserDefaults.standard.set(whichBack, forKey: "backG")
    }
    @IBAction func wall2(_ sender: AnyObject) {
        whichBack = 2
        UserDefaults.standard.set(whichBack, forKey: "backG")
    }
    @IBAction func wall3(_ sender: AnyObject) {
        whichBack = 3
        UserDefaults.standard.set(whichBack, forKey: "backG")
    }
    @IBAction func wall4(_ sender: AnyObject) {
        whichBack = 4
        UserDefaults.standard.set(whichBack, forKey: "backG")
    }
    @IBAction func wall5(_ sender: AnyObject) {
        whichBack = 5
        UserDefaults.standard.set(whichBack, forKey: "backG")
    }
    @IBAction func wall6(_ sender: AnyObject) {
        whichBack = 6
        UserDefaults.standard.set(whichBack, forKey: "backG")
    }
    @IBAction func wall7(_ sender: AnyObject) {
        whichBack = 7
        UserDefaults.standard.set(whichBack, forKey: "backG")
    }
    @IBAction func wall8(_ sender: AnyObject) {
        whichBack = 8
        UserDefaults.standard.set(whichBack, forKey: "backG")
    }
    @IBAction func wall9(_ sender: AnyObject) {
        whichBack = 9
        UserDefaults.standard.set(whichBack, forKey: "backG")
    }
    @IBAction func wallDef(_ sender: AnyObject) {
        whichBack = 0
        UserDefaults.standard.set(whichBack, forKey: "backG")
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
