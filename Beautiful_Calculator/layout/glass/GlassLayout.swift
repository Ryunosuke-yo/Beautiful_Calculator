//
//  GlassLayout.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-11-03.
//

import SwiftUI

struct GlassLayout: View {
    @Binding var showSetting: Bool
    
    var body: some View {
        Text("glass")
    }
}

struct GlassLayout_Previews: PreviewProvider {
    @State static var showSetting = false
    static var previews: some View {
        GlassLayout(showSetting: $showSetting)
    }
}
