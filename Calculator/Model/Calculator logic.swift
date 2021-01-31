//
//  Calculator logic.swift
//  Calculator
//
//  Created by Lukas Adomavicius on 1/31/21.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var intermediateCalculation: (number1: Double, operation: String)?
    
    mutating func calculate(_ calcMethod: String,_ displayValue: Double?) -> Double? {
        if let displayValue = displayValue {
            switch calcMethod {
            case "+/-":
                return displayValue * -1
            case "AC":
                intermediateCalculation = nil
                return 0
            case "%":
                return displayValue * 0.01
            case "=":
                return performTwoNumberCalculation(number2: displayValue)
            default:
                intermediateCalculation = (number1: displayValue, operation: calcMethod)
            }
        }
        return nil
    }
    
    private func performTwoNumberCalculation(number2: Double) -> Double? {
        
        if
            let number1 = intermediateCalculation?.number1,
            let operation = intermediateCalculation?.operation {
            
            switch operation {
            case "+":
                return number1 + number2
            case "×":
                return number1 * number2
            case "÷":
                return number1 / number2
            case "-":
                return number1 - number2
            default:
                fatalError("Cannot understand operation")
            }
        } else {
            return nil
        }
    }
    
}
