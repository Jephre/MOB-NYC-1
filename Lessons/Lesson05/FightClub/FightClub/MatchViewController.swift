//
//  MatchViewController.swift
//  FightClub
//
//  Created by Jeffrey Lee on 1/14/15.
//  Copyright (c) 2015 Jeffrey Lee. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController {

    @IBOutlet weak var resultsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    
    @IBAction func startMatch(sender: AnyObject) {
        resultsLabel.text = Match().playGame()
    }
    
}
