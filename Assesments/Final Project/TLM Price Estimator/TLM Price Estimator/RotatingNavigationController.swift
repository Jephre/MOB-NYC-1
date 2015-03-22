//
//  RotatingNavigationController.swift
//  TLM Price Estimator
//
//  Created by Jeffrey Lee on 3/19/15.
//  Copyright (c) 2015 Jeffrey Lee. All rights reserved.
//

import UIKit

class RotatingNavigationController: UINavigationController {
    
    let turquoiseColor = UIColor(red: 26/255, green: 188/255, blue: 156/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = turquoiseColor
    }
    
    override func shouldAutorotate() -> Bool {
        return self.visibleViewController.shouldAutorotate()
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return self.visibleViewController.supportedInterfaceOrientations()
    }
    
}
