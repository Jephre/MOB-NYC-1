//
//  ViewController.swift
//  LoginApp
//
//  Created by Jeffrey Lee on 2/2/15.
//  Copyright (c) 2015 Jeffrey Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        var loginContainer = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
        loginContainer.backgroundColor = UIColor.grayColor()
        loginContainer.center = self.view.center
        self.view.addSubview(loginContainer)
        
        var usernameField: UITextField = UITextField(frame: CGRect(x: loginContainer.frame.size.width/2 - 100, y: loginContainer.frame.size.height/3, width: 200, height: 50))
        // using springs and structs, the way to center things is through math. In the case of the x positioning within a container, keep in mind that it refers to the leftmost coordinate
        usernameField.placeholder = "Please enter your username."
        usernameField.layer.cornerRadius = 5
        usernameField.borderStyle = UITextBorderStyle.Line
        loginContainer.addSubview(usernameField)
        
        var passwordField: UITextField = UITextField(frame: CGRect(x: loginContainer.frame.size.width/2 - 100, y: (loginContainer.frame.size.height/3) + 70, width: 200, height: 50))
        passwordField.placeholder = "Please enter your password."
        passwordField.layer.cornerRadius = 5
        passwordField.borderStyle = UITextBorderStyle.Line
        loginContainer.addSubview(passwordField)
        
        println("It works")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

