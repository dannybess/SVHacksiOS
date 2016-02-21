//
//  ViewController.swift
//  LoginScreen
//
//  Created by Patrick Li on 2/20/16.
//  Copyright © 2016 Dali Labs, Inc. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var foraLogo: UIImageView!
    @IBOutlet weak var textField: UITextField!
    var screen = UIScreen.mainScreen().bounds
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nav = self.navigationController?.navigationBar
        nav?.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        nav?.shadowImage = UIImage()
        nav?.translucent = true
        textField.layer.cornerRadius = 5
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
        self.textField.frame.origin.y = self.foraLogo.frame.maxY + 30
    }
    
    func keyboardWillHide(notification: NSNotification){
        var info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        self.textField.frame.origin.y = screen.height - textField.frame.height - self.loginButton.frame.height - 20
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self);
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
}

