//
//  AddVC.swift
//  Budget
//
//  Created by Frank Wang on 2016-02-12.
//  Copyright © 2016 Lemma Inc. All rights reserved.
//

import Foundation
import AVFoundation
import AudioToolbox
import UIKit
import CoreData

var inited = UserDefaults.standard.object(forKey: "initTrue")! as! Int//need to store


//NSUserDefaults.standardUserDefaults().objectForKey("EXEX")! as! Int
var existedMon = 0
//need to store⬆️
//var thisMon = 0
var preFix = UserDefaults.standard.object(forKey: "preCur") as! String

class AddVC: UIViewController, UITextFieldDelegate{
    @IBOutlet var textMoney: UITextField!
    
    var yesDo = false
    var yesDo1 = false
    
    @IBAction func pressed(_ sender: AnyObject) {
        
        yesDo1 = true
        
    }
    //Labels
    @IBOutlet var mainL: UILabel!
    @IBOutlet var curLabel: UILabel!
    
    //CoreData
    
    @IBOutlet var currencyLabel: UILabel!
    
    
    //_______
    
    @IBAction func SoundOnly(_ sender: AnyObject) {
        
        AudioServicesPlaySystemSound(SystemSoundID(1306))
    }
    
    
    @IBAction func soundToo(_ sender: AnyObject) {
        
        AudioServicesPlaySystemSound(SystemSoundID(1306))
    }
    
    @IBAction func soundToo2(_ sender: AnyObject) {
        
        AudioServicesPlaySystemSound(SystemSoundID(1306))
    }
    
    //Today's Date
    
    
    var cashUsed = String()
    var typeUsed = "Credit"
    //date
    @IBOutlet var myDate: UIDatePicker!
    @IBOutlet var notesTF: UITextField!
    
    
    //income/spent buttons and images
    @IBOutlet var spentImage: UIImageView!
    @IBOutlet var incomeImage: UIImageView!
    @IBOutlet var creditI: UIImageView!
    @IBOutlet var debitI: UIImageView!
    @IBOutlet var cashI: UIImageView!
    
    
    //---
    
    
    //Cash-credit-debit buttons
    var typeSpend = 1//only 1-3!!!
    var cW: UIImage = UIImage(named:"credit button white")!
    var cG: UIImage = UIImage(named:"Credit button")!
    var dW: UIImage = UIImage(named:"debit button white")!
    var dG: UIImage = UIImage(named:"debit button")!
    var cashW: UIImage = UIImage(named:"Cash button white")!
    var cashG: UIImage = UIImage(named:"Cash button")!
    @IBAction func creditB(_ sender: AnyObject) {
        creditI.image = cG
        debitI.image = dW
        cashI.image = cashW
        typeSpend = 1
        self.resignFirstResponder()
        textFieldShouldReturn(textMoney)
        AudioServicesPlaySystemSound(SystemSoundID(1306))
        
    }
    @IBAction func debitB(_ sender: AnyObject) {
        creditI.image = cW
        debitI.image = dG
        cashI.image = cashW
        typeSpend = 2
        textFieldShouldReturn(textMoney)
        self.resignFirstResponder()
        AudioServicesPlaySystemSound(SystemSoundID(1306))
        
    }
    @IBAction func cashB(_ sender: AnyObject) {
        creditI.image = cW
        debitI.image = dW
        cashI.image = cashG
        typeSpend = 3
        self.resignFirstResponder()
        textFieldShouldReturn(textMoney)
        AudioServicesPlaySystemSound(SystemSoundID(1306))
    }
    
    
    
    //Cash-credit-debit images
    @IBOutlet var creditImage: UIImageView!
    @IBOutlet var debitImage: UIImageView!
    @IBOutlet var cashImage: UIImageView!
    
    
    
    
    //the 8 option images in order
    @IBOutlet var image1: UIImageView!
    @IBOutlet var image2: UIImageView!
    @IBOutlet var image3: UIImageView!
    @IBOutlet var image4: UIImageView!
    @IBOutlet var image5: UIImageView!
    @IBOutlet var image6: UIImageView!
    @IBOutlet var image7: UIImageView!
    @IBOutlet var image8: UIImageView!
    //the 16 gold-white buttons image as UIImage
    var b1W: UIImage = UIImage(named:"Shopping button")!
    var b1G: UIImage = UIImage(named:"Shopping button1")!
    var b2W: UIImage = UIImage(named:"Food&Drinks button")!
    var b2G: UIImage = UIImage(named:"Food&Drinks button1")!
    var b3W: UIImage = UIImage(named:"Travel button")!
    var b3G: UIImage = UIImage(named:"Travel button1")!
    var b4W: UIImage = UIImage(named:"Movies button")!
    var b4G: UIImage = UIImage(named:"Movies button1")!
    var b5W: UIImage = UIImage(named:"Entertainment button")!
    var b5G: UIImage = UIImage(named:"Entertainment button1")!
    var b6W: UIImage = UIImage(named:"Grocery button")!
    var b6G: UIImage = UIImage(named:"Grocery button1")!
    var b7W: UIImage = UIImage(named:"Education button")!
    var b7G: UIImage = UIImage(named:"Education button1")!
    var b8W: UIImage = UIImage(named:"Others button")!
    var b8G: UIImage = UIImage(named:"Others button1")!
    
