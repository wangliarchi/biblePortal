//
//  SettingsTableViewController.swift
//  biblePortal
//
//  Created by Li Wang on 9/3/15.
//  Copyright (c) 2015 OU. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.tableFooterView = UIView(frame: CGRectZero)
        self.view.backgroundColor = UIColor.whiteColor()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "bookmarks"
        {
            if let destinationVC = segue.destinationViewController as? ViewController{
                
                destinationVC.fromPage = "hello world!"
                
            }
        }
    }
}