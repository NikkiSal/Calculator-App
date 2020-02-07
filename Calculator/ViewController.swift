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
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayValue *= -1
            } else if calcMethod == "AC" {
                displayLabel.text = "0"
            } else {
                displayValue *= 0.01
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
                    if let currentText = displayLabel.text {
                        if !currentText.contains(".") {
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

