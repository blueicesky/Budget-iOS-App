//
//  ViewHomeController.swift
//  Budget
//
//  Created by Frank Wang on 2016-02-10.
//  Copyright © 2016 Lemma Inc. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox
import CoreData


/*
 <key>UIApplicationShortcutItems
 </key>
 <array>
 <dict>
 <key>UIApplicationShortcutItemType</key>
 <string>UIApplicationShortcutIconTypeAdd</string>
 <key>UIApplicationShortcutItemTitle</key>
 <string>Create a new entry</string>
 <key>UIApplicationShortcutItemType</key>
 <string>lemma.Budget.AddVC</string>
 
 </dict>
 </array>
 
 
 */


var spending = [Double]()//need to store
var dateSum = UserDefaults.standard.object(forKey: "dateSum") as! String
var total = UserDefaults.standard.object(forKey: "totalMon")! as! Double//need to store
var whichBack = UserDefaults.standard.object(forKey: "backG") as! Int
//0-9

var back1B = UIImage(named: "b1")
var back2B = UIImage(named: "b2")
var back3B = UIImage(named: "image1")
var back4W = UIImage(named: "image2")
var back5B = UIImage(named: "image3")
var back6W = UIImage(named: "IMG_0722")
var back7B = UIImage(named: "IMG_0724.JPG")
var back8W = UIImage(named: "w1")
var back9W = UIImage(named: "w2")
var incomeImage = UIImage(named: "Income icon")
var home = UIImage(named: "Home-Screen")


var tabW = UIImage(named: "tab1~")
var tabB = UIImage(named: "TABB")
//var aRW = UIImage(named: "add receipt")
//var aRB = UIImage(named: "ARB")
var sumW = UIImage(named: "summary button")
var sumB = UIImage(named: "SBB")
var chartW = UIImage(named: "charts")
var chartB = UIImage(named: "CB")


var food = UIImage(named: "fo")
var education = UIImage(named: "ed")
var enter = UIImage(named: "en")
var gro = UIImage(named: "gr")
var movie = UIImage(named: "mo")
var trans = UIImage(named: "tr")
var oth = UIImage(named: "ot")
var shop = UIImage(named: "sh")

var food1 = UIImage(named: "Food&Drinks button")
var education1 = UIImage(named: "Education button")
var enter1 = UIImage(named: "Entertainment button")
var gro1 = UIImage(named: "Grocery button")
var movie1 = UIImage(named: "Movies button")
var trans1 = UIImage(named: "Travel button")
var oth1 = UIImage(named: "Others Button")
var shop1 = UIImage(named: "Shopping button")


var results = [NSManagedObject]()

