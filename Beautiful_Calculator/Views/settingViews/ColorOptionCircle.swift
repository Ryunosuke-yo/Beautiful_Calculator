//
//  ColorOptionCircle.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-10-31.
//

import SwiftUI

struct ColorOptionCircle: View {
   
    
    let fillColor: Color
    
    var body: some View {
        
        Button{
            
        } label: {
            Circle()
                .fill(fillColor.shadow(.drop(color: MyColors.shadowGray.opacity(0.3), radius: 5, x: 3, y: 3)))
                .frame(width: 45, height: 45)
        }
        
    }
}


