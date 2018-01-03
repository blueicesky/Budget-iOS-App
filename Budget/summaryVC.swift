//
//  summaryVC.swift
//  Budget
//
//  Created by Frank Wang on 2016-03-15.
//  Copyright © 2016 Lemma Inc. All rights reserved.
//

import UIKit
import Foundation
import CoreData


//need to store⬇️
var sumYear: [AnyObject] = []

var currentMon = UserDefaults.standard.object(forKey: "curMonth") as! Int// 0 - 11 Jan = 0 Dec = 11

var atmArray = UserDefaults.standard.object(forKey: "atmArr") as! Int

//

class summaryVC: UIViewController, UITableViewDelegate{
    
    @IBOutlet var textMonth: UILabel!
    
    var appDel: AppDelegate = AppDelegate()
    var context:NSManagedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
    
    
    //var sumYear = [AnyObject]()
    
    //This is actually backwards
    @IBAction func forward1(_ sender: AnyObject) {
        //if sumYear != nil{
            if atmArray + 1 < sumYear.count{
                atmArray += 1
                UserDefaults.standard.set(atmArray, forKey: "atmArr")
                var month = ""
                if sumYear[atmArray].value(forKey: "month")! as? Int == 1{
                    month = "January"
                }else if sumYear[atmArray].value(forKey: "month")! as? Int == 2{
                    month = "February"
                }else if sumYear[atmArray].value(forKey: "month")! as? Int == 3{
                    month = "March"
                }else if sumYear[atmArray].value(forKey: "month")! as? Int == 4{
                    month = "April"
                }else if sumYear[atmArray].value(forKey: "month")! as? Int == 5{
                    month = "May"
                }else if sumYear[atmArray].value(forKey: "month")! as? Int == 6{
                    month = "June"
                }else if sumYear[atmArray].value(forKey: "month")! as? Int == 7{
                    month = "July"
                }else if sumYear[atmArray].value(forKey: "month")! as? Int == 8{
                    month = "August"
                }else if sumYear[atmArray].value(forKey: "month")! as? Int == 9{
                    month = "September"
                }else if sumYear[atmArray].value(forKey: "month")! as? Int == 10{
                    month = "October"
                }else if sumYear[atmArray].value(forKey: "month")! as? Int == 11{
                    month = "November"
                }else if sumYear[atmArray].value(forKey: "month")! as? Int == 12{
                    month = "December"
                }
                textMonth.text = month + ", \(sumYear[atmArray].value(forKey: "year")! as! Int)"
                sumTable.reloadData()
            }
        //}
        
    }
    
    //this is actually forwards
    @IBAction func backward1(_ sender: AnyObject) {
        //if sumYear != nil{
            if atmArray > 0{
                atmArray -= 1
                UserDefaults.standard.set(atmArray, forKey: "atmArr")
                var month = ""
                if sumYear[atmArray].value(forKey: "month")! as? Int == 1{
                    month = "January"
                }else if sumYear[atmArray].value(forKey: "month")! as? Int == 2{
                    month = "February"
                }else if sumYear[atmArray].value(forKey: "month")! as? Int == 3{
                    month = "March"
                }else if sumYear[atmArray].value(forKey: "month")! as? Int == 4{
                    month = "April"
                }else if sumYear[atmArray].value(forKey: "month")! as? Int == 5{
                    month = "May"
                }else if sumYear[atmArray].value(forKey: "month")! as? Int == 6{
                    month = "June"
                }else if sumYear[atmArray].value(forKey: "month")! as? Int == 7{
                    month = "July"
                }else if sumYear[atmArray].value(forKey: "month")! as? Int == 8{
                    month = "August"
                }else if sumYear[atmArray].value(forKey: "month")! as? Int == 9{
                    month = "September"
                }else if sumYear[atmArray].value(forKey: "month")! as? Int == 10{
                    month = "October"
                }else if sumYear[atmArray].value(forKey: "month")! as? Int == 11{
                    month = "November"
                }else if sumYear[atmArray].value(forKey: "month")! as? Int == 12{
                    month = "December"
                }
                textMonth.text = month + ", \(sumYear[atmArray].value(forKey: "year")! as! Int)"
                sumTable.reloadData()
            }
        //}
        
    }
    /*var dateCurrent = NSDate()
    let dateForm = NSDateFormatter()
    var date = String()*/
    
