//
//  CalnUtils.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-11-03.
//

import Foundation
import UIKit


struct CalcUltils{
    
    static let buttons: [[CalcBtn]] = [
        [.ac, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .theree, .plus],
        [.zero, .dot, .equal]
    ]
    
    static let dividerWidth = UIScreen.main.bounds.width - 65
    
    static let scrrenWidth = UIScreen.main.bounds.width
    
    static func btnWidth(_ btnValue: CalcBtn)-> CGFloat {
        let btn = UIScreen.main.bounds.width / 5
        return btnValue == .zero ? btn * 2 : btn
    }
    
    static func btnHeight()-> CGFloat {
        UIScreen.main.bounds.height / 8
    }
    
    
}
