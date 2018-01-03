//
//  ViewController2.swift
//  Budget
//
//  Created by Frank Wang on 2016-02-09.
//  Copyright © 2016 Lemma Inc. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

var username = ""
var init111 = UserDefaults.standard.object(forKey: "init11")! as! Int
//store this ⬆️

var yesno = 0


class ViewController2: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var nameText: UITextField!
    
    @IBOutlet var lab: UILabel!
    
    
    @IBAction func finishStart(_ sender: AnyObject) {
        
        if init111 == 0{
            UserDefaults.standard.set(1, forKey: "init11")
            UserDefaults.standard.set(0.00, forKey: "totalMon")
            UserDefaults.standard.set(0, forKey: "initTrue")
            UserDefaults.standard.set(0, forKey: "curMonth")
            UserDefaults.standard.set(0, forKey: "atmArr")
            UserDefaults.standard.set("", forKey: "dateSum")
            UserDefaults.standard.set(0.00, forKey: "1")
            UserDefaults.standard.set(0.00, forKey: "2")
            UserDefaults.standard.set(0.00, forKey: "3")
            UserDefaults.standard.set(0.00, forKey: "4")
            UserDefaults.standard.set(0.00, forKey: "5")
            UserDefaults.standard.set(0.00, forKey: "6")
            UserDefaults.standard.set(0.00, forKey: "7")
            UserDefaults.standard.set(0.00, forKey: "8")
            UserDefaults.standard.set(0.00, forKey: "9")
            let trans = UIImage(named: "icon-profile")
            UserDefaults.standard.set(UIImagePNGRepresentation(trans!), forKey: "profImage")
            UserDefaults.standard.set(1, forKey: "currency")
            UserDefaults.standard.set("$", forKey: "preCur")
            UserDefaults.standard.set(0, forKey: "backG")
            UserDefaults.standard.set(0, forKey: "EXEX")
            if (nameText.text == ""){
                username = "Username"
                UserDefaults.standard.set(username, forKey: "user")
            }else{
                username = nameText.text!
                UserDefaults.standard.set(username, forKey: "user")
            }
        }
        
    }
    
    @IBAction func sound2(_ sender: AnyObject) {
        
        AudioServicesPlaySystemSound(SystemSoundID(1104))
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        lab.numberOfLines = 1
        lab.adjustsFontSizeToFitWidth = true
        nameText.adjustsFontSizeToFitWidth = true
        self.nameText.delegate = self
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        self.view.endEditing(true)
        
        
    }
    
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true;
        
    }
    
    

}
