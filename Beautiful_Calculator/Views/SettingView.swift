//
//  SettingView.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-10-30.
//

import SwiftUI

struct SettingView: View {
        @Binding var showSetting: Bool
    
    
    var body: some View {
        VStack {
            Button {
                showSetting = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .position(x: 360, y: 30)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray)
    }
}

