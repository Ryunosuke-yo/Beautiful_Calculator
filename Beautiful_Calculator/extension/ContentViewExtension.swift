//
//  ContentViewExtension.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-11-05.
//

import Foundation


extension AppEntry {
    @MainActor class ViewModel: ObservableObject {
        @Published var showSetting = false
    }
}
