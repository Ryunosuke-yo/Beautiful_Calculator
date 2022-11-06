//
//  OptionCircleStyle.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-11-05.
//

import Foundation
import SwiftUI


extension Circle {
    func colorOptionStyle(fillColor: Color) -> some View {
        self
            .fill(fillColor.shadow(.drop(color: Color.shadowGray.opacity(0.3), radius: 5, x: 3, y: 3)))
            .frame(width: 45, height: 45)
    }
}
