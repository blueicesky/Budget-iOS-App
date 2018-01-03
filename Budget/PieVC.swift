//
//  PieVC.swift
//  Budget
//
//  Created by Frank Wang on 2016-03-10.
//  Copyright © 2016 Lemma Inc. All rights reserved.
//

import UIKit
import Charts

var second = UserDefaults.standard.value(forKey: "2") as! Double
var third = UserDefaults.standard.value(forKey: "3") as! Double
var fourth = UserDefaults.standard.value(forKey: "4") as! Double
var fifth = UserDefaults.standard.value(forKey: "5") as! Double
var sixth = UserDefaults.standard.value(forKey: "6") as! Double
var seventh = UserDefaults.standard.value(forKey: "7") as! Double
var eighth = UserDefaults.standard.value(forKey: "8") as! Double
var first = UserDefaults.standard.value(forKey: "1") as! Double
var income1 = UserDefaults.standard.value(forKey: "9") as! Double


class PieVC: UIViewController, ChartViewDelegate {

    @IBOutlet var pieView: PieChartView!
    
    func setChart(_ dataPoints: [String], values: [Double]){
        
        var dataEntries: [ChartDataEntry] = []
        var dataNew: [String] = []
        
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            if(values[i] != 0){
                dataEntries.append(dataEntry)
                dataNew.append(dataPoints[i])
            }
        }
        
        let pieChartDataSet = PieChartDataSet(yVals: dataEntries, label: "")
        let pieChartData = PieChartData(xVals: dataNew, dataSet: pieChartDataSet)
        pieView.data = pieChartData
        pieView.descriptionText = ""
        
        var colors: [UIColor] = []
        
        for _ in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        
        pieChartDataSet.colors = colors
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cate = ["Shop", "F&D", "Travel", "Movies", "Ent", "Groc", "Edu", "Others", "Income"]
        let unitsSold = [first, second, third, fourth, fifth, sixth, seventh, eighth, income1]
        
        setChart(cate, values: unitsSold)
        
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
