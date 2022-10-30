//
//  WdithAndHeight.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-10-27.
//

import Foundation
import UIKit


struct WidthAndHeight {
    
    static let dividerWidth = UIScreen.main.bounds.width - 65
    
    static func btnWidth(_ btnValue: CalcBtn)-> CGFloat {
        let btn = UIScreen.main.bounds.width / 5
        return btnValue == .zero ? btn * 2 : btn
    }
    
    static func btnHeight()-> CGFloat {
        UIScreen.main.bounds.height / 8
    }
    
    
}
