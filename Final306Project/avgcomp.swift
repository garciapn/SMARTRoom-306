//
//  avgcomp.swift
//  Final306Project
//
//  Created by Alex Hansen on 4/11/17.
//  Copyright © 2017 PNGapps. All rights reserved.
//

import Foundation
import UIKit

class avgcomp: UIViewController {
    
    
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var week: UILabel!
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var refresh: UIButton!
    @IBOutlet weak var kw1: UILabel!
    @IBOutlet weak var kw2: UILabel!
    @IBOutlet weak var kw3: UILabel!
    
    
    var roomsArray = [[String]]()
    let myUrlData:String = "http://52.24.214.101/getavgday.php"
    func getJsonFromUrl(){
        let url = NSURL(string: myUrlData)
        URLSession.shared.dataTask(with: (url as? URL)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                print(jsonObj!.value(forKey: "avg")!)
                
                if let heroeArray = jsonObj!.value(forKey: "avg") as? NSArray {
                    for heroe in heroeArray{
                        
                        if let heroeDict = heroe as? NSDictionary {
                            if let daydb = heroeDict.value(forKey: "perday"), let weekdb = heroeDict.value(forKey: "perweek"),
                                let monthdb = heroeDict.value(forKey: "permonth") {
                                
                                self.roomsArray.append([(daydb as? String)!,(weekdb as? String)!,(monthdb as? String)!])
                            }
                            
                        }
                    }
                }
          
                OperationQueue.main.addOperation({
                    print(self.roomsArray)
                    self.day.text = "\(self.roomsArray[0][0])"
                    self.week.text = "\(self.roomsArray[0][1])"
                    self.month.text = "\(self.roomsArray[0][2])"
                    self.day.isHidden = false
                    self.week.isHidden = false
                    self.month.isHidden = false
                    self.kw1.isHidden = false
                    self.kw2.isHidden = false
                    self.kw3.isHidden = false
                })
            }
        }).resume()
    }
    
    @IBAction func refresh(_ sender: Any) {
        self.day.isHidden = true
        self.kw1.isHidden = true
        self.kw2.isHidden = true
        self.kw3.isHidden = true
        self.week.isHidden = true
        self.month.isHidden = true
        roomsArray.removeAll()
        getJsonFromUrl()
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.kw1.isHidden = true
        self.kw2.isHidden = true
        self.kw3.isHidden = true
        self.day.isHidden = true
        self.week.isHidden = true
        self.month.isHidden = true
        getJsonFromUrl()
    }
}
