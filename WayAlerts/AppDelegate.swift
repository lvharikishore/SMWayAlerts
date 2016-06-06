//
//  AppDelegate.swift
//  WayAlerts
//
//  Created by Hari Kishore on 6/6/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let googleMapsApiKey = "AIzaSyBsyZy8VXt_CJPi_zDrgRq1aOx0ITWvghM"

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        GMSServices.provideAPIKey(googleMapsApiKey)
        
//        let request = NSMutableURLRequest(URL: NSURL(string: "http://syncminds.ddns.net/wayalerts_d_sm/api/requestprocessor/requestProcessing")!)
//        let session = NSURLSession.sharedSession()
//        request.HTTPMethod = "POST"
//        
//        let params = ["requesterid":"227", "requestname":"updateMyPosition", "requestparameters" : "[\"userid\" : \"227\", \"wayid\":\"227\", \"currentlocation\" : \"17.4460204,78.3914782\", \"batterylevel\" : \"20\", \"accuracy\" : \"10\"]"] as Dictionary<String, String>
//        
//        request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(params, options:[])
//        
//        //request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        
//        let task = session.dataTaskWithRequest(request, completionHandler: {
//            data, response, error -> Void in
//            print("Response: \(response)")})
//        
//        task.resume()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

