//
//  graph.swift
//  Final306Project
//
//  Created by Alex Hansen on 4/11/17.
//  Copyright © 2017 PNGapps. All rights reserved.
//

import Foundation
import UIKit
import Charts

class graph: UIViewController {
    
    var roomsArray = [Double]()
    let myUrlData:String = "http://52.24.214.101/Consumption2.php"
    var dataArray = Double()
    var sum = 0
    
    @IBOutlet weak var BarCHART: BarChartView!
    @IBOutlet weak var refresh: UIButton!
    @IBOutlet weak var perday: UILabel!
    @IBOutlet weak var lb1: UILabel!
    @IBOutlet weak var kw: UILabel!
    
    
    @IBAction func refresh(_ sender: Any) {
        updateChartWithData()
         let sum = (self.roomsArray.reduce(0, +))
        self.perday.text = "\(sum)"
        self.kw.isHidden = false
        self.lb1.isHidden = false
        self.perday.isHidden = false
        
        
    }
    
  
    
    
    func getJsonFromUrl(){
        let url = NSURL(string: myUrlData)
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                print(jsonObj!.value(forKey: "Component")!)
                
                if let heroeArray = jsonObj!.value(forKey: "Component") as? NSArray {
                    for heroe in heroeArray{
                        
                        if let heroeDict = heroe as? NSDictionary {
                            if let energy = heroeDict.value(forKey: "energy") {
                                
                                self.roomsArray.append((energy as! Double))
                            }
                            
                        }
                    }
                }
                // let counter = self.roomsArray.count-1
                //let stringwow = String();
                //for i in 0...counter {
                //  if (self.roomsArray[0] == ["6"]){
                //     let obj = self.roomsArray[i][1]
                // let stringwow = self.roomsArray.joined();
                // print(stringwow)
                // self.rawdatalb.text = "\(stringwow)"
                
                //}
                
                //for stuff in self.roomsArray {
                //  print(stuff)
                //self.rawdatalb.text = ("\(stuff[1])");
                
                //     }
                
                
                // }
                //  self.rawdatalb.text = "\(stringwow)"
                OperationQueue.main.addOperation({
                    for i in 0..<self.roomsArray.count {
                        print(self.roomsArray[i])
                    }
                })
            }
            }).resume()
        }

    
    func updateChartWithData() {
        var dataEntries: [BarChartDataEntry] = []
        let readingcount = self.roomsArray
        for i in 0..<readingcount.count {
            let dataEntry = BarChartDataEntry(x: Double(i) , y: Double(readingcount[i]))
            dataEntries.append(dataEntry)
            }
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Energy Consumption (kWh)")
        let chartData = BarChartData(dataSet: chartDataSet)
        BarCHART.data = chartData
    }
    



   // func getJsonFromUrl() {
     //   var passInt = 1
        //creating a NSURL
      //  let url = NSURL(string: myUrlData)
        
        //fetching the data from the url
       // URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
       //     let JSON = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
         //   if let roomsArray = (JSON as? [Any]) {
          //  }
          //
          //  print(self.roomsArray)
            
            
            
     //       OperationQueue.main.addOperation({
       //     })
            
       // }).resume()
//}

override func viewDidLoad() {
    super.viewDidLoad()
    getJsonFromUrl()
    self.kw.isHidden = true
    self.lb1.isHidden = true
    self.perday.isHidden = true
    
    
    
    
    }
}
