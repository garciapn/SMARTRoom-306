//
//  rawdatapage.swift
//  Final306Project
//
//  Created by Paolo Garcia & Alex Hansen on 4/5/17.
//  Copyright © 2017 PNGapps. All rights reserved.
//


import Foundation
import UIKit

class rawdatapage: UIViewController {
    //readings
    @IBOutlet weak var rawdatalb: UILabel!
    @IBOutlet weak var reading2: UILabel!
    @IBOutlet weak var reading3: UILabel!
    @IBOutlet weak var reading4: UILabel!
    @IBOutlet weak var reading5: UILabel!
    @IBOutlet weak var reading6: UILabel!
    @IBOutlet weak var reading7: UILabel!
    @IBOutlet weak var reading8: UILabel!
    @IBOutlet weak var reading9: UILabel!
    @IBOutlet weak var reading10: UILabel!
    @IBOutlet weak var reading11: UILabel!
    @IBOutlet weak var reading12: UILabel!
    @IBOutlet weak var reading13: UILabel!
    @IBOutlet weak var reading14: UILabel!
    @IBOutlet weak var reading15: UILabel!
    @IBOutlet weak var reading16: UILabel!
    @IBOutlet weak var reading17: UILabel!
    @IBOutlet weak var reading18: UILabel!
    @IBOutlet weak var reading19: UILabel!
    @IBOutlet weak var reading20: UILabel!
    @IBOutlet weak var reading21: UILabel!
    @IBOutlet weak var reading22: UILabel!
    @IBOutlet weak var reading23: UILabel!
    @IBOutlet weak var reading24: UILabel!
    
    //ids
    @IBOutlet weak var id1: UILabel!
    @IBOutlet weak var id2: UILabel!
    @IBOutlet weak var id3: UILabel!
    @IBOutlet weak var id4: UILabel!
    @IBOutlet weak var id5: UILabel!
    @IBOutlet weak var id6: UILabel!
    @IBOutlet weak var id7: UILabel!
    @IBOutlet weak var id8: UILabel!
    @IBOutlet weak var id9: UILabel!
    @IBOutlet weak var id10: UILabel!
    @IBOutlet weak var id11: UILabel!
    @IBOutlet weak var id12: UILabel!
    
