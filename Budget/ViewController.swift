//
//  ViewController.swift
//  Budget
//
//  Created by Frank Wang on 2016-02-05.
//  Copyright © 2016 Lemma Inc. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class ViewController: UIViewController {

    @IBOutlet var image1: UIImageView!
    
    @IBOutlet var image2: UIImageView!
    
    @IBOutlet var image3: UIImageView!
    
    @IBOutlet var welcomeLabel: UILabel!
  
    @IBOutlet var getStarted: UIButton!
 
    @IBAction func sound1(_ sender: AnyObject) {
        
        AudioServicesPlaySystemSound(SystemSoundID(1104))
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.adjustsFontSizeToFitWidth = true
        welcomeLabel.numberOfLines = 2
        if UserDefaults.standard.object(forKey: "init11") == nil{
            UserDefaults.standard.set(0, forKey: "init11")
        }else{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil) // this assumes your storyboard is titled "Main.storyboard"
            let yourVC = mainStoryboard.instantiateViewControllerWithIdentifier("97Main") as! SWRevealViewController // inside "YOUR_VC_IDENTIFIER" substitute the Storyboard ID you created in step 2 for the view controller you want to open here. And substitute YourViewController with the name of your view controller, like, for example, ViewController2.
            appDelegate.window?.rootViewController = yourVC
            appDelegate.window?.makeKeyAndVisible()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        
        image1.alpha = 0
        
        image2.center = CGPoint(x: image2.center.x - 400, y: image2.center.y)
        
        image3.center = CGPoint(x: image3.center.x, y: image3.center.y - 400)
        
        welcomeLabel.alpha = 0
        
        getStarted.alpha = 0
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 2) { () -> Void in
            
            self.image1.alpha = 0.9
            
            self.image2.center = CGPoint(x: self.image2.center.x + 400, y: self.image2.center.y)
            
            self.image3.center = CGPoint(x: self.image3.center.x, y: self.image3.center.y + 400)
            
            self.welcomeLabel.alpha = 1
            
            self.getStarted.alpha = 1
            
        }
        
        
        
    }


}

