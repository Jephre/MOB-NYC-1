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
        // TODO two: Add an imageview to the modal dialog presented in TODO two.
        let dismissBtn = UIButton.buttonWithType(UIButtonType.System) as UIButton
//        let screenRect = UIScreen.mainScreen().bounds
//        dismissBtn.frame = CGRectMake(0, 181.0, 206.0, 55)
//        dismissBtn.contentHorizontalAlignment = .Center
//        dismissBtn.contentVerticalAlignment = .Center
        // how do I programmatically center a button vertically and horizontally? (see below, the part including NSLayoutConstraint)
        dismissBtn.backgroundColor = UIColor(red: 22.0/255.0, green: 160.0/255.0, blue: 133.0/255.0, alpha: 1.0)
        dismissBtn.setTitle("Test Button", forState: UIControlState.Normal)
        dismissBtn.titleLabel?.font = UIFont.systemFontOfSize(31)
        dismissBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        dismissBtn.layer.masksToBounds = true
        dismissBtn.layer.cornerRadius = 5.0
        dismissBtn.addTarget(self, action: "btnTouched:", forControlEvents: .TouchUpInside)
        
        
        dismissBtn.setTranslatesAutoresizingMaskIntoConstraints(false)
        let vert = NSLayoutConstraint(item: dismissBtn, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0)
        let horiz = NSLayoutConstraint(item: dismissBtn, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0)
        

        
        var image = UIImage(named: "CoolCat.JPG")!
        
        var iv = UIImageView(image: image)
        // this actually initializes the view of the UIImage
        
        iv.frame = CGRect(x: 0, y: 0, width: 375, height: 667)
        // create size for the UIImage
        
        iv.contentMode = UIViewContentMode.ScaleAspectFill
        // get the content of the UIImageView to completely fill the view
        
        iv.clipsToBounds = true
        // get the content of the UIImageView to clip to the bounds set by the view/frame
        
        self.view.addSubview(iv)
        
        self.view.insertSubview(dismissBtn, aboveSubview: iv)
        // set the order of views (in this case, we're making the UIImageView higher?
        // use CMD + T to slow-mo animations
        self.view.addConstraints([vert, horiz])


        
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
    
    
    
    func btnTouched(sender:UIButton!) {
        println("Button tapped")
        dismissViewControllerAnimated(true, completion: nil)
    }
        // completion is a function that is a callback...? dismiss func and viewDidLoad func run ASYNCHONOUSLY (meaning at separate times)
}
