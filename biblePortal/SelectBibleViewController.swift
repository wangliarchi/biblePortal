//
//  SelectBibleViewController.swift
//  biblePortal
//
//  Created by Li Wang on 9/9/15.
//  Copyright (c) 2015 OU. All rights reserved.
//

import UIKit

class SelectBibleViewController: UITableViewController {
        
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            
            if segue.identifier == "Genesis"
            {
                if let destinationVC = segue.destinationViewController as? ViewController{
                    
                    destinationVC.fromPage = "Scriptures Here"
                    
                }
            }
            
            if segue.identifier == "Exodus"
            {
                if let destinationVC = segue.destinationViewController as? ViewController{
                    
                    destinationVC.fromPage = "Scriptures Here"
                    
                }
            }
            
            if segue.identifier == "Levites"
            {
                if let destinationVC = segue.destinationViewController as? ViewController{
                    
                    destinationVC.fromPage = "Scriptures Here"
                    
                }
            }
        }
}

