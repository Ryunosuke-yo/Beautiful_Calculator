//
//  ContentView.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-10-26.
//

import SwiftUI

struct ContentView: View {
   
    
    var body: some View {
        AppEntry()
            .environmentObject(ThemeViewModel())
            .environmentObject(ColorView())
            .environmentObject(ShadowViewModel())
            .environmentObject(Calculation())
        
    }
       
}


    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ColorView())
            .environmentObject(ThemeViewModel())
    }
}