    //filler
    @IBOutlet weak var p1: UILabel!
    @IBOutlet weak var p2: UILabel!
    @IBOutlet weak var p3: UILabel!
    @IBOutlet weak var p4: UILabel!
    @IBOutlet weak var p5: UILabel!
    @IBOutlet weak var p6: UILabel!
    @IBOutlet weak var p7: UILabel!
    @IBOutlet weak var p8: UILabel!
    @IBOutlet weak var p9: UILabel!
    @IBOutlet weak var p10: UILabel!
    @IBOutlet weak var p11: UILabel!
    @IBOutlet weak var p12: UILabel!
    
    
    
    
    var roomsArray = [[String]]()
    let myUrlData:String = "http://52.24.214.101/Consumption2.php"
    func getdata(){
        let theUrl = NSURL(string: "http://52.24.214.101/Consumption2.php")
        var request = URLRequest(url:theUrl! as URL)
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        request.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            if error != nil
            {
                print("error=\(String(describing: error))")
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("Everything isn't good")
            }
            else {
                var json: NSArray = NSArray()
                var jsonFixer : NSMutableArray = NSMutableArray()
                do {
                    
                    json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSArray
                    jsonFixer = NSMutableArray(array: json)
                    print (jsonFixer)
                    print ("-------------------")
                }catch {
                    print ("error with Json: \(error)")
                }
            }
        }
        task.resume()
        
    }
    func getJsonFromUrl(){
        let url = NSURL(string: myUrlData)
        URLSession.shared.dataTask(with: (url as? URL)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                print(jsonObj!.value(forKey: "Component")!)
                
                if let heroeArray = jsonObj!.value(forKey: "Component") as? NSArray {
                    for heroe in heroeArray{
                        
                        if let heroeDict = heroe as? NSDictionary {
                            if let custID = heroeDict.value(forKey: "id"), let energy = heroeDict.value(forKey: "energy") {
                                
                                self.roomsArray.append([(custID as? String)!,(energy as? String)!])
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
                    print(self.roomsArray.count)
                    //for i in 0...counter {
                    //  print (self.roomsArray[i][1]);
                    self.rawdatalb.text = "\(self.roomsArray[23][1]) "
                    self.reading2.text = "\(self.roomsArray[22][1]) "
                    self.reading3.text = "\(self.roomsArray[21][1]) "
                    self.reading4.text = "\(self.roomsArray[20][1]) "
                    self.reading5.text = "\(self.roomsArray[19][1]) "
                    self.reading6.text = "\(self.roomsArray[18][1]) "
                    self.reading7.text = "\(self.roomsArray[17][1]) "
                    self.reading8.text = "\(self.roomsArray[16][1]) "
                    self.reading9.text = "\(self.roomsArray[15][1]) "
                    self.reading10.text = "\(self.roomsArray[14][1]) "
                    self.reading11.text = "\(self.roomsArray[13][1]) "
                    self.reading12.text = "\(self.roomsArray[12][1]) "
                    self.reading13.text = "\(self.roomsArray[11][1]) "
                    self.reading14.text = "\(self.roomsArray[10][1]) "
                    self.reading15.text = "\(self.roomsArray[9][1]) "
                    self.reading16.text = "\(self.roomsArray[8][1]) "
                    self.reading17.text = "\(self.roomsArray[7][1]) "
                    self.reading18.text = "\(self.roomsArray[6][1]) "
                    self.reading19.text = "\(self.roomsArray[5][1]) "
                    self.reading20.text = "\(self.roomsArray[4][1]) "
                    self.reading21.text = "\(self.roomsArray[3][1]) "
                    self.reading22.text = "\(self.roomsArray[2][1]) "
                    self.reading23.text = "\(self.roomsArray[1][1]) "
                    self.reading24.text = "\(self.roomsArray[0][1]) "
                    
                    self.id1.text = "\(self.roomsArray[0][0]) "
                    self.id2.text = "\(self.roomsArray[1][0]) "
                    self.id3.text = "\(self.roomsArray[2][0]) "
                    self.id4.text = "\(self.roomsArray[3][0]) "
                    self.id5.text = "\(self.roomsArray[4][0]) "
                    self.id6.text = "\(self.roomsArray[5][0]) "
                    self.id7.text = "\(self.roomsArray[6][0]) "
                    self.id8.text = "\(self.roomsArray[7][0]) "
                    self.id9.text = "\(self.roomsArray[8][0]) "
                    self.id10.text = "\(self.roomsArray[9][0]) "
                    self.id11.text = "\(self.roomsArray[10][0]) "
                    self.id12.text = "\(self.roomsArray[11][0]) "
                    print(self.roomsArray)
                    //setting labels to show
                    self.p1.isHidden = false
                    self.p2.isHidden = false
                    self.p3.isHidden = false
                    self.p4.isHidden = false
                    self.p5.isHidden = false
                    self.p6.isHidden = false
                    self.p7.isHidden = false
                    self.p8.isHidden = false
                    self.p9.isHidden = false
                    self.p10.isHidden = false
                    self.p11.isHidden = false
                    self.p12.isHidden = false
                    self.id1.isHidden = false
                    self.id2.isHidden = false
                    self.id3.isHidden = false
                    self.id4.isHidden = false
                    self.id5.isHidden = false
                    self.id6.isHidden = false
                    self.id7.isHidden = false
                    self.id8.isHidden = false
                    self.id9.isHidden = false
                    self.id10.isHidden = false
                    self.id11.isHidden = false
                    self.id12.isHidden = false
                    self.rawdatalb.isHidden = false
                    self.reading2.isHidden = false
                    self.reading3.isHidden = false
                    self.reading4.isHidden = false
                    self.reading5.isHidden = false
                    self.reading6.isHidden = false
                    self.reading7.isHidden = false
                    self.reading8.isHidden = false
                    self.reading9.isHidden = false
                    self.reading10.isHidden = false
                    self.reading11.isHidden = false
                    self.reading12.isHidden = false
                    self.reading13.isHidden = false
                    self.reading14.isHidden = false
                    self.reading15.isHidden = false
                    self.reading16.isHidden = false
                    self.reading17.isHidden = false
                    self.reading18.isHidden = false
                    self.reading19.isHidden = false
                    self.reading20.isHidden = false
                    self.reading21.isHidden = false
                    self.reading22.isHidden = false
                    self.reading23.isHidden = false
                    self.reading24.isHidden = false
                    //calling another function after fetching the json
                    //it will show the names to label
                    // self.showNames()
                })
            }
        }).resume()
    }
    
    func showNames(){
        //looing through all the elements of the array
        //for custID, roomnName, roomID, compName, compStatus in roomsArray{
        //appending the names to label
        
        //}
    }
    
    @IBOutlet var refresh: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.p1.isHidden = true
        self.p2.isHidden = true
        self.p3.isHidden = true
        self.p4.isHidden = true
        self.p5.isHidden = true
        self.p6.isHidden = true
        self.p7.isHidden = true
        self.p8.isHidden = true
        self.p9.isHidden = true
        self.p10.isHidden = true
        self.p11.isHidden = true
        self.p12.isHidden = true
        roomsArray.removeAll()
        
        getJsonFromUrl()
        
        
        
    }
    
    
    
    
    @IBAction func refresh(sender: UIButton) {
        self.p1.isHidden = true
        self.p2.isHidden = true
        self.p3.isHidden = true
        self.p4.isHidden = true
        self.p5.isHidden = true
        self.p6.isHidden = true
        self.p7.isHidden = true
        self.p8.isHidden = true
        self.p9.isHidden = true
        self.p10.isHidden = true
        self.p11.isHidden = true
        self.p12.isHidden = true
        self.id1.isHidden = true
        self.id2.isHidden = true
        self.id3.isHidden = true
        self.id4.isHidden = true
        self.id5.isHidden = true
        self.id6.isHidden = true
        self.id7.isHidden = true
        self.id8.isHidden = true
        self.id9.isHidden = true
        self.id10.isHidden = true
        self.id11.isHidden = true
        self.id12.isHidden = true
        self.rawdatalb.isHidden = true
        self.reading2.isHidden = true
        self.reading3.isHidden = true
        self.reading4.isHidden = true
        self.reading5.isHidden = true
        self.reading6.isHidden = true
        self.reading7.isHidden = true
        self.reading8.isHidden = true
        self.reading9.isHidden = true
        self.reading10.isHidden = true
        self.reading11.isHidden = true
        self.reading12.isHidden = true
        self.reading13.isHidden = true
        self.reading14.isHidden = true
        self.reading15.isHidden = true
        self.reading16.isHidden = true
        self.reading17.isHidden = true
        self.reading18.isHidden = true
        self.reading19.isHidden = true
        self.reading20.isHidden = true
        self.reading21.isHidden = true
        self.reading22.isHidden = true
        self.reading23.isHidden = true
        self.reading24.isHidden = true
        roomsArray.removeAll()
        getJsonFromUrl()
    }
}

