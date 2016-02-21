//
//  ViewController.swift
//  LoginScreen
//
//  Created by Patrick Li on 2/20/16.
//  Copyright © 2016 Dali Labs, Inc. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var foraLogo: UIImageView!
    @IBOutlet weak var textField: UITextField!
    var screen = UIScreen.mainScreen().bounds
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.layer.cornerRadius = 3
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification) {
        var info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.bottomConstraint.constant = keyboardFrame.size.height + 20
        })
    }
    
    func keyboardWillHide(notification: NSNotification){
        var info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.bottomConstraint.constant = 59
        })
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self);
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
}

