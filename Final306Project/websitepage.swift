//
//  websitepage.swift
//  Final306Project
//
//  Created by Alex Hansen on 4/6/17.
//  Copyright © 2017 PNGapps. All rights reserved.
//

import Foundation

import UIKit

class websitepage: UIViewController {

    @IBOutlet weak var website: UIButton!

    @IBAction func website(_ sender: Any) {
        openUrl(urlStr: "http://34.209.189.8/login.jsp")
    }
    func openUrl(urlStr:String!) {
        if let url = NSURL(string:urlStr){
            
            UIApplication.shared.open(url as URL,options: [:],completionHandler:nil)
        }
        
    }
override func viewDidLoad() {
    super.viewDidLoad()
    
}
    
}
