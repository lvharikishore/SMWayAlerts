//
//  RegistrationViewController.swift
//  WayAlerts
//
//  Created by venkata hari kishore lokam on 11/06/16.
//  Copyright © 2016 Cognizant. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, UIGestureRecognizerDelegate, UITextFieldDelegate {

    @IBOutlet weak var lblTandC: UILabel!
    @IBOutlet weak var termsAndCButton: UIButton!
    @IBOutlet weak var txtMobileNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblTandC.userInteractionEnabled = true
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(termsAndConditionsClickAction))
        lblTandC.addGestureRecognizer(tap)
        tap.delegate = self
        self.txtMobileNumber.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func btnCancelAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func tcButtonAction(sender: AnyObject) {
        if(self.termsAndCButton.selected == true) {
            self.termsAndCButton.selected = false
        } else {
            self.termsAndCButton.selected = true
            self.termsAndCButton.setImage(UIImage(named: "second.png"), forState: UIControlState.Selected)
        }
    }
    
    func termsAndConditionsClickAction(gr:UITapGestureRecognizer) {
        // user touch field
        
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= Constants.mobileNumberLimit
    }
    

}
