//
//  NetworkManager.swift
//  biblePortal
//
//  Created by Li Wang on 9/10/15.
//  Copyright (c) 2015 OU. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    var manager: Manager!
    
    init() {
        var headers = Alamofire.Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders ?? [:]
        headers["Accept"] = "application/json"
        
        Alamofire.Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders = headers
        
        manager = Alamofire.Manager.sharedInstance
        
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.HTTPAdditionalHeaders = headers
        
        
        manager = Alamofire.Manager(configuration: configuration)
    }
}

