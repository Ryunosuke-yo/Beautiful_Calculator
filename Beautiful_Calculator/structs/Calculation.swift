//
//  Calculation.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-11-08.
//

import Foundation

class Calculation: ObservableObject {
    @Published var firstValue: String? = nil
    @Published var secondValue: String? = nil
    @Published var answer: String?  = nil
    @Published var calculationState: CalculationState = .initialized
    var disableSigns = false
   
    
    
    func pressedBtns(value: CalcBtn) {
        switch value {
        case .plus:
           
            pressedPlus()
            disableSigns = true
        case .minus:
           
            pressedMinus()
            disableSigns = true
        case .multiply:
         
            pressedMultiply()
            disableSigns = true
        case .divide:
          
            pressedDivide()
            disableSigns = true
        case .ac:
         
            resetToZero()
            disableSigns = false
        case .equal:
            if firstValue == nil || secondValue == nil {
                return
            }
            disableSigns = false
            calculate(calculationState)
           
        case .coma:
           
            pressedComa(value: value)
        case .negative:
          
            pressedNegative()
        case .percent:
            pressedPercent()
        default:
            disableSigns = false
            appendNumToNumberValue(value: value)
        }
        
    }
    
    func appendNumToNumberValue(value: CalcBtn) {
      
        if firstValue == nil && secondValue == nil && answer != nil {
            answer = nil
        }
       
        if  answer != nil &&  answer!.count >= 10 {
            return;
        }
        
        if answer != nil && answer!.first! == "0" && !answer!.contains(".") {
            firstValue?.removeFirst()
            answer?.removeFirst()
        }
        
        
        if answer == nil {
            firstValue = value.rawValue
            answer = value.rawValue
            return
        }
        
        
        firstValue! += value.rawValue
        answer! += value.rawValue
        
        if firstValue == "00" {
            firstValue = "0"
            answer = "0"
           
        }
        
        
    }
    
    func pressedComa(value: CalcBtn) {
        if firstValue == "0" {
            return
        }
        
        if firstValue == nil && answer != nil {
            
            if answer!.contains(".") {
                return
            }
            
//            when pressing comma after calculated
            
//            answer? += value.rawValue
            
            return
        }
        
        if firstValue!.contains(".") {
            return
        }
        
        firstValue! += value.rawValue
        answer = firstValue
        
    }
    
    func pressedNegative() {
        
        if firstValue == "0"{
            return
        }
        
        if firstValue == nil && answer != nil {
            if answer!.contains("-") {
                let deleted = answer!.replacingOccurrences(of:"-", with:"")
                answer = deleted
                return
            }
            
            answer = "-\(answer!)"
           
            return
        }
        
        if firstValue!.contains("-") {
            let deleted = firstValue!.replacingOccurrences(of:"-", with:"")
            firstValue = deleted
        } else {
            firstValue = "-\(firstValue!)"
        }
        
        answer = firstValue
    }
    
    
   
    
    func pressedPercent() {
        if firstValue == "0"{
            return
        }
        
        if firstValue == nil && answer != nil {
            let answerNum = Double(answer!) ?? 0
            let answerPer = answerNum / 100
            answer = "\(answerPer)"
            
            return
        }
        
        let firstNum = Double(firstValue!) ?? 0
        let firNumPer = firstNum / 100
      
        
        firstValue = "\(firNumPer)"
        answer = firstValue
    }
    
    
    func pressedPlus() {
       handleContinuousCalculation()
        calculationState = .addtion
        firstValue = nil
        answer = nil
        
    }
    
    
    
    func pressedMinus() {
       handleContinuousCalculation()
        calculationState = .subtraction
        firstValue = nil
        answer = nil
    }
    
    func pressedMultiply() {
        handleContinuousCalculation()
        calculationState = .multiplication
        firstValue = nil
        answer = nil
    }
    
    func pressedDivide() {
        handleContinuousCalculation()
       
        calculationState = .division
        firstValue = nil
        answer = nil
    }
    
   
    
    func resetToZero() {
        firstValue = nil
        secondValue = nil
        answer = nil
    }
    
    
    func handleContinuousCalculation() {
        if disableSigns {
            return
        }
        
        if firstValue != nil && secondValue != nil  {
            storePrevCalcResult()
            let secondNum = Double(secondValue!) ?? 0
            secondValue = handleDecimal(secondNum)
            
        }  else if firstValue == nil && secondValue == nil && answer != nil {
            secondValue = answer
            answer = nil
            
        } else {
            secondValue = firstValue
        }
    }
    
    
    
    // func to do calculation
    func calculate(_ currentState: CalculationState) {
        
        let firstNum = Double(firstValue!) ?? 0
        let secondNum = Double(secondValue!) ?? 0
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
        firstValue = nil
        secondValue = nil
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
        let firstNum = Double(firstValue!) ?? 0
        let secondNum = Double(secondValue!) ?? 0
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
