//
//  BgColorView.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-11-02.
//

import Foundation
import SwiftUI

class ColorView: ObservableObject {
    @Published var cuurentBgColor: Color = .myBlack
    @Published var currentTextColor: Color = .myWhite
  
    
    func changeBgColor(_ color: Color) {
        cuurentBgColor = color
    }
    
    func changeTextColor(_ color:Color) {
        currentTextColor = color
    }
    
   
}
