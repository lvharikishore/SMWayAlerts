//
//  NetworkController.swift
//  WayAlerts
//
//  Created by Hari Kishore on 6/9/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

import UIKit

class NetworkController: NSObject {
    
    static let sharedInstance = NetworkController()
    
    func loadRequest(request : NSMutableURLRequest, Params params : Dictionary<String, String>, Success success:(responseData : NSData)->(), Failure failure:(error : NSError) -> ()) {
        
        let session = NSURLSession.sharedSession()
        
        request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(params, options:[])
        
        let task = session.dataTaskWithRequest(request, completionHandler: {
            data, response, error -> Void in
            
            if error != nil{
                failure(error: error!)
                return
            } else {
                success(responseData: data!)
            }
        })
        
        task.resume()
    }
}
