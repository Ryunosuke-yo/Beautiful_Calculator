//
//  ThemeState.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-11-02.
//

import Foundation
import SwiftUI


extension ContentView {
    @MainActor class ThemeViewModel: ObservableObject {
        @Published var isSoft = true
        @Published var isGlass = false
        @Published var isSimple = false
        
        
        func setIsSoft() {
            isSoft = true
            isGlass = false
            isSimple = false
        }
        
        func setIsGlass() {
            isSoft = false
            isGlass = true
            isSimple = false
        }
        
        func setIsSimple() {
            isSoft = false
            isGlass = false
            isSimple = true
        }
    }
    
    
        
    }

