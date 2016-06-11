//
//  DataController.swift
//  WayAlerts
//
//  Created by Hari Kishore on 6/9/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

import UIKit

class DataController: NSObject {
    static let sharedInstance = DataController()
    
    
    func getOTP(mobile mobileNumber : String, success : (responseData : NSData)->(), failure : (error : NSError)->()) {
        
        let params = ["requesterid":"260", "requestname":"loginRequest", "requestparameters" : "{\"mobile\" : \"\(mobileNumber)\"}"] as Dictionary<String, String>
        
        NetworkController.sharedInstance.loadRequest(requestWithURl(Constants.waRequestURL), Params: params, Success: { (data) in
            //print(response)
            success(responseData: data)
            }) { (error) in
                //print(error)
                failure(error: error)
        }
    }
    
    func requestWithURl(urlString : String) -> NSMutableURLRequest {
        let request = NSMutableURLRequest(URL: NSURL(string: urlString)!)
        request.HTTPMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}
