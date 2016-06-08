//
//  AlertBox.swift
//  WayAlerts
//
//  Created by Hari Kishore on 6/8/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

import UIKit

class AlertBox: NSObject {

    static let sharedInstance = AlertBox()
    
    //var title : String
    //var message : String
    
//    override init() {
//        title = "Error"
//        message = "Error Message"
//    }
    
//    init () {
//        self.title = titleString
//        self.message = messageString
//    }
    
    func show(title title : String, message msg : String, parentViewController parent : UIViewController) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        parent.presentViewController(alert, animated: true, completion: nil)
    }
    
    func show(title title : String, message msg : String, okAction:()->Void, cancelAction:()->Void, parentViewController parent : UIViewController) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {(testOk: UIAlertAction!) in okAction()}))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: {(testCancel: UIAlertAction!) in cancelAction()}))
        parent.presentViewController(alert, animated: true, completion: nil)
    }
}
