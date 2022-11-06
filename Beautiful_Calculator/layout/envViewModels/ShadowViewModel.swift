//
//  ShadowViewModel.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-11-05.
//

import Foundation
import SwiftUI

class ShadowViewModel: ObservableObject {
    @Published var currentLeftShadow: Color = .myBlack_leftShadow
    @Published var currentRightShadow: Color = .myBlack_rightShadow
    
    func changeShadowColor(leftShadow:Color, rightShadow:Color) {
        currentLeftShadow = leftShadow
        currentRightShadow = rightShadow
    }
}
