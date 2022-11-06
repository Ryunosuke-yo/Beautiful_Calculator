//
//  AppEntry.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-11-03.
//

import SwiftUI

struct AppEntry: View {
    @EnvironmentObject private var themeState: ThemeViewModel
    @StateObject private var viewModel = ViewModel()
    
    
    //    init(){
    //        for family in UIFont.familyNames {
    //             print(family)
    //
    //             for names in UIFont.fontNames(forFamilyName: family){
    //             print("== \(names)")
    //             }
    //        }
    //    }
        
        
    
    var body: some View {
        if themeState.isSimple {
            SimpleLayout(showSetting: $viewModel.showSetting)
        } else if themeState.isGlass {
            GlassLayout(showSetting: $viewModel.showSetting)
        } else {
            SoftLayout(showSetting: $viewModel.showSetting)
        }
        
    }}

struct AppEntry_Previews: PreviewProvider {
    static var previews: some View {
        AppEntry()
    }
}
