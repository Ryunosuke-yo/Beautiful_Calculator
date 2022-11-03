//
//  Beautiful_CalculatorApp.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-10-26.
//

import SwiftUI

@main
struct Beautiful_CalculatorApp: App {
    @EnvironmentObject var colorView: ColorView
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ColorView())

                
        }
    }
}
