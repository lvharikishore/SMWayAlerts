//
//  LoginViewController.swift
//  WayAlerts
//
//  Created by Hari Kishore on 6/8/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIGestureRecognizerDelegate, UITextFieldDelegate {

    @IBOutlet weak var txtMobileNumber: UITextField!
    @IBOutlet weak var lblRegistration: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblRegistration.userInteractionEnabled = true
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(launchRegistrationScreen))
        lblRegistration.addGestureRecognizer(tap)
        tap.delegate = self
        self.txtMobileNumber.delegate = self
    }
    
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
    
    func launchRegistrationScreen(gr:UITapGestureRecognizer) {
        // user touch field
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("RegistrationViewController") 
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= Constants.mobileNumberLimit
    }
}
