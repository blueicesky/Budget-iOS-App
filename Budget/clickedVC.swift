//
//  clickedVC.swift
//  Budget
//
//  Created by Frank Wang on 2016-06-07.
//  Copyright © 2016 Lemma Inc. All rights reserved.
//

import UIKit
import CoreData

var which111 = 0
var catI = 1
var moneyT = ""
var descL = ""

class clickedVC: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var catImage: UIImageView!
    @IBOutlet var moneyText: UITextField!
    @IBOutlet var descLab: UILabel!
    @IBOutlet var descNew: UITextField!
    
    
    var value = 0.00
    
    @IBAction func editComplete(_ sender: AnyObject) {
        
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.managedObjectContext
        
        if descLab.text == "" && descNew.text != ""{
            
            let string1 = descNew.text
            results[which111].setValue(string1, forKey: "desc")
            
        }else if (descLab.text != "" && descNew.text != ""){
            
            let string1 = descNew.text
            results[which111].setValue(string1, forKey: "desc")
            
        }
        
        
        if moneyText.text == ""{
            let newVal = Double(moneyT)!
        }else{
            var newVal = Double(moneyText.text!)!
            var newVal1 = newVal - Double(moneyT)!
            results[which111].setValue(String(newVal), forKey: "money")
            results[which111].setValue(newVal, forKey: "totalmoney")
            
            
            
            //--------
            let objectID = results[which111].value(forKey: "dateMonth")! as! Int
            let objectDay = results[which111].value(forKey: "dateNum")! as! Int
            //let totalM = results[which111].valueForKey("totalmoney")! as! Double
            
            if(results[which111].value(forKey: "imageSpend")! as! Int) == 1{
                
                spending[which111] += newVal1
                UserDefaults.standard.setValue(spending, forKey: "spendList")
                total = total - newVal1
                UserDefaults.standard.set(total, forKey: "totalMon")
                income1 += newVal1
                UserDefaults.standard.set(income1, forKey: "9")
                
                
                if (objectDay >= 22 && objectDay <= 28){
                    
                    let date2 = objectID
                    let predicate = NSPredicate(format: "month == \(date2)")
                    
                    let fetchRequest = NSFetchRequest(entityName: "AMon")
                    //fetchRequest.resultType = NSFetchRequestResultType.DictionaryResultType
                    fetchRequest.predicate = predicate
                    
                    
                    
                    
                    do {
                        let fetchedEntities = try context.fetch(fetchRequest) as! [AMon]
                        
                        
                        
                        
                        if fetchedEntities.first?.income4 == nil{
                            
                            fetchedEntities.first?.income4 = 0
                            
                        }else{
                            let value = fetchedEntities.first?.income4
                            fetchedEntities.first?.income4 = value! + newVal1
                        }
                        
                    } catch {
                        // Do something in response to error condition
                    }
                    
                    do {
                        try context.save()
                    } catch {
                        print("ERROR SAVING AGAIN!!!")
                    }
                    
                    
                }else if (objectDay >= 1 && objectDay <= 7){
                    
                    let date2 = objectID
                    let predicate = NSPredicate(format: "month == \(date2)")
                    
                    let fetchRequest = NSFetchRequest(entityName: "AMon")
                    //fetchRequest.resultType = NSFetchRequestResultType.DictionaryResultType
                    fetchRequest.predicate = predicate
                    
                    
                    
                    
                    do {
                        let fetchedEntities = try context.fetch(fetchRequest) as! [AMon]
                        
                        
                        
                        
                        if fetchedEntities.first?.income1 == nil{
                            
                            fetchedEntities.first?.income1 = 0
                            
                        }else{
                            let value = fetchedEntities.first?.income1
                            fetchedEntities.first?.income1 = value! + newVal1
                        }
                        
                    } catch {
                        // Do something in response to error condition
                    }
                    
                    do {
                        try context.save()
                    } catch {
                        print("ERROR SAVING AGAIN!!!")
                    }
                    
                    
                }else if (objectDay >= 8 && objectDay <= 14){
                    
                    let date2 = objectID
                    let predicate = NSPredicate(format: "month == \(date2)")
                    
                    let fetchRequest = NSFetchRequest(entityName: "AMon")
                    //fetchRequest.resultType = NSFetchRequestResultType.DictionaryResultType
                    fetchRequest.predicate = predicate
                    
                    
                    
                    
                    do {
                        let fetchedEntities = try context.fetch(fetchRequest) as! [AMon]
                        
                        
                        
                        
                        if fetchedEntities.first?.income2 == nil{
                            
                            fetchedEntities.first?.income2 = 0
                            
                        }else{
                            let value = fetchedEntities.first?.income2
                            fetchedEntities.first?.income2 = value! + newVal1
                        }
                        
                    } catch {
                        // Do something in response to error condition
                    }
                    
                    do {
                        try context.save()
                    } catch {
                        print("ERROR SAVING AGAIN!!!")
                    }
                    
                    
                }else if (objectDay >= 15 && objectDay <= 21){
                    
                    let date2 = objectID
                    let predicate = NSPredicate(format: "month == \(date2)")
                    
                    let fetchRequest = NSFetchRequest(entityName: "AMon")
                    //fetchRequest.resultType = NSFetchRequestResultType.DictionaryResultType
                    fetchRequest.predicate = predicate
                    
                    
                    
                    
                    do {
                        let fetchedEntities = try context.fetch(fetchRequest) as! [AMon]
                        
                        
                        
                        
                        if fetchedEntities.first?.income3 == nil{
                            
                            fetchedEntities.first?.income3 = 0
                            
                        }else{
                            let value = fetchedEntities.first?.income3
                            fetchedEntities.first?.income3 = value! + newVal1
                        }
                        
                    } catch {
                        // Do something in response to error condition
                    }
                    
                    do {
                        try context.save()
                    } catch {
                        print("ERROR SAVING AGAIN!!!")
                    }
                    
                    
                }else{
                    
                    let date2 = objectID
                    let predicate = NSPredicate(format: "month == \(date2)")
                    
                    let fetchRequest = NSFetchRequest(entityName: "AMon")
                    //fetchRequest.resultType = NSFetchRequestResultType.DictionaryResultType
                    fetchRequest.predicate = predicate
                    
                    
                    
                    
                    do {
                        let fetchedEntities = try context.fetch(fetchRequest) as! [AMon]
                        
                        
                        if fetchedEntities.first?.income5 == nil{
                            
                            fetchedEntities.first?.income5 = 0
                            
                        }else{
                            let value = fetchedEntities.first?.income5
                            fetchedEntities.first?.income5 = value! + newVal1
                        }
                        
                    } catch {
                        // Do something in response to error condition
                    }
                    
                    do {
                        try context.save()
                    } catch {
                        print("ERROR SAVING AGAIN!!!")
                    }
                    
                    
                    
                }
                
                
                
                //NSUserDefaults.standardUserDefaults().setObject(income1, forKey: "9")
                //NSUserDefaults.standardUserDefaults().setObject(total, forKey: "totalMon")
                
            }else{
                
                spending[which111] += newVal1
                UserDefaults.standard.setValue(spending, forKey: "spendList")
                total = total + newVal1
                UserDefaults.standard.set(total, forKey: "totalMon")
                
                
                if (objectDay >= 22 && objectDay <= 28){
                    
                    let date2 = objectID
                    let predicate = NSPredicate(format: "month == \(date2)")
                    
                    let fetchRequest = NSFetchRequest(entityName: "AMon")
                    //fetchRequest.resultType = NSFetchRequestResultType.DictionaryResultType
                    fetchRequest.predicate = predicate
                    
                    
                    
                    
                    do {
                        let fetchedEntities = try context.fetch(fetchRequest) as! [AMon]
                        
                        
                        
                        
                        let value = fetchedEntities.first?.total4
                        fetchedEntities.first?.total4 = value! + newVal1
                        
                        
                    } catch {
                        // Do something in response to error condition
                    }
                    
                    do {
                        try context.save()
                    } catch {
                        print("ERROR SAVING AGAIN!!!")
                    }
                    
                    
                }else if (objectDay >= 1 && objectDay <= 7){
                    
                    let date2 = objectID
                    let predicate = NSPredicate(format: "month == \(date2)")
                    
                    let fetchRequest = NSFetchRequest(entityName: "AMon")
                    //fetchRequest.resultType = NSFetchRequestResultType.DictionaryResultType
                    fetchRequest.predicate = predicate
                    
                    
                    
                    
                    do {
                        let fetchedEntities = try context.fetch(fetchRequest) as! [AMon]
                        
                        
                        
                        
                        let value = fetchedEntities.first?.total1
                        fetchedEntities.first?.total1 = value! + newVal1
                        
                        
                        
                        // ... Update additional properties with new values
                    } catch {
                        // Do something in response to error condition
                    }
                    
                    do {
                        try context.save()
                    } catch {
                        print("ERROR SAVING AGAIN!!!")
                    }
                    
                    
                }else if (objectDay >= 8 && objectDay <= 14){
                    
                    let date2 = objectID
                    let predicate = NSPredicate(format: "month == \(date2)")
                    
                    let fetchRequest = NSFetchRequest(entityName: "AMon")
                    //fetchRequest.resultType = NSFetchRequestResultType.DictionaryResultType
                    fetchRequest.predicate = predicate
                    
                    
                    
                    
                    do {
                        let fetchedEntities = try context.fetch(fetchRequest) as! [AMon]
                        
                        
                        
                        
                        let value = fetchedEntities.first?.total2
                        fetchedEntities.first?.total2 = value! + newVal1
                        
                        
                        
                        // ... Update additional properties with new values
                    } catch {
                        // Do something in response to error condition
                    }
                    
                    do {
                        try context.save()
                    } catch {
                        print("ERROR SAVING AGAIN!!!")
                    }
                    
                    
                }else if (objectDay >= 15 && objectDay <= 21){
                    
                    let date2 = objectID
                    let predicate = NSPredicate(format: "month == \(date2)")
                    
                    let fetchRequest = NSFetchRequest(entityName: "AMon")
                    //fetchRequest.resultType = NSFetchRequestResultType.DictionaryResultType
                    fetchRequest.predicate = predicate
                    
                    
                    
                    
                    do {
                        let fetchedEntities = try context.fetch(fetchRequest) as! [AMon]
                        
                        
                        
                        
                        let value = fetchedEntities.first?.total3
                        fetchedEntities.first?.total3 = value! + newVal1
                        
                        
                        
                        // ... Update additional properties with new values
                    } catch {
                        // Do something in response to error condition
                    }
                    
                    do {
                        try context.save()
                    } catch {
                        print("ERROR SAVING AGAIN!!!")
                    }
                    
                    
                }else{
                    
                    let date2 = objectID
                    let predicate = NSPredicate(format: "month == \(date2)")
                    
                    let fetchRequest = NSFetchRequest(entityName: "AMon")
                    //fetchRequest.resultType = NSFetchRequestResultType.DictionaryResultType
                    fetchRequest.predicate = predicate
                    
                    
                    
                    
                    do {
                        let fetchedEntities = try context.fetch(fetchRequest) as! [AMon]
                        
                        
                        
                        
                        let value = fetchedEntities.first?.total5
                        fetchedEntities.first?.total5 = value! + newVal1
                        
                        
                        
                        // ... Update additional properties with new values
                    } catch {
                        // Do something in response to error condition
                    }
                    
                    do {
                        try context.save()
                    } catch {
                        print("ERROR SAVING AGAIN!!!")
                    }
                    
                    
                    
                }
                
                
                
                if (results[which111].value(forKey: "imageOf")! as? Int == 1) && (results[which111].value(forKey: "imageSpend")! as? Int == 0){
                    
                    first += newVal1
                    UserDefaults.standard.set(first, forKey: "1")
                    
                }else if (results[which111].value(forKey: "imageOf")! as? Int == 2) && (results[which111].value(forKey: "imageSpend")! as? Int == 0){
                    
                    second += newVal1
                    UserDefaults.standard.set(second, forKey: "2")
                    
                }else if (results[which111].value(forKey: "imageOf")! as? Int == 3) && (results[which111].value(forKey: "imageSpend")! as? Int == 0){
                    
                    third += newVal1
                    UserDefaults.standard.set(third, forKey: "3")
                    
                }else if (results[which111].value(forKey: "imageOf")! as? Int == 4) && (results[which111].value(forKey: "imageSpend")! as? Int == 0){
                    
                    fourth += newVal1
                    UserDefaults.standard.set(fourth, forKey: "4")
                    
                }else if (results[which111].value(forKey: "imageOf")! as? Int == 5) && (results[which111].value(forKey: "imageSpend")! as? Int == 0){
                    
                    fifth += newVal1
                    UserDefaults.standard.set(fifth, forKey: "5")
                    
                }else if (results[which111].value(forKey: "imageOf")! as? Int == 6) && (results[which111].value(forKey: "imageSpend")! as? Int == 0){
                    
                    sixth += newVal1
                    UserDefaults.standard.set(sixth, forKey: "6")
                    
                }else if (results[which111].value(forKey: "imageOf")! as? Int == 7) && (results[which111].value(forKey: "imageSpend")! as? Int == 0){
                    
                    seventh += newVal1
                    UserDefaults.standard.set(seventh, forKey: "7")
                    
                }else if (results[which111].value(forKey: "imageOf")! as? Int == 8) && (results[which111].value(forKey: "imageSpend")! as? Int == 0){
                    
                    eighth += newVal1
                    UserDefaults.standard.set(eighth, forKey: "8")
                    
                }else{
                    
                    eighth += newVal1
                    UserDefaults.standard.set(eighth, forKey: "8")
                    
                }
            }
            
            //--------
            
        }
        
        
        
        
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.moneyText.delegate = self
        self.descNew.delegate = self
        
        titleLabel.numberOfLines = 1
        titleLabel.adjustsFontSizeToFitWidth = true
        descLab.numberOfLines = 10
        descLab.adjustsFontSizeToFitWidth = true
        
        moneyText.text = moneyT
        descLab.text = "Current description: " + descL
        
        value = Double(moneyT)!
        
        
        if catI == 1{
            
            catImage.image = shop1
            
        }else if catI == 2{
            
            catImage.image = food1
            
        }else if catI == 3{
            
            catImage.image = trans1
            
        }else if catI == 4{
            
            catImage.image = movie1
            
        }else if catI == 5{
            
            catImage.image = enter1
            
        }else if catI == 6{
            
            catImage.image = gro1
            
        }else if catI == 7{
            
            catImage.image = education1
            
        }else if catI == 8{
            
            catImage.image = oth1
            
        }else if catI == 9{
            
            catImage.image = incomeImage
            
        }else{
            
            catImage.image = oth1
            
        }
        NotificationCenter.default.addObserver(self, selector: #selector(clickedVC.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(clickedVC.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        /*if fetchedEntities.first?.income4 == nil{
            
            fetchedEntities.first?.income4 = 0
            
        }else{
            let value = fetchedEntities.first?.income4
            fetchedEntities.first?.income4 = value! - totalM
        }*/
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func keyboardWillShow(_ notification: Notification) {
        
        if let keyboardSize = ((notification as NSNotification).userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.view.frame.origin.y -= keyboardSize.height
        }
        
    }
    
    func keyboardWillHide(_ notification: Notification) {
        if let keyboardSize = ((notification as NSNotification).userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.view.frame.origin.y += keyboardSize.height
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        return false;
        
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
