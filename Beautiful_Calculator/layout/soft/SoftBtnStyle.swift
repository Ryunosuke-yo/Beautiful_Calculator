//
//  SoftBtnStyle.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-11-04.
//

import SwiftUI


struct SoftBtnStyle: ButtonStyle {
    @EnvironmentObject private var colorView: ColorView
    @EnvironmentObject private var shadowViewModel: ShadowViewModel
    let isRectangle: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(
                Group {
                    if configuration.isPressed {
                        if isRectangle {
                            Rectangle()
                                .fill(colorView.cuurentBgColor)
                                .cornerRadius(30)
                        } else {
                            Circle()
                                .fill(colorView.cuurentBgColor)
                        }
                        
                    } else {
                        if isRectangle {
                            Rectangle()
                                .fill(colorView.cuurentBgColor)
                                .cornerRadius(30)
                                .conditinalShadow(bgColor: colorView.cuurentBgColor, currentRightShadow: shadowViewModel.currentRightShadow, currentLeftShadow: shadowViewModel.currentLeftShadow)

                            
                        } else {
                                Circle()
                                    .fill(colorView.cuurentBgColor)
                                    .conditinalShadow(bgColor: colorView.cuurentBgColor, currentRightShadow: shadowViewModel.currentRightShadow, currentLeftShadow: shadowViewModel.currentLeftShadow)
                            
                        }
                        
                        
                        
                    }
                    
                }
            )
        
    }
}


extension View {
    func conditinalShadow(bgColor: Color, currentRightShadow: Color, currentLeftShadow: Color) -> some View {
        modifier(ConditionalShadowForSoft(bgColor:bgColor, currentRightShadow: currentRightShadow, currentLeftShadow: currentLeftShadow))
    }
}