    //selection variable 1-8 ONLY
    var selection = 0
    //the 8 options buttons in order
    @IBAction func shopB(_ sender: AnyObject) {
        image1.image = b1G
        image2.image = b2W
        image3.image = b3W
        image4.image = b4W
        image5.image = b5W
        image6.image = b6W
        image7.image = b7W
        image8.image = b8W
        selection = 1
        self.resignFirstResponder()
        AudioServicesPlaySystemSound(SystemSoundID(1306))
        textFieldShouldReturn(textMoney)
        
        //added somethinghere
        //here
        //here
        
    }
    @IBAction func foodB(_ sender: AnyObject) {
        image1.image = b1W
        image2.image = b2G
        image3.image = b3W
        image4.image = b4W
        image5.image = b5W
        image6.image = b6W
        image7.image = b7W
        image8.image = b8W
        selection = 2
        self.resignFirstResponder()
        AudioServicesPlaySystemSound(SystemSoundID(1306))
        textFieldShouldReturn(textMoney)
    }
    @IBAction func travelB(_ sender: AnyObject) {
        image1.image = b1W
        image2.image = b2W
        image3.image = b3G
        image4.image = b4W
        image5.image = b5W
        image6.image = b6W
        image7.image = b7W
        image8.image = b8W
        selection = 3
        self.resignFirstResponder()
        AudioServicesPlaySystemSound(SystemSoundID(1306))
        textFieldShouldReturn(textMoney)
    }
    @IBAction func moviesB(_ sender: AnyObject) {
        image1.image = b1W
        image2.image = b2W
        image3.image = b3W
        image4.image = b4G
        image5.image = b5W
        image6.image = b6W
        image7.image = b7W
        image8.image = b8W
        selection = 4
        self.resignFirstResponder()
        AudioServicesPlaySystemSound(SystemSoundID(1306))
        textFieldShouldReturn(textMoney)
    }
    @IBAction func entB(_ sender: AnyObject) {
        image1.image = b1W
        image2.image = b2W
        image3.image = b3W
        image4.image = b4W
        image5.image = b5G
        image6.image = b6W
        image7.image = b7W
        image8.image = b8W
        selection = 5
        self.resignFirstResponder()
        AudioServicesPlaySystemSound(SystemSoundID(1306))
        textFieldShouldReturn(textMoney)
    }
    @IBAction func groB(_ sender: AnyObject) {
        image1.image = b1W
        image2.image = b2W
        image3.image = b3W
        image4.image = b4W
        image5.image = b5W
        image6.image = b6G
        image7.image = b7W
        image8.image = b8W
        selection = 6
        self.resignFirstResponder()
        AudioServicesPlaySystemSound(SystemSoundID(1306))
        textFieldShouldReturn(textMoney)
    }
    @IBAction func eduB(_ sender: AnyObject) {
        image1.image = b1W
        image2.image = b2W
        image3.image = b3W
        image4.image = b4W
        image5.image = b5W
        image6.image = b6W
        image7.image = b7G
        image8.image = b8W
        selection = 7
        self.resignFirstResponder()
        AudioServicesPlaySystemSound(SystemSoundID(1306))
        textFieldShouldReturn(textMoney)
    }
    @IBAction func othersB(_ sender: AnyObject) {
        image1.image = b1W
        image2.image = b2W
        image3.image = b3W
        image4.image = b4W
        image5.image = b5W
        image6.image = b6W
        image7.image = b7W
        image8.image = b8G
        selection = 8
        self.resignFirstResponder()
        AudioServicesPlaySystemSound(SystemSoundID(1306))
        textFieldShouldReturn(textMoney)
    }
    
    
    
    
    
    
    
    //spent buttons/income buttons gold-white
    var sGold: UIImage = UIImage(named:"Spent gold")!
    var sWhite: UIImage = UIImage(named:"Spent white")!
    var iGold: UIImage = UIImage(named:"Income gold")!
    var iWhite: UIImage = UIImage(named:"Income white")!
    
    
    //spent variable
    var spent = 0
    //1-0 ONLY!!!
    
    @IBAction func incomeMake(_ sender: AnyObject) {
        incomeImage.image = iGold;
        spentImage.image = sWhite;
        spent = 1
        self.resignFirstResponder()
        textFieldShouldReturn(textMoney)
        AudioServicesPlaySystemSound(SystemSoundID(1306))
    }
    
    
    @IBAction func spentMake(_ sender: AnyObject) {
        incomeImage.image = iWhite;
        spentImage.image = sGold;
        spent = 0
        self.resignFirstResponder()
        textFieldShouldReturn(textMoney)
        AudioServicesPlaySystemSound(SystemSoundID(1306))
    }
    
