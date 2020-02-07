//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTypingNumber = true
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert display label text to a Double.")
        }
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayLabel.text = String(number * -1)
            } else if calcMethod == "AC" {
                displayLabel.text = "0"
            } else {
                displayLabel.text = String(number/100)
            }
        }
    }
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." { // this is a very confusing peice of code!
                    if let currentText = displayLabel.text {
                        if !currentText.contains(".") {
                            displayLabel.text = displayLabel.text! + numValue
                        }
                        return
                    }
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

