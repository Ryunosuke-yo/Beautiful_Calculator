//
//  BgColorView.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-11-02.
//

import Foundation
import SwiftUI

class ColorView: ObservableObject {
    @Published var cuurentBgColor: Color = .black
    @Published var currentTextColor: Color = .white
    
    func changeBgColor(_ color: Color) {
        cuurentBgColor = color
    }
    
    func changeTextColor(_ color:Color) {
        currentTextColor = color
    }
}