    var date = Date()
    var notesToGo = ""
    //do income/spent
    
    
    @IBAction func confirmB(_ sender: AnyObject) {
        
        cashUsed = textMoney.text!
        
        date = myDate.date
        
        notesToGo = notesTF.text!
        
        if (cashUsed == ""){
            cashUsed = "0"
        }
        
        if (spent == 1){
            total -= Double(cashUsed)!
            UserDefaults.standard.set(total, forKey: "totalMon")
        }else{
            total += Double(cashUsed)!
            UserDefaults.standard.set(total, forKey: "totalMon")
        }
        
        if (typeSpend == 1){
            
            typeUsed = "Credit"
            
        }else if(typeSpend == 2){
            
            typeUsed = "Debit"
            
        }else if(typeSpend == 3){
            
            typeUsed = "Cash"
            
        }
        AudioServicesPlaySystemSound(SystemSoundID(1306))
        
        /***** NSDateFormatter Part *****/
        
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        let formatterTry = DateFormatter()
        formatterTry.dateFormat = "M"
        let formatYear = DateFormatter()
        formatYear.dateFormat = "y"
        let formatMon = DateFormatter()
        formatMon.dateFormat = "E"
        let format222 = DateFormatter()
        format222.dateFormat = "MMM"
        //let dateMon = formatMon.stringFromDate(date)
        
        let dateYear = formatYear.string(from: date)
        
        let dateString2 = formatterTry.string(from: date)
        let dateString = formatter.string(from: date)
        let dateString222 = format222.string(from: date)
        
        let appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let newEntry = NSEntityDescription.insertNewObject(forEntityName: "Entry", into: context) 
        
        if (cashUsed == ""){
            
            cashUsed = "0"
            
        }
        
        if (selection == 1) && (spent == 0){
            
            newEntry.setValue("Shopping", forKey: "title")
            first += Double(cashUsed)!
            UserDefaults.standard.set(first, forKey: "1")
            
        }else if (selection == 2) && (spent == 0){
            
            newEntry.setValue("Food & Drinks", forKey: "title")
            second += Double(cashUsed)!
            UserDefaults.standard.set(second, forKey: "2")
            
        }else if (selection == 3) && (spent == 0){
            
            newEntry.setValue("Travel", forKey: "title")
            third += Double(cashUsed)!
            UserDefaults.standard.set(third, forKey: "3")
            
        }else if (selection == 4) && (spent == 0){
            
            newEntry.setValue("Movies", forKey: "title")
            fourth += Double(cashUsed)!
            UserDefaults.standard.set(fourth, forKey: "4")
            
        }else if (selection == 5) && (spent == 0){
            
            newEntry.setValue("Entertainment", forKey: "title")
            fifth += Double(cashUsed)!
            UserDefaults.standard.set(fifth, forKey: "5")
            
        }else if (selection == 6) && (spent == 0){
            
            newEntry.setValue("Groceries", forKey: "title")
            sixth += Double(cashUsed)!
            UserDefaults.standard.set(sixth, forKey: "6")
            
        }else if (selection == 7) && (spent == 0){
            
            newEntry.setValue("Education", forKey: "title")
            seventh += Double(cashUsed)!
            UserDefaults.standard.set(seventh, forKey: "7")
            
        }else if (selection == 8) && (spent == 0){
            
            newEntry.setValue("Others", forKey: "title")
            eighth += Double(cashUsed)!
            UserDefaults.standard.set(eighth, forKey: "8")
            
        }else if (spent == 1){
            
            newEntry.setValue("Income", forKey: "title")
            income1 += Double(cashUsed)!
            UserDefaults.standard.set(income1, forKey: "9")
            selection = 9
            
            
        }else{
            
            newEntry.setValue("Others", forKey: "title")
            if (spent == 0){
                eighth += Double(cashUsed)!
                UserDefaults.standard.set(eighth, forKey: "8")
            }
            
        }
        
        var afterDate = dateString
        
        if (afterDate == "1" || afterDate == "01"){
            
            afterDate = "st"
            
        }else if (afterDate == "2" || afterDate == "02"){
            
            afterDate = "nd"
            
        }else if (afterDate == "3" || afterDate == "03"){
            
            afterDate = "rd"
            
        }else{
            
            afterDate = "th"
            
        }
        
        
        //spent 1-0
        //1 is income
        //0 is spent
        
        
        
        newEntry.setValue(dateString222 + " " + dateString + afterDate, forKey: "date")
        newEntry.setValue(cashUsed, forKey: "money")
        newEntry.setValue(Double(cashUsed)!, forKey: "totalmoney")
        newEntry.setValue(typeUsed, forKey: "type")
        newEntry.setValue(notesToGo, forKey: "desc")
        newEntry.setValue(selection, forKey: "imageOf")
        newEntry.setValue(spent, forKey: "imageSpend")
        newEntry.setValue(Int(dateString)!, forKey: "dateNum")
        newEntry.setValue(Int(dateString2)!, forKey: "dateMonth")
        
        do{
            try context.save()
            print("Saved Successfully")
            
        }catch _ {
            print("Save Failed")
        }
        
        
        
        if spent == 0{
            
            if currentMon != Int(dateString2)! && existedMon != Int(dateString2)!{
                
                let dateCurrent = Date()
                let dateForm1 = DateFormatter()
                inited = 1
                UserDefaults.standard.set(true, forKey: "initTrue")
                let dateSum = dateString2
                dateForm1.dateFormat = "y"
                let currentMon1 = Int(dateSum)!
                existedMon = currentMon1
                if UserDefaults.standard.object(forKey: "EXEX") == nil{
                    
                    UserDefaults.standard.set(currentMon1, forKey: "EXEX")
                    
                }else{
                    UserDefaults.standard.set(existedMon, forKey: "EXEX")
                }
                
                
                let newMonth = NSEntityDescription.insertNewObject(forEntityName: "AMon", into: context) as NSManagedObject
                
                newMonth.setValue(currentMon1, forKey: "month")
                newMonth.setValue(Int(dateForm1.string(from: dateCurrent))!, forKey: "year")
                
                newMonth.setValue(0, forKey: "income1")
                newMonth.setValue(0, forKey: "income2")
                newMonth.setValue(0, forKey: "income3")
                newMonth.setValue(0, forKey: "income4")
                
                if (currentMon1 == 1 || currentMon1 == 3 || currentMon1 == 5 ||
                    currentMon1 == 7 || currentMon1 == 8 || currentMon1 == 10 ||
                    currentMon1 == 12){
                    
                    newMonth.setValue(5, forKey: "weeks")
                    newMonth.setValue(1, forKey: "start1")
                    newMonth.setValue(7, forKey: "end1")
                    newMonth.setValue(0, forKey: "total1")
                    newMonth.setValue(0, forKey: "high1")
                    
                    newMonth.setValue(8, forKey: "start2")
                    newMonth.setValue(14, forKey: "end2")
                    newMonth.setValue(0, forKey: "total2")
                    newMonth.setValue(0, forKey: "high2")
                    
                    newMonth.setValue(15, forKey: "start3")
                    newMonth.setValue(21, forKey: "end3")
                    newMonth.setValue(0, forKey: "total3")
                    newMonth.setValue(0, forKey: "high3")
                    
                    newMonth.setValue(22, forKey: "start4")
                    newMonth.setValue(28, forKey: "end4")
                    newMonth.setValue(0, forKey: "total4")
                    newMonth.setValue(0, forKey: "high4")
                    
                    newMonth.setValue(29, forKey: "start5")
                    newMonth.setValue(31, forKey: "end5")
                    newMonth.setValue(0, forKey: "total5")
                    newMonth.setValue(0, forKey: "high5")
                    
                    
                }else if(currentMon1 == 2){
                    
                    newMonth.setValue(5, forKey: "weeks")
                    newMonth.setValue(1, forKey: "start1")
                    newMonth.setValue(7, forKey: "end1")
                    newMonth.setValue(0, forKey: "total1")
                    newMonth.setValue(0, forKey: "high1")
                    
                    newMonth.setValue(8, forKey: "start2")
                    newMonth.setValue(14, forKey: "end2")
                    newMonth.setValue(0, forKey: "total2")
                    newMonth.setValue(0, forKey: "high2")
                    
                    newMonth.setValue(15, forKey: "start3")
                    newMonth.setValue(21, forKey: "end3")
                    newMonth.setValue(0, forKey: "total3")
                    newMonth.setValue(0, forKey: "high3")
                    
                    newMonth.setValue(22, forKey: "start4")
                    newMonth.setValue(28, forKey: "end4")
                    newMonth.setValue(0, forKey: "total4")
                    newMonth.setValue(0, forKey: "high4")
                    
                    newMonth.setValue(29, forKey: "start5")
                    newMonth.setValue(29, forKey: "end5")
                    newMonth.setValue(0, forKey: "total5")
                    newMonth.setValue(0, forKey: "high5")
                    
                }else{
                    newMonth.setValue(5, forKey: "weeks")
                    newMonth.setValue(1, forKey: "start1")
                    newMonth.setValue(7, forKey: "end1")
                    newMonth.setValue(0, forKey: "total1")
                    newMonth.setValue(0, forKey: "high1")
                    
                    newMonth.setValue(8, forKey: "start2")
                    newMonth.setValue(14, forKey: "end2")
                    newMonth.setValue(0, forKey: "total2")
                    newMonth.setValue(0, forKey: "high2")
                    
                    newMonth.setValue(15, forKey: "start3")
                    newMonth.setValue(21, forKey: "end3")
                    newMonth.setValue(0, forKey: "total3")
                    newMonth.setValue(0, forKey: "high3")
                    
                    newMonth.setValue(22, forKey: "start4")
                    newMonth.setValue(28, forKey: "end4")
                    newMonth.setValue(0, forKey: "total4")
                    newMonth.setValue(0, forKey: "high4")
                    
                    newMonth.setValue(29, forKey: "start5")
                    newMonth.setValue(30, forKey: "end5")
                    newMonth.setValue(0, forKey: "total5")
                    newMonth.setValue(0, forKey: "high5")
                    
                }
                
                
                
                do {
                    
                    try context.save()
                    
                    
                    
                }catch _ {
                    
                    print("ERROR OCCURED")
                    
                }
                
                
                
            }
            
            
            let date1 = Int(dateString)!
            
            if (date1 >= 22 && date1 <= 28){
                
                let date2 = Int(dateString2)!
                let predicate = NSPredicate(format: "month == \(date2)")
                
                let fetchRequest = NSFetchRequest(entityName: "AMon")
                //fetchRequest.resultType = NSFetchRequestResultType.DictionaryResultType
                fetchRequest.predicate = predicate
                
                
                
                
                do {
                    let fetchedEntities = try context.fetch(fetchRequest) as! [AMon]
                    
                    
                    
                    
                    let value = fetchedEntities.first?.total4
                    fetchedEntities.first?.total4 = value! + Double(cashUsed)!
                    
                    let value2 = fetchedEntities.first?.high4
                    
                    if value2! < Double(cashUsed)!{
                        fetchedEntities.first?.high4 = Double(cashUsed)!
                    }
                    
                    
                    // ... Update additional properties with new values
                } catch {
                    // Do something in response to error condition
                }
                
                do {
                    try context.save()
                } catch {
                    print("ERROR SAVING AGAIN!!!")
                }

                
            }else if (date1 >= 1 && date1 <= 7){
                
                let date2 = Int(dateString2)!
                let predicate = NSPredicate(format: "month == \(date2)")
                
                let fetchRequest = NSFetchRequest(entityName: "AMon")
                //fetchRequest.resultType = NSFetchRequestResultType.DictionaryResultType
                fetchRequest.predicate = predicate
                
                
                
                
                do {
                    let fetchedEntities = try context.fetch(fetchRequest) as! [AMon]
                    
                    
                    
                    
                    let value = fetchedEntities.first?.total1
                    fetchedEntities.first?.total1 = value! + Double(cashUsed)!
                    
                    let value2 = fetchedEntities.first?.high1
                    
                    if value2! < Double(cashUsed)!{
                        fetchedEntities.first?.high1 = Double(cashUsed)!
                    }
                    
                    
                    
                    // ... Update additional properties with new values
                } catch {
                    // Do something in response to error condition
                }
                
                do {
                    try context.save()
                } catch {
                    print("ERROR SAVING AGAIN!!!")
                }

                
            }else if (date1 >= 8 && date1 <= 14){
                
                let date2 = Int(dateString2)!
                let predicate = NSPredicate(format: "month == \(date2)")
                
                let fetchRequest = NSFetchRequest(entityName: "AMon")
                //fetchRequest.resultType = NSFetchRequestResultType.DictionaryResultType
                fetchRequest.predicate = predicate
                
                
                
                
                do {
                    let fetchedEntities = try context.fetch(fetchRequest) as! [AMon]
                    
                    
                    
                    
                    let value = fetchedEntities.first?.total2
                    fetchedEntities.first?.total2 = value! + Double(cashUsed)!
                    
                    let value2 = fetchedEntities.first?.high2
                    
                    if value2! < Double(cashUsed)!{
                        fetchedEntities.first?.high2 = Double(cashUsed)!
                    }
                    
                    
                    
                    // ... Update additional properties with new values
                } catch {
                    // Do something in response to error condition
                }
                
                do {
                    try context.save()
                } catch {
                    print("ERROR SAVING AGAIN!!!")
                }

                
            }else if (date1 >= 15 && date1 <= 21){
                
                let date2 = Int(dateString2)!
                let predicate = NSPredicate(format: "month == \(date2)")
                
                let fetchRequest = NSFetchRequest(entityName: "AMon")
                //fetchRequest.resultType = NSFetchRequestResultType.DictionaryResultType
                fetchRequest.predicate = predicate
                
                
                
                
                do {
                    let fetchedEntities = try context.fetch(fetchRequest) as! [AMon]
                    
                    
                    
                    
                    let value = fetchedEntities.first?.total3
                    fetchedEntities.first?.total3 = value! + Double(cashUsed)!
                    
                    let value2 = fetchedEntities.first?.high3
                    
                    if value2! < Double(cashUsed)!{
                        fetchedEntities.first?.high3 = Double(cashUsed)!
                    }
                    
                    
                    
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
                
                let date2 = Int(dateString2)!
                let predicate = NSPredicate(format: "month == \(date2)")
                
                let fetchRequest = NSFetchRequest(entityName: "AMon")
                //fetchRequest.resultType = NSFetchRequestResultType.DictionaryResultType
                fetchRequest.predicate = predicate
                
                
                
                
                do {
                    let fetchedEntities = try context.fetch(fetchRequest) as! [AMon]
                    
                    
                    
                    
                    let value = fetchedEntities.first?.total5
                    fetchedEntities.first?.total5 = value! + Double(cashUsed)!
                    
                    let value2 = fetchedEntities.first?.high5
                    
                    if value2! < Double(cashUsed)!{
                        fetchedEntities.first?.high5 = Double(cashUsed)!
                    }
                    
                    
                    
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
            
            
            
        }else{
            if currentMon != Int(dateString2)! && existedMon != Int(dateString2)!{
                
                
                
                let dateCurrent = Date()
                let dateForm1 = DateFormatter()
                inited = 1
                UserDefaults.standard.set(true, forKey: "initTrue")
                let dateSum = dateString2
                dateForm1.dateFormat = "y"
                let currentMon1 = Int(dateSum)!
                existedMon = currentMon1
                if UserDefaults.standard.object(forKey: "EXEX") == nil{
                    
                    UserDefaults.standard.set(currentMon1, forKey: "EXEX")
                    
                }else{
                    UserDefaults.standard.set(existedMon, forKey: "EXEX")
                }
                
                let newMonth = NSEntityDescription.insertNewObject(forEntityName: "AMon", into: context) as NSManagedObject
                
                newMonth.setValue(currentMon1, forKey: "month")
                newMonth.setValue(Int(dateForm1.string(from: dateCurrent))!, forKey: "year")
                
                newMonth.setValue(0, forKey: "income1")
                newMonth.setValue(0, forKey: "income2")
                newMonth.setValue(0, forKey: "income3")
                newMonth.setValue(0, forKey: "income4")
                
                if (currentMon1 == 1 || currentMon1 == 3 || currentMon1 == 5 ||
                    currentMon1 == 7 || currentMon1 == 8 || currentMon1 == 10 ||
                    currentMon1 == 12){
                    
                    newMonth.setValue(5, forKey: "weeks")
                    newMonth.setValue(1, forKey: "start1")
                    newMonth.setValue(7, forKey: "end1")
                    newMonth.setValue(0, forKey: "total1")
                    newMonth.setValue(0, forKey: "high1")
                    
                    newMonth.setValue(8, forKey: "start2")
                    newMonth.setValue(14, forKey: "end2")
                    newMonth.setValue(0, forKey: "total2")
                    newMonth.setValue(0, forKey: "high2")
                    
                    newMonth.setValue(15, forKey: "start3")
                    newMonth.setValue(21, forKey: "end3")
                    newMonth.setValue(0, forKey: "total3")
                    newMonth.setValue(0, forKey: "high3")
                    
                    newMonth.setValue(22, forKey: "start4")
                    newMonth.setValue(28, forKey: "end4")
                    newMonth.setValue(0, forKey: "total4")
                    newMonth.setValue(0, forKey: "high4")
                    
                    newMonth.setValue(29, forKey: "start5")
                    newMonth.setValue(31, forKey: "end5")
                    newMonth.setValue(0, forKey: "total5")
                    newMonth.setValue(0, forKey: "high5")
                    
                    
                }else if(currentMon1 == 2){
                    
                    newMonth.setValue(5, forKey: "weeks")
                    newMonth.setValue(1, forKey: "start1")
                    newMonth.setValue(7, forKey: "end1")
                    newMonth.setValue(0, forKey: "total1")
                    newMonth.setValue(0, forKey: "high1")
                    
                    newMonth.setValue(8, forKey: "start2")
                    newMonth.setValue(14, forKey: "end2")
                    newMonth.setValue(0, forKey: "total2")
                    newMonth.setValue(0, forKey: "high2")
                    
                    newMonth.setValue(15, forKey: "start3")
                    newMonth.setValue(21, forKey: "end3")
                    newMonth.setValue(0, forKey: "total3")
                    newMonth.setValue(0, forKey: "high3")
                    
                    newMonth.setValue(22, forKey: "start4")
                    newMonth.setValue(28, forKey: "end4")
                    newMonth.setValue(0, forKey: "total4")
                    newMonth.setValue(0, forKey: "high4")
                    
                    newMonth.setValue(29, forKey: "start5")
                    newMonth.setValue(29, forKey: "end5")
                    newMonth.setValue(0, forKey: "total5")
                    newMonth.setValue(0, forKey: "high5")
                    
                }else{
                    newMonth.setValue(5, forKey: "weeks")
                    newMonth.setValue(1, forKey: "start1")
                    newMonth.setValue(7, forKey: "end1")
                    newMonth.setValue(0, forKey: "total1")
                    newMonth.setValue(0, forKey: "high1")
                    
                    newMonth.setValue(8, forKey: "start2")
                    newMonth.setValue(14, forKey: "end2")
                    newMonth.setValue(0, forKey: "total2")
                    newMonth.setValue(0, forKey: "high2")
                    
                    newMonth.setValue(15, forKey: "start3")
                    newMonth.setValue(21, forKey: "end3")
                    newMonth.setValue(0, forKey: "total3")
                    newMonth.setValue(0, forKey: "high3")
                    
                    newMonth.setValue(22, forKey: "start4")
                    newMonth.setValue(28, forKey: "end4")
                    newMonth.setValue(0, forKey: "total4")
                    newMonth.setValue(0, forKey: "high4")
                    
                    newMonth.setValue(29, forKey: "start5")
                    newMonth.setValue(30, forKey: "end5")
                    newMonth.setValue(0, forKey: "total5")
                    newMonth.setValue(0, forKey: "high5")
                    
                }
                
                
                
                do {
                    
                    try context.save()
                    
                    
                    
                }catch _ {
                    
                    print("ERROR OCCURED")
                    
                }
                
                
                
            }
            
            let date1 = Int(dateString)!
            
            if (date1 >= 22 && date1 <= 28){
                
                let date2 = Int(dateString2)!
                let predicate = NSPredicate(format: "month == \(date2)")
                
                let fetchRequest = NSFetchRequest(entityName: "AMon")
                //fetchRequest.resultType = NSFetchRequestResultType.DictionaryResultType
                fetchRequest.predicate = predicate
                
                
                
                
                do {
                    let fetchedEntities = try context.fetch(fetchRequest) as! [AMon]
                    
                    
                    if fetchedEntities.first?.income4 == nil{
                        
                        fetchedEntities.first?.income4 = Double(cashUsed)!
                        
                    }else{
                        let value = fetchedEntities.first?.income4
                        fetchedEntities.first?.income4 = value! + Double(cashUsed)!
                    }
                    
                    
                    // ... Update additional properties with new values
                } catch {
                    // Do something in response to error condition
                }
                
                do {
                    try context.save()
                } catch {
                    print("ERROR SAVING AGAIN!!!")
                }
                
                
            }else if (date1 >= 1 && date1 <= 7){
                
                let date2 = Int(dateString2)!
                let predicate = NSPredicate(format: "month == \(date2)")
                
                let fetchRequest = NSFetchRequest(entityName: "AMon")
                //fetchRequest.resultType = NSFetchRequestResultType.DictionaryResultType
                fetchRequest.predicate = predicate
                
                
                
                
                do {
                    let fetchedEntities = try context.fetch(fetchRequest) as! [AMon]
                    
                    
                    
                    
                    if fetchedEntities.first?.income1 == nil{
                        
                        fetchedEntities.first?.income1 = Double(cashUsed)!
                        
                    }else{
                        let value = fetchedEntities.first?.income1
                        fetchedEntities.first?.income1 = value! + Double(cashUsed)!
                    }
                    
                    
                    
                    // ... Update additional properties with new values
                } catch {
                    print("ERROR")
                }
                
                do {
                    try context.save()
                } catch {
                    print("ERROR SAVING AGAIN!!!")
                }
                
                
            }else if (date1 >= 8 && date1 <= 14){
                
                let date2 = Int(dateString2)!
                let predicate = NSPredicate(format: "month == \(date2)")
                
                let fetchRequest = NSFetchRequest(entityName: "AMon")
                //fetchRequest.resultType = NSFetchRequestResultType.DictionaryResultType
                fetchRequest.predicate = predicate
                
                
                
                
                do {
                    let fetchedEntities = try context.fetch(fetchRequest) as! [AMon]
                    
                    
                    
                    
                    if fetchedEntities.first?.income2 == nil{
                        
                        fetchedEntities.first?.income2 = Double(cashUsed)!
                        
                    }else{
                        let value = fetchedEntities.first?.income2
                        fetchedEntities.first?.income2 = value! + Double(cashUsed)!
                    }
                    
                    
                } catch {
                    print("ERROR")
                }
                
                do {
                    try context.save()
                } catch {
                    print("ERROR SAVING AGAIN!!!")
                }
                
                
            }else if (date1 >= 15 && date1 <= 21){
                
                let date2 = Int(dateString2)!
                let predicate = NSPredicate(format: "month == \(date2)")
                
                let fetchRequest = NSFetchRequest(entityName: "AMon")
                fetchRequest.predicate = predicate
                
                
                
                
                do {
                    let fetchedEntities = try context.fetch(fetchRequest) as! [AMon]
                    
                    
                    
                    
                    if fetchedEntities.first?.income3 == nil{
                        
                        fetchedEntities.first?.income3 = Double(cashUsed)!
                        
                    }else{
                        let value = fetchedEntities.first?.income3
                        fetchedEntities.first?.income3 = value! + Double(cashUsed)!
                    }
                    
                    
                } catch {
                    print("ERROR")
                }
                
                do {
                    try context.save()
                } catch {
                    print("ERROR SAVING AGAIN!!!")
                }
                
                
            }else{
                
                let date2 = Int(dateString2)!
                let predicate = NSPredicate(format: "month == \(date2)")
                
                let fetchRequest = NSFetchRequest(entityName: "AMon")
                fetchRequest.predicate = predicate
                
                
                
                
                do {
                    let fetchedEntities = try context.fetch(fetchRequest) as! [AMon]
                    
                    
                    
                    
                    if fetchedEntities.first?.income5 == nil{
                        
                        fetchedEntities.first?.income5 = Double(cashUsed)!
                        
                    }else{
                        let value = fetchedEntities.first?.income5
                        fetchedEntities.first?.income5 = value! + Double(cashUsed)!
                    }
                    
                    
                } catch {
                    print("ERROR")
                }
                
                do {
                    try context.save()
                } catch {
                    print("ERROR SAVING AGAIN!!!")
                }
                
                
                
            }
            
        }
        
        
        spending.append(Double(cashUsed)!)
        UserDefaults.standard.set(spending, forKey: "spendList")
        
    }
    
    
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.notesTF.delegate = self
        self.textMoney.delegate = self
        
        mainL.numberOfLines = 1
        mainL.adjustsFontSizeToFitWidth = true
        curLabel.numberOfLines = 1
        curLabel.adjustsFontSizeToFitWidth = true
        
        if currency == 1{//CAD
            
            currencyLabel.text = "CAD"
            preFix = "$"
            UserDefaults.standard.set(preFix, forKey: "preCur")
            
        }else if currency == 2{//USD
            
            currencyLabel.text = "USD"
            preFix = "$"
            UserDefaults.standard.set(preFix, forKey: "preCur")
            
        }else if currency == 3{//EURO
            
            currencyLabel.text = "EUR"
            preFix = "€"
            UserDefaults.standard.set(preFix, forKey: "preCur")
            
        }else if currency == 4{//British Pounds
            
            currencyLabel.text = "GBP"
            preFix = "£"
            UserDefaults.standard.set(preFix, forKey: "preCur")
            
        }else if currency == 5{//Chinese Yuan
            
            currencyLabel.text = "CNY"
            preFix = "¥"
            UserDefaults.standard.set(preFix, forKey: "preCur")
            
        }else if currency == 6{//Japanese Yen
            
            currencyLabel.text = "JPY"
            preFix = "¥"
            UserDefaults.standard.set(preFix, forKey: "preCur")
            
        }else if currency == 7{//Indian Rupees
            
            currencyLabel.text = "INR"
            preFix = "₹"
            UserDefaults.standard.set(preFix, forKey: "preCur")
            
        }else if currency == 8{//Russian Ruble
            
            currencyLabel.text = "RUB"
            preFix = "₽"
            UserDefaults.standard.set(preFix, forKey: "preCur")
            
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(AddVC.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(AddVC.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    func keyboardWillShow(_ notification: Notification) {
        
        if yesDo == false && yesDo1 == true{
            yesDo = true
            if let keyboardSize = ((notification as NSNotification).userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
        
    }
    
    func keyboardWillHide(_ notification: Notification) {
        yesDo = false
        if yesDo1 == true{
            yesDo1 = false
            if let keyboardSize = ((notification as NSNotification).userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    /*func registerForKeyboardNotifications()
    {
        //Adding notifies on keyboard appearing
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWasShown:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillBeHidden:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    
    func deregisterFromKeyboardNotifications()
    {
        //Removing notifies on keyboard appearing
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWasShown(notification: NSNotification)
    {
        //Need to calculate keyboard exact size due to Apple suggestions
        self.scrollView.scrollEnabled = true
        var info : NSDictionary = notification.userInfo!
        var keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue().size
        var contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize!.height, 0.0)
        
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        
        var aRect : CGRect = self.view.frame
        aRect.size.height -= keyboardSize!.height
        if let activeFieldPresent = activeField
        {
            if (!CGRectContainsPoint(aRect, activeField!.frame.origin))
            {
                self.scrollView.scrollRectToVisible(activeField!.frame, animated: true)
            }
        }
        
        
    }
    
    
    func keyboardWillBeHidden(notification: NSNotification)
    {
        //Once keyboard disappears, restore original positions
        var info : NSDictionary = notification.userInfo!
        var keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue().size
        var contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, -keyboardSize!.height, 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        self.view.endEditing(true)
        self.scrollView.scrollEnabled = false
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField!)
    {
        activeField = textField
    }
    
    func textFieldDidEndEditing(textField: UITextField!)
    {
        activeField = nil
    }*/
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        
        self.view.endEditing(true)
        return false;
        
    }
    
    
    
    
}
