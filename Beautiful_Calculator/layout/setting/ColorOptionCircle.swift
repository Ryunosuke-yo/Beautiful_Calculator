//
//  ColorOptionCircle.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-10-31.
//

import SwiftUI

struct BgColorOptionCircle: View {
    let fillColor:Color
    let leftShadowColor: Color
    let rightShadowColor: Color
    let changeColor : ((Color)-> Void)
    let changeShadowColor: ((Color, Color)-> Void)
    
    var body: some View {
        
        Button{
            changeColor(fillColor)
            changeShadowColor(leftShadowColor, rightShadowColor)
          
        } label: {
            Circle()
                .colorOptionStyle(fillColor: fillColor)
        }
        
    }
}