    @IBOutlet var sumTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDel = UIApplication.shared.delegate as! AppDelegate
        context = appDel.managedObjectContext
        //if sumYear != nil{
        if yesno == 0{
            
            yesno = 1
            
            let request1 = NSFetchRequest(entityName: "AMon")
            request1.resultType = NSFetchRequestResultType.dictionaryResultType
            
            let sort1 = NSSortDescriptor(key: "month", ascending: true)
            let sort2 = NSSortDescriptor(key: "year", ascending: true)
            
            request1.sortDescriptors = [sort1, sort2]
            
            do{
                sumYear = [AnyObject]()
                sumYear = try context.fetch(request1) as! [NSManagedObject]
                
                sumTable.reloadData()
                
            }catch _ {
                
                print("ERROR OCCURED")
                
            }
        }
        var month = ""
        if sumYear[atmArray].value(forKey: "month")! as? Int == 1{
            month = "January"
        }else if sumYear[atmArray].value(forKey: "month")! as? Int == 2{
            month = "February"
        }else if sumYear[atmArray].value(forKey: "month")! as? Int == 3{
            month = "March"
        }else if sumYear[atmArray].value(forKey: "month")! as? Int == 4{
            month = "April"
        }else if sumYear[atmArray].value(forKey: "month")! as? Int == 5{
            month = "May"
        }else if sumYear[atmArray].value(forKey: "month")! as? Int == 6{
            month = "June"
        }else if sumYear[atmArray].value(forKey: "month")! as? Int == 7{
            month = "July"
        }else if sumYear[atmArray].value(forKey: "month")! as? Int == 8{
            month = "August"
        }else if sumYear[atmArray].value(forKey: "month")! as? Int == 9{
            month = "September"
        }else if sumYear[atmArray].value(forKey: "month")! as? Int == 10{
            month = "October"
        }else if sumYear[atmArray].value(forKey: "month")! as? Int == 11{
            month = "November"
        }else if sumYear[atmArray].value(forKey: "month")! as? Int == 12{
            month = "December"
        }
        textMonth.text = month + ", \(sumYear[atmArray].value(forKey: "year")! as! Int)"
        //}
        /*dateForm.dateFormat = "M"
        date = dateForm.stringFromDate(dateCurrent)
        currentMon = Int(date)!*/
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        sumTable.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        //if sumYear != nil{
            return 5
        //}else{
            //return 0
        //}
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SumTVC
        
        //if sumYear != nil{
        let thisTime = sumYear[atmArray]
        cell.staticText.text = "Total Spendings"
        let value = thisTime.value(forKey: "total\((indexPath as NSIndexPath).row + 1)")! as! Double
        cell.moneyLabel?.text = preFix + "\(value)"//found nil while unwrapping this line.
        let value2 = thisTime.value(forKey: "end\((indexPath as NSIndexPath).row + 1)")! as! Int
        let value3 = thisTime.value(forKey: "start\((indexPath as NSIndexPath).row + 1)")! as! Int
        let value4 = thisTime.value(forKey: "high\((indexPath as NSIndexPath).row + 1)")! as! Double
        if thisTime.value(forKey: "income\((indexPath as NSIndexPath).row + 1)") != nil{
            let value5 = thisTime.value(forKey: "income\((indexPath as NSIndexPath).row + 1)")! as! Double
            cell.incomeLabel?.text = preFix + "\(value5)"
        }else{
            cell.incomeLabel?.text = preFix + "0"
        }
        
        cell.mainDate.text = "\(value3)-\(value2)"
        let string1 = "Highest Spending: " + preFix + "\(value4)"
        cell.highestLabel.text = string1
        //}
        
        return cell
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let request1 = NSFetchRequest(entityName: "AMon")
        request1.resultType = NSFetchRequestResultType.dictionaryResultType
        
        let sort1 = NSSortDescriptor(key: "month", ascending: true)
        let sort2 = NSSortDescriptor(key: "year", ascending: true)
        
        request1.sortDescriptors = [sort1, sort2]
        
        do{
            sumYear = [AnyObject]()
            sumYear = try context.fetch(request1) as! [NSManagedObject]
            
            sumTable.reloadData()
            
        }catch _ {
            
            print("ERROR OCCURED")
            
        }
        
        
        
    }
}
