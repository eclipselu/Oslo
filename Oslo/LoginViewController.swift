//
//  LoginViewController.swift
//  Oslo
//
//  Created by hippo_san on 3/10/16.
//  Copyright © 2016 hippo_san. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var loginView: DesignableView!
  @IBOutlet weak var emailTextFiled: DesignableTextField!
  @IBOutlet weak var passwordTextField: DesignableTextField!
  
  @IBAction func closeButtonDidPressed(sender: AnyObject) {
    view.endEditing(true)
    
    loginView.animation = "fall"
    loginView.animate()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    emailTextFiled.delegate = self
    passwordTextField.delegate = self
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    if emailTextFiled.text == "" || passwordTextField == "" {
      loginView.animation = "shake"
      loginView.animate()
      return true
    } else {
      textField.resignFirstResponder()
      return true
    }
  }
  
  
}
