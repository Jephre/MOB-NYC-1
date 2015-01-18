import UIKit

class ViewController: UIViewController {
    
    // @IBOutlet weak var yoLabel: UILabel!
    // in order to use this in a subsequent IBAction, it needs to be declared before the IBAction
    
    // @IBOutlet weak var itsATextField: UITextField!
    
    // Functions of use for this exercise:
    // Translating a string to an integer: "1".toInt()
    // Getting the text from a text field: let text = textFieldName.text
    // Setting the text on a text label or text field: textLabelName.text = "some text"
    
    /*
    TODO: Create a text field, a label and a button in the storyboard's View Controller. Drag a new outlet from the label and text field to this file, then drag the 'touch up inside' event on the button into this file. When the button is clicked, make the text of the label display 'hello {whatever the text in the text field is}. Call an instructor/TA when you're done with this task.
    */
    
    
    /*
    TODO: Paste the fibonacci number function that you previously created into this class. Change the text box to use a numeric keypad for input. When the button is pressed, make the label print out the nth number in the fibonacci sequence (where n is the value of the text in the text field). Call an instructor/TA when you're done with this task.
    */
    
    //to ensure numeric keypad, click on the interface element in interface builder and click on the 4th tab on the right pane (the one that looks like a little tab on a ruler), change keyboard type to "numeric keypad"
    
//    @IBAction func didTapButton(sender: AnyObject) {
//        // self.view.backgroundColor = UIColor.redColor()
//        // yoLabel.text = "Hello \(itsATextField.text)."
//        // func returnFibo(itsATextField: Int) {
//            var index = itsATextField.text.toInt()
//        
//            var a = 0
//            var b = 1
//            var c = 1
//            if index == 0 {
//                yoLabel.text = "0"
//            }
//            else if index == 1 {
//                yoLabel.text = "1"
//            }
//            else {
//                for ctr in 2...index! {
//                    c = a + b
//                    a = b
//                    b = c
//                }
//            yoLabel.text = toString(c)
//            }
//        }
        //returnFibo(itsATextField.text.toInt()!)
    
    /*
    TODO: Drag a new text field into the view controller, and create an outlet for it here. Make both text fields use the numeric keypad. One text field represents an optional tip percentage (in integer form, e.g 20 = 20% tip), the other represents the total amount of a bill. When the button is pressed, make the label display both the total amount and tip amount (e.g. "total: $100, tip: $15"). Call an instructor/TA when you're done with this task.
    */
    
    
    @IBOutlet weak var tipField: UITextField!
    @IBOutlet weak var totalBill: UITextField!
    @IBOutlet weak var yoLabel: UILabel!
    
    @IBAction func buttonTapped(sender: AnyObject) {
        var tipFieldPercent = Float(tipField.text.toInt()!) / Float(100)
        var tipAmount = Float(totalBill.text.toInt()!) * tipFieldPercent
        yoLabel.numberOfLines = 0
        yoLabel.text = "Your total bill is $\(totalBill.text), and your tip amount is $\(tipAmount)."
    }
}