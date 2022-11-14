//
//  Calculation.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-11-08.
//

import Foundation

class Calculation: ObservableObject {
    @Published var firstValue: String = "0"
    @Published var secondValue: String = "0"
    @Published var calculationState: CalculationState = .initialized
    
    
    func pressedBtns(value: CalcBtn) {
        switch value {
        case .plus:
            pressedPlus()
        case .minus:
            print("minus")
        case .multiply:
            print("multiply")
        case .divide:
            print("divide")
        case .ac:
            resetToZero()
        case .equal:
            calculate(calculationState)
        case .coma:
           pressedComa(value: value)
        default:
            appendNumToNumberValue(value: value)
        }
        
    }
    
    func appendNumToNumberValue(value: CalcBtn) {
        if firstValue.count >= 10 {
            return;
        }
        
        if firstValue == "0" {
            firstValue = value.rawValue
            return
        }
        
        
        firstValue += value.rawValue
        
    }
    
    func pressedComa(value: CalcBtn) {
        if firstValue == "0" {
            firstValue = "0"
        }
        
        if firstValue.contains(".") {
            return
        }
        firstValue += value.rawValue
    }
    
    func pressedPlus() {
        calculationState = .addtion
        secondValue = firstValue
        firstValue = "0"
        
    }
    
    
    func resetToZero() {
        firstValue = "0"
        secondValue = "0"
    }
    
    
    
    
    // func to do calculation
    func calculate(_ currentState: CalculationState) {
        let firstNum = Double(firstValue) ?? 0
        var secondNum = Double(secondValue) ?? 0
        switch currentState {
        case .addtion:
            secondNum =  firstNum + secondNum
        case .subtraction:
            secondNum =  firstNum - secondNum
        case .division:
            secondNum =  firstNum / secondNum
        case .multiplication:
            secondNum =  firstNum * secondNum
        default :
            break
            
        }
        firstValue = "0"
     
        
        let decimal = secondNum.truncatingRemainder(dividingBy: 1)
        
        if abs(decimal.truncatingRemainder(dividingBy: 1)).isLess(than: .ulpOfOne) {
            secondValue = String(Int(secondNum))
            print("nasi")
        } else {
            secondValue = String(secondNum)
            print("ari")
        }
    }
}
