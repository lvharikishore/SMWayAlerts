//
//  LoginViewController.swift
//  WayAlerts
//
//  Created by Hari Kishore on 6/8/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtMobileNumber: UITextField!
    @IBAction func loginAction(sender: AnyObject) {
        DataController.sharedInstance.getOTP(mobile:txtMobileNumber.text!, success: { (data) in
            
            let result = try! NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String:AnyObject]
            
            print("response : \(result)")
            dispatch_async(dispatch_get_main_queue(), { 
               AlertBox.sharedInstance.show(title: (result?["message"] as? String)!, message: (result?["description"] as? String)!, parentViewController: self)
            });
            
            
            }) { (error) in
                //print("error : \(error)")
                AlertBox.sharedInstance.show(title: "Error", message: "\(error)", parentViewController: self)
        }
    }
}
