//
//  ConditionalShadow.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-11-05.
//

import Foundation
import SwiftUI


struct ConditionalShadowForSoft: ViewModifier {
    var bgColor: Color
    var currentRightShadow: Color
    var currentLeftShadow: Color
    
    
    func body(content: Content) -> some View {
        if(bgColor == .myWhite) {
            return content
                .shadow(color: currentRightShadow.opacity(0.3), radius: 5, x:5, y: 5)
                .shadow(color: currentLeftShadow.opacity(0.5), radius: 5, x:-5, y: -5)
        } else {
            return content
                .shadow(color: currentRightShadow.opacity(0.4), radius: 6, x:5, y: 5)
                .shadow(color: currentLeftShadow.opacity(0.25), radius: 4, x:-6, y: -4)
                
        }
    }
}
