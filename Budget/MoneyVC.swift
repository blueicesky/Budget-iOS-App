//
//  MoneyVC.swift
//  Budget
//
//  Created by Frank Wang on 2016-05-29.
//  Copyright © 2016 Lemma Inc. All rights reserved.
//

import UIKit
import Foundation

class MoneyVC: UIViewController {
    
    
    @IBOutlet var title22: UILabel!
    
    
    @IBAction func cur1(_ sender: AnyObject) {
        currency = 1
        UserDefaults.standard.set(currency, forKey: "currency")
    }
    @IBAction func cur2(_ sender: AnyObject) {
        currency = 2
        UserDefaults.standard.set(currency, forKey: "currency")
    }
    @IBAction func cur3(_ sender: AnyObject) {
        currency = 3
        UserDefaults.standard.set(currency, forKey: "currency")
    }
    @IBAction func cur4(_ sender: AnyObject) {
        currency = 4
        UserDefaults.standard.set(currency, forKey: "currency")
    }
    @IBAction func cur5(_ sender: AnyObject) {
        currency = 5
        UserDefaults.standard.set(currency, forKey: "currency")
    }
    @IBAction func cur6(_ sender: AnyObject) {
        currency = 6
        UserDefaults.standard.set(currency, forKey: "currency")
    }
    @IBAction func cur8(_ sender: AnyObject) {
        currency = 8
        UserDefaults.standard.set(currency, forKey: "currency")
    }
    @IBAction func cur7(_ sender: AnyObject) {
        currency = 7
        UserDefaults.standard.set(currency, forKey: "currency")
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title22.numberOfLines = 1
        title22.adjustsFontSizeToFitWidth = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    /*
     
     if currency == 1{//CAD
     
     }else if currency == 2{//USD
     
     
     }else if currency == 3{//EURO
     
     
     }else if currency == 4{//British Pounds
     
     
     }else if currency == 5{//Chinese Yuan
     
     
     }else if currency == 6{//Japanese Yen
     
     
     }else if currency == 7{//Indian Rupees
     
     
     }else if currency == 8{//Russian Ruble
     
     
     }

 */
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
