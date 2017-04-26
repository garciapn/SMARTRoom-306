//
//  Datapage.swift
//  Final306Project
//
//  Created by Paolo Garcia & Alex Hansen on 4/5/17.
//  Copyright © 2017 PNGapps. All rights reserved.
//

import Foundation
import UIKit

class Datapage: UIViewController {
    
    var roomsArray = [[String]]()
    let myUrlData:String = "http://52.24.214.101/Consumption.php"
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
        //creating a NSURL
        let url = NSURL(string: myUrlData)
        
        //fetching the data from the url
        URLSession.shared.dataTask(with: (url as? URL)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                //printing the json in console
                print(jsonObj!.value(forKey: "Component")!)
                
                //getting the avengers tag array from json and converting it to NSArray
                if let heroeArray = jsonObj!.value(forKey: "Component") as? NSArray {
                    //looping through all the elements
                    for heroe in heroeArray{
                        
                        //converting the element to a dictionary
                        if let heroeDict = heroe as? NSDictionary {
                            
                            //getting the name from the dictionary
                            if let custID = heroeDict.value(forKey: "id"), let energy = heroeDict.value(forKey: "energy") {
                                
                                //adding the name to the array
                                self.roomsArray.append([(custID as? String)!,(energy as? String)!])
                                
                            }
                            
                        }
                    }
                }
               // print(self.roomsArray)
                OperationQueue.main.addOperation({
                    //calling another function after fetching the json
                    //it will show the names to label
                    //self.showNames()
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
        getJsonFromUrl() 
    }

    @IBAction func refresh(sender: UIButton) {
        getJsonFromUrl()
        }
    }


