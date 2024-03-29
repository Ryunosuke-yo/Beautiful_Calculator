//
//  AppEntry.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-11-03.
//

import SwiftUI

struct AppEntry: View {
    @EnvironmentObject private var themeState: ThemeViewModel
    @EnvironmentObject private var colorState : ColorView
    @EnvironmentObject private var shadowState : ShadowViewModel
    @Environment(\.scenePhase) var phase
    @AppStorage("currentTheme") private var theme = "None"
    @AppStorage("currentTextColor") private var textColor = "None"
    @AppStorage("currentThemeColor") private var themeColor = "None"
    
    var body: some View {
       LayoutView()
            .onAppear {
                print(colorState.currentTextColor.description)
                changeThemOnStorage()
            }
            .onChange(of: phase) {
                newPhase in
                
                if newPhase == .inactive || newPhase == .background {
                    theme = getCurrentThemeString()
                    textColor = getCurrentTextColor()
                    themeColor = getCurrentThemeColor()
                }
            }
    }
    
    
    func getCurrentThemeString()-> String {
        if themeState.isGlass {
            return Themes.glass.rawValue
        } else if themeState.isSoft {
            return Themes.soft.rawValue
        }
        
        return Themes.simple.rawValue
    }
    
    func getCurrentTextColor()-> String {
        return colorState.currentTextColor.getNameString ?? "None"
    }
    
    func getCurrentThemeColor()-> String {
        return colorState.cuurentBgColor.getNameString ?? "None"
    }
    
    func changeThemOnStorage()-> Void {
        applyShadowColor()
        switch theme {
        case Themes.glass.rawValue:
            themeState.setIsGlass()
        case Themes.soft.rawValue:
            themeState.setIsSoft()
        case Themes.simple.rawValue:
            themeState.setIsSimple()
        default:
            break
            
        }
        
        if textColor != "None" {
            colorState.changeTextColor(Color.getColorValue(colorString: textColor))
        }
        
        if themeColor != "None" {
            colorState.changeBgColor(Color.getColorValue(colorString: themeColor))
        }
        
    }
    
    func applyShadowColor() {
        switch themeColor {
        case Color.myBlack.getNameString :
            shadowState.changeShadowColor(leftShadow: .myBlack_leftShadow, rightShadow: .myBlack_rightShadow)
        case Color.myWhite.getNameString:
            shadowState.changeShadowColor(leftShadow: .myWhite_leftShadow, rightShadow: .myWhite_rightShadow)
        case Color.myRed.getNameString:
            shadowState.changeShadowColor(leftShadow: .myRed_leftShadow, rightShadow: .myBlack_rightShadow)
        case Color.myPurple.getNameString:
            shadowState.changeShadowColor(leftShadow: .myPurple_leftShadow, rightShadow: .myBlack_rightShadow)
        case Color.myGreen.getNameString:
            shadowState.changeShadowColor(leftShadow: .myGreen_leftShadow, rightShadow: .myBlack_rightShadow)
        default: break
        }
    }
}


struct LayoutView: View {
    @EnvironmentObject private var themeState: ThemeViewModel
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        if themeState.isSimple {
            SimpleLayout(showSetting: $viewModel.showSetting)
        } else if themeState.isGlass {
            GlassLayout(showSetting: $viewModel.showSetting)
        } else {
            SoftLayout(showSetting: $viewModel.showSetting)
        }
    }
}




struct AppEntry_Previews: PreviewProvider {
    static var previews: some View {
        AppEntry()
    }
}
