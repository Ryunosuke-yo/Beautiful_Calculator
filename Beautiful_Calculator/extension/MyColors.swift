//
//  MyColors.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-10-31.
//

import Foundation
import SwiftUI



extension Color {
    static let myBlack = Color("My_black")
    static let myRed = Color("My_red")
    static let myGreen = Color("My_green")
    static let myPurple = Color("My_purple")
    static let whiteGray = Color("White_gray")
    static let shadowGray = Color("Shadow_gray")
    static let myWhite = Color("My_white")
    static let glassBgWhite = Color("Glass_bg_white")
    
    
    static let myWhite_leftShadow = Color(.white)
    static let myWhite_rightShadow = Color(.black)
    static let myBlack_rightShadow = Color(.black)
    static let myBlack_leftShadow = Color("My_black_shadow_left")
    static let myRed_leftShadow = Color("My_red_shadow_left")
    static let myGreen_leftShadow = Color("My_green_shadow_left")
    static let myPurple_leftShadow = Color("My_purple_shadow_left")
    
    var getNameString: String? {
        switch self {
        case .myBlack: return ColorName.myBlack.rawValue
        case .myRed: return ColorName.myRed.rawValue
        case .myPurple: return ColorName.myPurple.rawValue
        case .whiteGray: return ColorName.whiteGray.rawValue
        case .myWhite: return ColorName.myWhite.rawValue
        case .glassBgWhite: return ColorName.glassBgWhite.rawValue
        default: return nil
        }
    }
    
    static func getColorValue(colorString: String)-> Color {
        switch colorString {
        case ColorName.myBlack.rawValue: return .myBlack
        case ColorName.myRed.rawValue: return .myRed
        case ColorName.myGreen.rawValue : return .myGreen
        case ColorName.myPurple.rawValue: return .myPurple
        case ColorName.whiteGray.rawValue: return .whiteGray
        case ColorName.myWhite.rawValue: return .myWhite
        case ColorName.glassBgWhite.rawValue: return .glassBgWhite
        default: return .myBlack
        }
    }

}


