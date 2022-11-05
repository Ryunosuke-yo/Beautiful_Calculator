//
//  AppEntry.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-11-03.
//

import SwiftUI

struct AppEntry: View {
    @EnvironmentObject private var themeState: ThemeViewModel
    
    
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
            SimpleLayout()
        } else if themeState.isGlass {
            GlassLayout()
        } else {
            SoftLayout()
        }
        
    }}

struct AppEntry_Previews: PreviewProvider {
    static var previews: some View {
        AppEntry()
    }
}
