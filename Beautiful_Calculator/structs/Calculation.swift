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

    
    
    func pressedBtns(value: CalcBtn) {
        switch value {
        case .plus:
            pressedPlus()
        case .minus:
            pressedMinus()
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
    }
    
    func pressedPlus() {
        
        
        if firstValue != "0" && secondValue != "0" {
            storePrevCalcResult()
            answer = secondValue
        } else {
            secondValue = firstValue
            
        }
        calculationState = .addtion
        firstValue = "0"
        answer = nil
        
    }
    
    func pressedMinus() {
        
        if firstValue != "0" && secondValue != "0"  {
            storePrevCalcResult()
            answer = secondValue
        }  else {
            secondValue = firstValue
        }
        calculationState = .subtraction
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
        let firstNum = Double(firstValue) ?? 0
        let secondNum = Double(secondValue) ?? 0
        var answerNum: Double = 0
        switch currentState {
        case .addtion:
            answerNum =  secondNum + firstNum
        case .subtraction:
            answerNum =  secondNum - firstNum
        case .division:
            answerNum =  secondNum - firstNum
        case .multiplication:
            answerNum =   secondNum * firstNum
        default :
            break
            
        }
        firstValue = "0"
        secondValue = "0"
        
        
        let decimal = secondNum.truncatingRemainder(dividingBy: 1)
        
        if abs(decimal.truncatingRemainder(dividingBy: 1)).isLess(than: .ulpOfOne) {
            answer = String(Int(answerNum))
            print("nasi")
        } else {
            answer = String(answerNum)
            print("ari")
        }
    }
    
    func storePrevCalcResult () {
        let firstNum = Double(firstValue) ?? 0
        let secondNum = Double(secondValue) ?? 0
        switch calculationState {
        case .addtion :
            secondValue = String(secondNum + firstNum)
        case .multiplication :
            secondValue = String(secondNum / firstNum)
        case .division :
            secondValue = String(secondNum * firstNum)
        case .initialized:
            print("ini")
        case .subtraction:
            secondValue = String(secondNum - firstNum)
        }
    }
}
