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
    @Published var answer: String?  = nil
    @Published var calculationState: CalculationState = .initialized
    var disableSigns = false
    var disableEqual = false
    
    
    
    func pressedBtns(value: CalcBtn) {
        switch value {
        case .plus:
            disableEqual = false
            pressedPlus()
            disableSigns = true
        case .minus:
            disableEqual = false
            pressedMinus()
            disableSigns = true
        case .multiply:
            disableEqual = false
            pressedMultiply()
            disableSigns = true
        case .divide:
            disableEqual = false
            pressedDivide()
            disableSigns = true
        case .ac:
            disableEqual = false
            resetToZero()
            disableSigns = false
        case .equal:
            disableSigns = false
            calculate(calculationState)
            disableEqual = true
        case .coma:
            disableEqual = false
            pressedComa(value: value)
        case .negative:
            pressedNegative()
        default:
            disableSigns = false
            disableEqual = false
            appendNumToNumberValue(value: value)
        }
        
    }
    
    func appendNumToNumberValue(value: CalcBtn) {
        if  answer != nil &&  answer!.count >= 10 {
            return;
        }
        
        if answer == nil {
            firstValue = value.rawValue
            answer = value.rawValue
            return
        }
        
        
        firstValue += value.rawValue
        answer! += value.rawValue
        
        
    }
    
    func pressedComa(value: CalcBtn) {
        if firstValue == "0" {
            firstValue = "0"
        }
        
        if firstValue.contains(".") {
            return
        }
        
        firstValue += value.rawValue
        answer = firstValue
        
    }
    
    func pressedNegative() {
        
        if firstValue == "0" {
            return
        }
        
        if firstValue.contains("-") {
            let deleted = firstValue.replacingOccurrences(of:"-", with:"")
            firstValue = deleted
        } else {
            firstValue = "-\(firstValue)"
        }
        
        answer = firstValue
        
    }
    
    func pressedPlus() {
        if disableSigns {
            return
        }
        
        
        if firstValue != "0" && secondValue != "0" {
            storePrevCalcResult()
            let secondNum = Double(secondValue) ?? 0
            secondValue = handleDecimal(secondNum)
        } else {
            secondValue = firstValue
            
        }
        calculationState = .addtion
        firstValue = "0"
        answer = nil
        
    }
    
    
    
    func pressedMinus() {
        if disableSigns {
            return
        }
        
        if firstValue != "0" && secondValue != "0"  {
            storePrevCalcResult()
            let secondNum = Double(secondValue) ?? 0
            secondValue = handleDecimal(secondNum)
        }  else {
            secondValue = firstValue
        }
        calculationState = .subtraction
        firstValue = "0"
        answer = nil
    }
    
    func pressedMultiply() {
        if disableSigns {
            return
        }
        
        if firstValue != "0" && secondValue != "0"  {
            storePrevCalcResult()
            let secondNum = Double(secondValue) ?? 0
            secondValue = handleDecimal(secondNum)
        }  else {
            secondValue = firstValue
        }
        calculationState = .multiplication
        firstValue = "0"
        answer = nil
    }
    
    func pressedDivide() {
        if disableSigns {
            return
        }
        
        if firstValue != "0" && secondValue != "0"  {
            storePrevCalcResult()
            let secondNum = Double(secondValue) ?? 0
            secondValue = handleDecimal(secondNum)
            
        }  else {
            secondValue = firstValue
        }
        calculationState = .division
        firstValue = "0"
        answer = nil
    }
    
    
    func resetToZero() {
        firstValue = "0"
        secondValue = "0"
        answer = nil
    }
    
    
    
    
    // func to do calculation
    func calculate(_ currentState: CalculationState) {
        if disableEqual {
            return
        }
        let firstNum = Double(firstValue) ?? 0
        let secondNum = Double(secondValue) ?? 0
        var answerNum: Double = 0
        switch currentState {
        case .addtion:
            answerNum =  secondNum + firstNum
        case .subtraction:
            answerNum =  secondNum - firstNum
        case .division:
            answerNum =  secondNum / firstNum
        case .multiplication:
            answerNum =   secondNum * firstNum
        default :
            break
            
        }
        firstValue = "0"
        secondValue = "0"
        answer = handleDecimal(answerNum)
    
    }
    
    func handleDecimal (_ num: Double) -> String {
        let decimal = num.truncatingRemainder(dividingBy: 1)
        
        if abs(decimal.truncatingRemainder(dividingBy: 1)).isLess(than: .ulpOfOne) {
            return String(Int(num))
        } else {
            return  String(num)
        }
    }
    
    func storePrevCalcResult () {
        let firstNum = Double(firstValue) ?? 0
        let secondNum = Double(secondValue) ?? 0
        switch calculationState {
        case .addtion :
            secondValue = String(secondNum + firstNum)
        case .subtraction:
            secondValue = String(secondNum - firstNum)
        case .multiplication :
            secondValue = String(secondNum * firstNum)
        case .division :
            secondValue = String(secondNum / firstNum)
        case .initialized:
            print("ini")
        }
    }
}
