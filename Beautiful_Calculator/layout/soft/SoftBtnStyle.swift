//
//  SoftBtnStyle.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-11-04.
//

import SwiftUI

struct SoftBtnStyle: ButtonStyle {
    @EnvironmentObject private var colorView: ColorView
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
                                .shadow(color: .black.opacity(0.2), radius: 8, x:8, y: 8)
                                .shadow(color: .white.opacity(0.7), radius: 6, x:-3, y: -3)
                            
                        } else {
                                Circle()
                                    .fill(colorView.cuurentBgColor)
                                    .shadow(color: .black.opacity(0.2), radius: 8, x:8, y: 8)
                                    .shadow(color: .white.opacity(0.7), radius: 6, x:-3, y: -3)
                            }
                        
                        
                        
                    }
                    
                }
            )
        
    }
}
