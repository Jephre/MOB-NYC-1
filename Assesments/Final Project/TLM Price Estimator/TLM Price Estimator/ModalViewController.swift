//
//  ModalViewController.swift
//  TLM Price Estimator
//
//  Created by Jeffrey Lee on 3/20/15.
//  Copyright (c) 2015 Jeffrey Lee. All rights reserved.
//

import UIKit

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}

class ModalViewController: UIViewController {
    
//    var json: NSDictionary?
    
    var conversionRate: Float?
    var priceField = UILabel()
    var shippingField = UILabel()
    var plhPrice: String?
    var plhShipping: String?
    
    var calculatedTotalLabel = UILabel()
    var calculatedTotal: Float = 0.000 {
        didSet {
            // if conversionRate was set, update the UI
            updateViewData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        
        autoLayout()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let url = NSURL(string: "http://api.fixer.io/latest?base=USD") {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
                
                if let e = error {
                    println("\(e.localizedDescription)")
                    return
                }
                
                if let d = data {
                    var jsonError: NSError?
                    if let jsonDict = NSJSONSerialization.JSONObjectWithData(d, options: NSJSONReadingOptions.allZeros, error: &jsonError) as? NSDictionary {
                        
                        if let rates = jsonDict["rates"] as? NSDictionary {
                            if let canadianRate = rates["CAD"] as? Double {
                                self.conversionRate = Float(canadianRate)

                                // this updates the UI after the calculation is done. Important.
                                dispatch_async(dispatch_get_main_queue(), {
                                    self.priceCalculator()
                                })
                            }
                        }
                    }
                    
                }
                
            })
            // Required to start the network task
            task.resume()
        }
    }
    
    // used to set UI
    func updateViewData() {
        calculatedTotalLabel.textAlignment = .Center
        calculatedTotalLabel.textColor = UIColor.blackColor()
        calculatedTotalLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        calculatedTotalLabel.font = UIFont.boldSystemFontOfSize(16.0)
        calculatedTotalLabel.sizeToFit()
        calculatedTotalLabel.text = "$\(calculatedTotal) CAD"
    }
    
    // actual calculation done here
    func priceCalculator() {
        
        var priceContainer: Float?
        var shippingContainer: Float?
        var visaCharge: Float = 0.025
        var dutyCharge: Float = 0.06
        var brokerageCharge: Float = 0.0
        
        // unwrap optionals gracefully, ensure that placeholder price and shipping variables that are piped in from ViewController.swift have a value. If they do, create a container variable to store the actual price and shipping values
        if let price = plhPrice?.floatValue {
            if let shipping = plhShipping?.floatValue {
                priceContainer = price
                shippingContainer = shipping
            }
        }
        
        // calculate brokerage charge based on price ranges
        if priceContainer >= 0 && priceContainer <= 20 {
            brokerageCharge = 0.00
        }
        else if priceContainer >= 20.01 && priceContainer <= 40 {
            brokerageCharge = 7.00
        }
        else if priceContainer >= 40.01 && priceContainer <= 60 {
            brokerageCharge = 16.75
        }
        else if priceContainer >= 60.01 && priceContainer <= 100 {
            brokerageCharge = 19.95
        }
        else if priceContainer >= 100.01 && priceContainer <= 150 {
            brokerageCharge = 26.60
        }
        else if priceContainer >= 150.01 && priceContainer <= 200 {
            brokerageCharge = 30.40
        }
        else if priceContainer >= 200.01 && priceContainer <= 350 {
            brokerageCharge = 48.00
        }
        else if priceContainer >= 350.01 && priceContainer <= 500 {
            brokerageCharge = 53.40
        }
        else if priceContainer >= 500.01 && priceContainer <= 750 {
            brokerageCharge = 63.60
        }
        else if priceContainer >= 750.01 && priceContainer <= 1000 {
            brokerageCharge = 71.80
        }
        else if priceContainer >= 1000.01 && priceContainer <= 1600 {
            brokerageCharge = 84.85
        }
        else if priceContainer >= 1600.01 && priceContainer <= 2500 {
            brokerageCharge = 96.50
        }
        else if priceContainer >= 2500.01 {
            brokerageCharge = 0
        }
        
        // the first line actually assigns the value of conversionRate to variable "actualConversionRate" IF conversionRate variable has a value. Everything after the curly braces is executed IF the above condition is satisfied. At the start of ModalViewController.swift, we defined a global variable "calculatedTotal" to store the value of the...well, calculated total. Now, we're giving that global variable a value through this function.
        if let actualConversionRate = conversionRate {
            let canadianPrice = (priceContainer! * actualConversionRate)
            let shippingCanadian = (shippingContainer! * actualConversionRate)
            let actualVisaCharge = ((priceContainer! * actualConversionRate) * visaCharge)
            let actualDutyCharge = ((priceContainer! * actualConversionRate) * dutyCharge)
            let canadianConvertedPrice = canadianPrice + shippingCanadian + actualVisaCharge + actualDutyCharge + brokerageCharge
            calculatedTotal = canadianConvertedPrice
        }
    }
    
    // layout where the label goes.
    func autoLayout() {
        self.view.addSubview(calculatedTotalLabel)
        calculatedTotalLabel.setTranslatesAutoresizingMaskIntoConstraints(false)

        
        self.view.addConstraint(NSLayoutConstraint(item: calculatedTotalLabel, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1.0, constant: -80))
        self.view.addConstraint(NSLayoutConstraint(item: calculatedTotalLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 50))
        self.view.addConstraint(NSLayoutConstraint(item: calculatedTotalLabel, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: calculatedTotalLabel, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: -100))
        
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
    
}
