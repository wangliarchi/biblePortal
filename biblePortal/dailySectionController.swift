//
//  DailySectionController.swift
//  biblePortal
//
//  Created by Li Wang on 9/14/15.
//  Copyright (c) 2015 OU. All rights reserved.
//
import UIKit
import SwiftyJSON

class DailySectionController: UITableViewController {

    var news = [JSON]()
    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.estimatedRowHeight = 200.0;
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        
       
        
        networkManager.manager.request(.GET, "http://52.24.143.251/post?topic=Headline", parameters: nil, encoding: .JSON, headers: nil)
            .responseJSON { response in
                //response.
                
//                print(response.result.value)
                
                let error = response.result.error
                if(error != nil) {
                    
                    NSLog("Fetch News Collection Error: \(error)")
                } else {
                    
                    let jsonData = JSON(response.result.value!)
                    
                    print(jsonData["_embedded"]["post"].array!)
                    
                    self.news = jsonData["_embedded"]["post"].array!
                    
                }
                
                self.tableView.reloadData()
                
        }
            
    //delegate method
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.news.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("dailySectionCell") as! NewCellOfDaily
        
        
        let news = self.news[indexPath.row]
        
        cell.dailyTitle.text = news["title"].string!
        cell.dailyAuthor.text = news["author"].string!
        
        
        return cell
    
    }
    
    
    func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBarHidden = true
    }
    
    func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBarHidden = false
        
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsetsZero
        cell.layoutMargins = UIEdgeInsetsZero
        
        (cell as! NewCellOfDaily).dailySection.layer.cornerRadius=7
       (cell as! NewCellOfDaily).dailyTitle.numberOfLines = 0
       (cell as! NewCellOfDaily).dailyTitle.lineBreakMode = NSLineBreakMode.ByWordWrapping
     (cell as! NewCellOfDaily).dailyTitle.sizeToFit()
    }
//
    func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
}