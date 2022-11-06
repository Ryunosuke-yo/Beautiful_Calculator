//
//  TextColorOptionCircle.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-11-05.
//

import Foundation
import SwiftUI


struct TextColorOptionCircle: View {
    let fillColor:Color
    let changeColor : ((Color)-> Void)
   
    
    var body: some View {
        
        Button{
            changeColor(fillColor)
          
        } label: {
            Circle()
                .colorOptionStyle(fillColor: fillColor)
        }
        
    }
}
