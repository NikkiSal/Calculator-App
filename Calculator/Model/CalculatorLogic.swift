

import Foundation

struct CalculatorLogic {
    private var number: Double?
    private var intermediateCalculation:(n1: Double, calcMethod: String)?
    mutating func setNumber(_ number: Double) { // we added this function because we set the number property as private, where no one else can touch it.
        self.number = number
    }
    
    mutating func calculate (symbol:String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumCalculations(n2:n)
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
                return n
            }
        }
        return nil
    }
    private func performTwoNumCalculations(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation =
            intermediateCalculation?.calcMethod {
             switch operation {
                       case "+":
                           return n1 + n2
                       case "-":
                           return n1 - n2
                       case "×":
                           return n1 * n2
                       case "÷":
                           return n1 / n2
                       default:
                           fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }
}
