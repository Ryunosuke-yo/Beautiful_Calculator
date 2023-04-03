//
//  SettingView.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-10-30.
//  
//

import SwiftUI

struct SettingView: View {
    @Binding var showSetting: Bool
    @EnvironmentObject private var colorView: ColorView
    @EnvironmentObject private var shadowViewModel: ShadowViewModel
    @EnvironmentObject private var themeViewModel: ThemeViewModel
  
    
    func getSelectedThemeString()-> String {
        if themeViewModel.isGlass {
            return Themes.glass.rawValue
        }
        
        if themeViewModel.isSimple {
            return Themes.simple.rawValue
        }
        
        return Themes.soft.rawValue
    }
    
    let colorOptions:[[Color]] = [
        [.myWhite, .myWhite_leftShadow, .myWhite_rightShadow],
        [.myBlack, .myBlack_leftShadow, .myBlack_rightShadow],
        [.myRed, .myRed_leftShadow, .myBlack_rightShadow],
        [.myPurple, .myPurple_leftShadow, .myBlack_rightShadow],
        [.myGreen, .myGreen_leftShadow, .myBlack_rightShadow],
    ]
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.whiteGray.ignoresSafeArea()
                Button {
                    showSetting = false
                } label: {
                    Image(systemName: "xmark")
                    
                }
                
                .position(x: 360, y: 30)
                .foregroundColor(.myBlack)
                
                VStack(spacing: 0){
                    
                    Spacer()
                    
                    VStack(spacing : 15){
                        HStack{
                            Text("Calculator color")
                                .foregroundColor(.black)
                                .font(.custom("Jost-Regular", size: 19))
                                .tracking(2)
                            Spacer()
                        }
                        .padding([.leading], 30)
                        
                        HStack(spacing: 20) {
                            ForEach(colorOptions, id: \.self ){ color in
                                BgColorOptionCircle(fillColor: color[0], leftShadowColor: color[1],  rightShadowColor: color[2], changeColor: colorView.changeBgColor, changeShadowColor: shadowViewModel.changeShadowColor)
                            }
                            
                        }
                    }
                    
                    Spacer()
                    
                    VStack(spacing:15) {
                        HStack{
                            Text("Text color")
                                .foregroundColor(.black)
                                .font(.custom("Jost-Regular", size: 19))
                                .tracking(2)
                            Spacer()
                        }
                        .padding([.leading], 30)
                        
                        HStack(spacing: 20) {
                            ForEach(colorOptions, id: \.self ){ color in
                                TextColorOptionCircle(fillColor: color[0], changeColor: colorView.changeTextColor)
                            }
                        }
                    }
                    
                    
                    Spacer()
                    
                    NavigationLink(destination: ThemeOptionView())
                    {
                        HStack {
                            Text("Select theme")
                                .foregroundColor(.black)
                                .font(.custom("Jost-Regular", size: 19))
                                .tracking(2)
                            Spacer()
                            Text(getSelectedThemeString())
                                .foregroundColor(.gray)
                                .font(.custom("Jost-Regular", size: 19))
                                .tracking(2)
                            Image(systemName: "chevron.forward")
                                .foregroundColor(.gray)
                        }
                        .padding([.leading, .trailing], 30)
                        
                        
                    }
                    Spacer()
                }
                
                
            }
        
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .accentColor(.myBlack)
        
    }
        
    
}