class ViewHomeController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
//reveal push controller changes the view
    @IBOutlet var openTab: UIButton!
    @IBOutlet var spendTable: UITableView!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var homeImage: UIImageView!
    
    @IBOutlet var sumImage: UIImageView!
    @IBOutlet var chartImage: UIImageView!
    @IBOutlet var aRepImage: UIImageView!
    @IBOutlet var tabImage: UIImageView!
    
    
    @IBOutlet var tableMain: UITableView!
    
    @IBAction func DoThis(_ sender: AnyObject) {
        
        
        AudioServicesPlaySystemSound(SystemSoundID(4095))
        
    }
    
    //Data
    var appDel: AppDelegate = AppDelegate()
    var context: NSManagedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
    
    
    //
    
    
    
    
    
    var income = UIImage(named: "Income gold")
    var spent22 = UIImage(named: "Spent white")
    
    //camera
    
    /*let imagePicker: UIImagePickerController! = UIImagePickerController()
    
    
    @IBAction func takePicture(sender: AnyObject) {
        if (UIImagePickerController.isSourceTypeAvailable(.Camera)) {
            if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .Camera
                imagePicker.cameraCaptureMode = .Photo
                presentViewController(imagePicker, animated: true, completion: nil)
            } else {
                postAlert("Rear camera doesn't exist", message: "Application cannot access the camera.")
            }
        } else {
            postAlert("Camera inaccessable", message: "Application cannot access the camera.")
        }

    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        print("Got an image")
        if let pickedImage: UIImage = (info[UIImagePickerControllerOriginalImage]) as? UIImage {
            let selectorToCall = #selector(ViewHomeController.imageWasSavedSuccessfully(_:didFinishSavingWithError:context:))
            UIImageWriteToSavedPhotosAlbum(pickedImage, self, selectorToCall, nil)
        }
        imagePicker.dismissViewControllerAnimated(true, completion: {
            // Anything you want to happen when the user saves an image
        })
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        print("User canceled image")
        dismissViewControllerAnimated(true, completion: {
            // Anything you want to happen when the user selects cancel
        })
    }
    
    func imageWasSavedSuccessfully(image: UIImage, didFinishSavingWithError error: NSError!, context: UnsafeMutablePointer<()>){
        print("Image saved")
        if error == nil {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(ac, animated: true, completion: nil)
        } else {
            let ac = UIAlertController(title: "Save error", message: error?.localizedDescription, preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(ac, animated: true, completion: nil)
        }
    }
    
    
    func postAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message,
                                      preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }*/
 
    //Date stuff
    
    var dateCurrent = Date()
    let dateForm = DateFormatter()
    let dateForm1 = DateFormatter()
    
    
    
    //______
    
    func initializeThis(){
        
        dateForm.dateFormat = "M"
        inited = 1
        UserDefaults.standard.set(1, forKey: "initTrue")
        dateSum = dateForm.string(from: dateCurrent)
        UserDefaults.standard.set(dateSum, forKey: "dateSum")
        dateForm1.dateFormat = "y"
        currentMon = Int(dateSum)!
        UserDefaults.standard.set(currentMon, forKey: "curMonth")
        
        
        let newMonth = NSEntityDescription.insertNewObject(forEntityName: "AMon", into: context) as NSManagedObject
        
        newMonth.setValue(currentMon, forKey: "month")
        newMonth.setValue(Int(dateForm1.string(from: dateCurrent))!, forKey: "year")
        
        newMonth.setValue(0, forKey: "income1")
        newMonth.setValue(0, forKey: "income2")
        newMonth.setValue(0, forKey: "income3")
        newMonth.setValue(0, forKey: "income4")
        newMonth.setValue(0, forKey: "income5")
        
        if (currentMon == 1 || currentMon == 3 || currentMon == 5 ||
            currentMon == 7 || currentMon == 8 || currentMon == 10 ||
            currentMon == 12){
            
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
            
            
        }else if(currentMon == 2){
            
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        
        return results.count
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "header") as! HeaderTVC
        
        headerCell.backgroundColor = UIColor.clear
        
        let date1 = Date()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        let dateStringA = formatter.string(from: date1)
        
        let formatter2 = DateFormatter()
        formatter2.dateFormat = "y"
        let dateStringB = formatter2.string(from: date1)
        
        let formatter3 = DateFormatter()
        formatter3.dateFormat = "MMMM"
        let dateStringC = formatter3.string(from: date1)
        
        headerCell.monthYLabel.text = dateStringC + ", " + dateStringB
        
        headerCell.dateCurrent.text = dateStringA
        
        headerCell.grandTotal.text = preFix + String(total)
        
        if whichBack == 0{
            
            headerCell.monthYLabel.textColor = UIColor.white
            headerCell.dateCurrent.textColor = UIColor.white
            headerCell.grandTotal.textColor = UIColor.white
            headerCell.staticLabel.textColor = UIColor.white
            
            
        }else if whichBack == 1{
            
            headerCell.monthYLabel.textColor = UIColor.black
            headerCell.dateCurrent.textColor = UIColor.black
            headerCell.grandTotal.textColor = UIColor.black
            headerCell.staticLabel.textColor = UIColor.black
            
        }else if whichBack == 2{
            
            headerCell.monthYLabel.textColor = UIColor.black
            headerCell.dateCurrent.textColor = UIColor.black
            headerCell.grandTotal.textColor = UIColor.black
            headerCell.staticLabel.textColor = UIColor.black
            
        }else if whichBack == 3{
            
            headerCell.monthYLabel.textColor = UIColor.black
            headerCell.dateCurrent.textColor = UIColor.black
            headerCell.grandTotal.textColor = UIColor.black
            headerCell.staticLabel.textColor = UIColor.black
            
        }else if whichBack == 4{
            
            headerCell.monthYLabel.textColor = UIColor.white
            headerCell.dateCurrent.textColor = UIColor.white
            headerCell.grandTotal.textColor = UIColor.white
            headerCell.staticLabel.textColor = UIColor.white
            
        }else if whichBack == 5{
            
            headerCell.monthYLabel.textColor = UIColor.black
            headerCell.dateCurrent.textColor = UIColor.black
            headerCell.grandTotal.textColor = UIColor.black
            headerCell.staticLabel.textColor = UIColor.black
            
        }else if whichBack == 6{
            
            headerCell.monthYLabel.textColor = UIColor.white
            headerCell.dateCurrent.textColor = UIColor.white
            headerCell.grandTotal.textColor = UIColor.white
            headerCell.staticLabel.textColor = UIColor.white
            
        }else if whichBack == 7{
            
            headerCell.monthYLabel.textColor = UIColor.black
            headerCell.dateCurrent.textColor = UIColor.black
            headerCell.grandTotal.textColor = UIColor.black
            headerCell.staticLabel.textColor = UIColor.black
            
        }else if whichBack == 8{
            
            headerCell.monthYLabel.textColor = UIColor.white
            headerCell.dateCurrent.textColor = UIColor.white
            headerCell.grandTotal.textColor = UIColor.white
            headerCell.staticLabel.textColor = UIColor.white
            
        }else if whichBack == 9{
            
            headerCell.monthYLabel.textColor = UIColor.white
            headerCell.dateCurrent.textColor = UIColor.white
            headerCell.grandTotal.textColor = UIColor.white
            headerCell.staticLabel.textColor = UIColor.white
            
        }
        
        
        headerCell.monthYLabel.numberOfLines = 1
        headerCell.monthYLabel.adjustsFontSizeToFitWidth = true
        headerCell.dateCurrent.numberOfLines = 1
        headerCell.dateCurrent.adjustsFontSizeToFitWidth = true
        headerCell.grandTotal.numberOfLines = 1
        headerCell.grandTotal.adjustsFontSizeToFitWidth = true
        
        return headerCell.contentView
        
    }
    
    //
    
    
    //
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! mainTVC
        //let date = NSDate()
        let transparent1: UIImage = UIImage(named:"trans")!
        
        cell.dateLabel?.text = results[(indexPath as NSIndexPath).row].value(forKey: "date")! as? String
        cell.titleLabel?.text = results[(indexPath as NSIndexPath).row].value(forKey: "title")! as? String
        cell.descLabel?.text = results[(indexPath as NSIndexPath).row].value(forKey: "desc")! as? String
        let labelText = results[(indexPath as NSIndexPath).row].value(forKey: "money")! as! String
        cell.dollarLabel?.text = preFix + labelText
        cell.typeLabel?.text = results[(indexPath as NSIndexPath).row].value(forKey: "type")! as? String
        
        cell.dateLabel.numberOfLines = 1
        cell.dateLabel.adjustsFontSizeToFitWidth = true
        cell.titleLabel.numberOfLines = 1
        cell.titleLabel.adjustsFontSizeToFitWidth = true
        cell.dollarLabel.numberOfLines = 1
        cell.dollarLabel.adjustsFontSizeToFitWidth = true
        cell.descLabel.numberOfLines = 2
        cell.descLabel.adjustsFontSizeToFitWidth = true
        cell.typeLabel.numberOfLines = 1
        cell.typeLabel.adjustsFontSizeToFitWidth = true
        
        let thisTry = results[(indexPath as NSIndexPath).row].value(forKey: "imageOf")! as? Int
        
        if (thisTry == 1){
            
            cell.imageFirst.image = shop
            
        }else if (thisTry == 2){
            
            cell.imageFirst.image = food
            
        }else if (thisTry == 3){
            
            cell.imageFirst.image = trans
            
        }else if (thisTry == 4){
            
            cell.imageFirst.image = movie
            
        }else if (thisTry == 5){
            
            cell.imageFirst.image = enter
            
        }else if (thisTry == 6){
            
            cell.imageFirst.image = gro
        
        }else if (thisTry == 7){
            
            cell.imageFirst.image = education
            
        }else if (thisTry == 8){
            
            cell.imageFirst.image = oth
            
        }else if (thisTry == 9){
            
            cell.imageFirst.image = incomeImage
            
        }else{
            
            cell.imageFirst.image = oth
            
        }
        
        let tryagain = results[(indexPath as NSIndexPath).row].value(forKey: "imageSpend")! as? Int
        if (tryagain == 1){
            cell.incLabel.image = income
        }else{
            cell.incLabel.image = spent22
        }
        
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = backgroundView
        
        
        if whichBack == 0{
            
            cell.dateLabel.textColor = UIColor.white
            cell.titleLabel.textColor = UIColor.white
            cell.descLabel.textColor = UIColor.white
            cell.dollarLabel.textColor = UIColor.white
            cell.typeLabel.textColor = UIColor.white
            
        }else if whichBack == 1{
            
            cell.dateLabel.textColor = UIColor.black
            cell.titleLabel.textColor = UIColor.black
            cell.descLabel.textColor = UIColor.black
            cell.dollarLabel.textColor = UIColor.black
            cell.typeLabel.textColor = UIColor.black
            
        }else if whichBack == 2{
            
            cell.dateLabel.textColor = UIColor.black
            cell.titleLabel.textColor = UIColor.black
            cell.descLabel.textColor = UIColor.black
            cell.dollarLabel.textColor = UIColor.black
            cell.typeLabel.textColor = UIColor.black
            
        }else if whichBack == 3{
            
            cell.dateLabel.textColor = UIColor.black
            cell.titleLabel.textColor = UIColor.black
            cell.descLabel.textColor = UIColor.black
            cell.dollarLabel.textColor = UIColor.black
            cell.typeLabel.textColor = UIColor.black
            
        }else if whichBack == 4{
            
            cell.dateLabel.textColor = UIColor.white
            cell.titleLabel.textColor = UIColor.white
            cell.descLabel.textColor = UIColor.white
            cell.dollarLabel.textColor = UIColor.white
            cell.typeLabel.textColor = UIColor.white
            
        }else if whichBack == 5{
            
            cell.dateLabel.textColor = UIColor.black
            cell.titleLabel.textColor = UIColor.black
            cell.descLabel.textColor = UIColor.black
            cell.dollarLabel.textColor = UIColor.black
            cell.typeLabel.textColor = UIColor.black
            
        }else if whichBack == 6{
            
            cell.dateLabel.textColor = UIColor.white
            cell.titleLabel.textColor = UIColor.white
            cell.descLabel.textColor = UIColor.white
            cell.dollarLabel.textColor = UIColor.white
            cell.typeLabel.textColor = UIColor.white
            
        }else if whichBack == 7{
            
            cell.dateLabel.textColor = UIColor.black
            cell.titleLabel.textColor = UIColor.black
            cell.descLabel.textColor = UIColor.black
            cell.dollarLabel.textColor = UIColor.black
            cell.typeLabel.textColor = UIColor.black
            
        }else if whichBack == 8{
            
            cell.dateLabel.textColor = UIColor.white
            cell.titleLabel.textColor = UIColor.white
            cell.descLabel.textColor = UIColor.white
            cell.dollarLabel.textColor = UIColor.white
            cell.typeLabel.textColor = UIColor.white
            
        }else if whichBack == 9{
            
            cell.dateLabel.textColor = UIColor.white
            cell.titleLabel.textColor = UIColor.white
            cell.descLabel.textColor = UIColor.white
            cell.dollarLabel.textColor = UIColor.white
            cell.typeLabel.textColor = UIColor.white
            
        }
        
        
        cell.backgroundColor = UIColor.clear
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vcName = "Clicked"
        let pushThis = storyboard?.instantiateViewController(withIdentifier: vcName)
        catI = results[(indexPath as NSIndexPath).row].value(forKey: "imageOf")! as! Int
        descL = results[(indexPath as NSIndexPath).row].value(forKey: "desc")! as! String
        moneyT = results[(indexPath as NSIndexPath).row].value(forKey: "money")! as! String
        which111 = (indexPath as NSIndexPath).row
        
        
        self.navigationController?.pushViewController(pushThis!, animated: true)
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            let objectToDelete = results[(indexPath as NSIndexPath).row]
            let objectID = results[(indexPath as NSIndexPath).row].value(forKey: "dateMonth")! as! Int
            let objectDay = results[(indexPath as NSIndexPath).row].value(forKey: "dateNum")! as! Int
            let totalM = results[(indexPath as NSIndexPath).row].value(forKey: "totalmoney")! as! Double
            
            
            if(results[(indexPath as NSIndexPath).row].value(forKey: "imageSpend")! as! Int) == 1{
                
                total = total + spending[(indexPath as NSIndexPath).row]
                income1 -= spending[(indexPath as NSIndexPath).row]
                
                
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
                            fetchedEntities.first?.income4 = value! - totalM
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
                            fetchedEntities.first?.income1 = value! - totalM
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
                            fetchedEntities.first?.income2 = value! - totalM
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
                            fetchedEntities.first?.income3 = value! - totalM
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
                            fetchedEntities.first?.income5 = value! - totalM
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
                
                
                
                UserDefaults.standard.set(income1, forKey: "9")
                UserDefaults.standard.set(total, forKey: "totalMon")
                
            }else{
                
                total = total - spending[(indexPath as NSIndexPath).row]
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
                        fetchedEntities.first?.total4 = value! - totalM
                        
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
                        fetchedEntities.first?.total1 = value! - totalM
                        
                        
                        
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
                        fetchedEntities.first?.total2 = value! - totalM
                        
                        
                        
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
                        fetchedEntities.first?.total3 = value! - totalM
                        
                        
                        
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
                        fetchedEntities.first?.total5 = value! - totalM
                        
                        
                        
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
                
                
                
                if (results[(indexPath as NSIndexPath).row].value(forKey: "imageOf")! as? Int == 1) && (results[(indexPath as NSIndexPath).row].value(forKey: "imageSpend")! as? Int == 0){
                    
                    first -= (results[(indexPath as NSIndexPath).row].value(forKey: "totalmoney")! as? Double)!
                    UserDefaults.standard.set(first, forKey: "1")
                    
                }else if (results[(indexPath as NSIndexPath).row].value(forKey: "imageOf")! as? Int == 2) && (results[(indexPath as NSIndexPath).row].value(forKey: "imageSpend")! as? Int == 0){
                    
                    second -= (results[(indexPath as NSIndexPath).row].value(forKey: "totalmoney")! as? Double)!
                    UserDefaults.standard.set(second, forKey: "2")
                    
                }else if (results[(indexPath as NSIndexPath).row].value(forKey: "imageOf")! as? Int == 3) && (results[(indexPath as NSIndexPath).row].value(forKey: "imageSpend")! as? Int == 0){
                    
                    third -= (results[(indexPath as NSIndexPath).row].value(forKey: "totalmoney")! as? Double)!
                    UserDefaults.standard.set(third, forKey: "3")
                    
                }else if (results[(indexPath as NSIndexPath).row].value(forKey: "imageOf")! as? Int == 4) && (results[(indexPath as NSIndexPath).row].value(forKey: "imageSpend")! as? Int == 0){
                    
                    fourth -= (results[(indexPath as NSIndexPath).row].value(forKey: "totalmoney")! as? Double)!
                    UserDefaults.standard.set(fourth, forKey: "4")
                    
                }else if (results[(indexPath as NSIndexPath).row].value(forKey: "imageOf")! as? Int == 5) && (results[(indexPath as NSIndexPath).row].value(forKey: "imageSpend")! as? Int == 0){
                    
                    fifth -= (results[(indexPath as NSIndexPath).row].value(forKey: "totalmoney")! as? Double)!
                    UserDefaults.standard.set(fifth, forKey: "5")
                    
                }else if (results[(indexPath as NSIndexPath).row].value(forKey: "imageOf")! as? Int == 6) && (results[(indexPath as NSIndexPath).row].value(forKey: "imageSpend")! as? Int == 0){
                    
                    sixth -= (results[(indexPath as NSIndexPath).row].value(forKey: "totalmoney")! as? Double)!
                    UserDefaults.standard.set(sixth, forKey: "6")
                    
                }else if (results[(indexPath as NSIndexPath).row].value(forKey: "imageOf")! as? Int == 7) && (results[(indexPath as NSIndexPath).row].value(forKey: "imageSpend")! as? Int == 0){
                    
                    seventh -= (results[(indexPath as NSIndexPath).row].value(forKey: "totalmoney")! as? Double)!
                    UserDefaults.standard.set(seventh, forKey: "7")
                    
                }else if (results[(indexPath as NSIndexPath).row].value(forKey: "imageOf")! as? Int == 8) && (results[(indexPath as NSIndexPath).row].value(forKey: "imageSpend")! as? Int == 0){
                    
                    eighth -= (results[(indexPath as NSIndexPath).row].value(forKey: "totalmoney")! as? Double)!
                    UserDefaults.standard.set(eighth, forKey: "8")
                    
                }else{
                    
                    eighth -= (results[(indexPath as NSIndexPath).row].value(forKey: "totalmoney")! as? Double)!
                    UserDefaults.standard.set(eighth, forKey: "8")
                    
                }
            }
            
            context.delete(objectToDelete)
            do {
                try context.save()
                results.remove(at: (indexPath as NSIndexPath).row)
                spending.remove(at: (indexPath as NSIndexPath).row)
                UserDefaults.standard.set(spending, forKey: "spendList")
                spendTable.deleteRows(at: [indexPath], with: .fade)
                spendTable.reloadData()
                
            }catch _ {
                print("Error in deleting the records")
            }
            
            
        }
    }
    
    
        

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if #available(iOS 9.0, *) {
            if traitCollection.forceTouchCapability == UIForceTouchCapability.available{
                
                let firstIcon = UIApplicationShortcutIcon(type: UIApplicationShortcutIconType.add)
                
                let firstItem = UIApplicationShortcutItem(type: "Add.Entry", localizedTitle: "Add Entry", localizedSubtitle: "Add a spending", icon: firstIcon, userInfo: nil)
                
                UIApplication.shared.shortcutItems = [firstItem]
                
                
            }
        } else {
            print("not Available")
        }
        
        
        titleLabel.numberOfLines = 1
        titleLabel.adjustsFontSizeToFitWidth = true
        
        
        
        if currency == 1{//CAD
            
            preFix = "$"
            UserDefaults.standard.set(preFix, forKey: "preCur")
            
        }else if currency == 2{//USD
            
            preFix = "$"
            UserDefaults.standard.set(preFix, forKey: "preCur")
            
        }else if currency == 3{//EURO
            
            preFix = "€"
            UserDefaults.standard.set(preFix, forKey: "preCur")
            
        }else if currency == 4{//British Pounds
            
            preFix = "£"
            UserDefaults.standard.set(preFix, forKey: "preCur")
            
        }else if currency == 5{//Chinese Yuan
            
            preFix = "¥"
            UserDefaults.standard.set(preFix, forKey: "preCur")
            
        }else if currency == 6{//Japanese Yen
            
            preFix = "¥"
            UserDefaults.standard.set(preFix, forKey: "preCur")
            
        }else if currency == 7{//Indian Rupees
            
            preFix = "₹"
            UserDefaults.standard.set(preFix, forKey: "preCur")
            
        }else if currency == 8{//Russian Ruble
            
            preFix = "₽"
            UserDefaults.standard.set(preFix, forKey: "preCur")
            
        }
        
        spendTable.reloadData()
        
        if whichBack == 0{
            
            homeImage.image = home
            sumImage.image = sumW
            chartImage.image = chartW
            tabImage.image = tabW
            titleLabel.textColor = UIColor.white
            
        }else if whichBack == 1{
            
            homeImage.image = back1B
            sumImage.image = sumB
            chartImage.image = chartB
            tabImage.image = tabB

            titleLabel.textColor = UIColor.black
            
        }else if whichBack == 2{
            
            homeImage.image = back2B
            sumImage.image = sumB
            chartImage.image = chartB
            tabImage.image = tabB

            titleLabel.textColor = UIColor.black
            
        }else if whichBack == 3{
            
            homeImage.image = back3B
            sumImage.image = sumB
            chartImage.image = chartB
            tabImage.image = tabB

            titleLabel.textColor = UIColor.black
            
        }else if whichBack == 4{
            
            homeImage.image = back4W
            sumImage.image = sumW
            chartImage.image = chartW
            tabImage.image = tabW
            titleLabel.textColor = UIColor.white
            
        }else if whichBack == 5{
            
            homeImage.image = back5B
            sumImage.image = sumB
            chartImage.image = chartB
            tabImage.image = tabB

            titleLabel.textColor = UIColor.black
            
        }else if whichBack == 6{
            
            homeImage.image = back6W
            sumImage.image = sumW
            chartImage.image = chartW
            tabImage.image = tabW
            titleLabel.textColor = UIColor.white
            
        }else if whichBack == 7{
            
            homeImage.image = back7B
            sumImage.image = sumB
            chartImage.image = chartB
            tabImage.image = tabB
            titleLabel.textColor = UIColor.black
            
        }else if whichBack == 8{
            
            homeImage.image = back8W
            sumImage.image = sumW
            chartImage.image = chartW
            tabImage.image = tabW
            titleLabel.textColor = UIColor.white
            
        }else if whichBack == 9{
            
            homeImage.image = back9W
            sumImage.image = sumW
            chartImage.image = chartW
            tabImage.image = tabW
            titleLabel.textColor = UIColor.white
            
        }
        
        
        //NSUser
        if UserDefaults.standard.object(forKey: "spendList") != nil{
            spending = UserDefaults.standard.object(forKey: "spendList") as! [Double]
        }
        
        
        
        //CoreData
        
        appDel = UIApplication.shared.delegate as! AppDelegate
        context = appDel.managedObjectContext
        
        
        openTab.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        tableMain.backgroundColor = UIColor.clear
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        if inited == 0{
            
            initializeThis()
            
        }/*else{
            //date = dateForm.stringFromDate(dateCurrent)
            if Int(dateSum)! != currentMon{
                dateSum = dateForm.stringFromDate(dateCurrent)
                currentMon = Int(dateSum)!
                initializeThis()
            }
        }*/
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Data Stuff
        
        
        let request = NSFetchRequest(entityName: "Entry")
        request.resultType = NSFetchRequestResultType()
        let sort1 = NSSortDescriptor(key: "dateNum", ascending: true)
        
        request.sortDescriptors = [sort1]
        
        do{
            results = [NSManagedObject]()
            results = try context.fetch(request) as! [NSManagedObject]
            
            spendTable.reloadData()
            
        }catch _ {
            print("Error Occured")
            
        }
    }
    
    
}

