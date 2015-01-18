//
//  ViewController.swift
//  PresentModallyLes6
//
//  Created by Jeffrey Lee on 1/14/15.
//  Copyright (c) 2015 Jeffrey Lee. All rights reserved.
//

import UIKit

// when on Main.storyboard, the third tab from the left on the right menu is the identity menu. You can define a class name for a ViewController through this menu.

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println("View loaded!")
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    } All of the above is deletable because it's already in the parent UIViewController class.

    override func viewDidAppear(animated: Bool) {
        println("view appeared! Woohoo!")
    }
    
    override func viewDidDisappear(animated: Bool) {
        println("Phew, we finally dismissed a modal!")
    }
    // this doesn't actually make the modal go away

    @IBAction func didTapLogin(sender: AnyObject) {
        if countElements(emailField.text) > 0 {
//            dismissViewControllerAnimated(true, completion: nil)
//            // this only checks if there's ANYTHING in the text field
            
            if Match().playGame() == "Bad Player Loses!" {
                performSegueWithIdentifier("Goodwon", sender: nil)
            }
            else if Match().playGame() == "Good Player Loses!" {
                performSegueWithIdentifier("Badwon", sender: nil)
            }
        }
        
    }
    // the method (dismissViewControllerAnimated) to close the modal is actually part of the UIViewController class! the completion requirement can be nil if you are okay with it being empty. OR, you can try putting in "string".
}

