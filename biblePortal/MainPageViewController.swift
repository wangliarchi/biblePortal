//
//  ViewController.swift
//  biblePortal
//
//  Created by Li Wang on 8/27/15.
//  Copyright (c) 2015 OU. All rights reserved.
//

import UIKit
import SwiftyJSON



class MainPageViewController: UIViewController{

    @IBOutlet var fullText: UIButton!

    @IBOutlet var viewPast: UIButton!
    
    var news = [JSON]()
    let networkManager = NetworkManager()
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fullText.layer.cornerRadius = 7
        viewPast.layer.cornerRadius = 7
        
        networkManager.manager.request(.GET, "http://52.24.143.251/post?topic=Headline", parameters: nil, encoding: .JSON, headers: nil)
        .responseJSON { response in
            //response.
            
            //println(responseJSON)
            
            let error = response.result.error
            if(error != nil) {
                
                NSLog("Fetch News Collection Error: \(error)")
            } else {
                
                let jsonData = JSON(response.result.value!)
                
                self.news = jsonData["_embedded"]["post"].array!
                
            }
            
            
            
        }
        
            
        
        
    }
    
       
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBarHidden = false
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

