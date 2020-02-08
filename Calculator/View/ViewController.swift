
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var calculator = CalculatorLogic()
    private var isFinishedTypingNumber = true // make global variables, private
    
    private var  displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
            if let result = calculator.calculate(symbol: calcMethod)  {
                displayValue = result
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    if let displayValue = displayLabel.text {
                        if !displayValue.contains(".") {
                            displayLabel.text = displayLabel.text! + numValue
                        }
                        return
                    }
                    //                    this is a very confusing peice of code!
                    //                    guard let currentDisplayValue = Double(displayLabel.text!) else {
                    //                        fatalError("Cannot convert display label text to a Double!")
                    //                    }
                    //                    let isInt = floor(currentDisplayValue) == currentDisplayValue
                    //                    if !isInt {
                    //                        return
                    //                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}

