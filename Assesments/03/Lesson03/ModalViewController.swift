//
//  ModalViewController.swift
//  Lesson03
//
//  Created by Jeffrey Lee on 1/15/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet weak var simpleImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var image = UIImage(named: "CoolCat.JPG")
        
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    // TODO three: Add and hook up a 'dismiss' button below the above mentioned image view that will dismiss the modal dialog. Do this in CODE.
    
    @IBAction func dismissModal(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
