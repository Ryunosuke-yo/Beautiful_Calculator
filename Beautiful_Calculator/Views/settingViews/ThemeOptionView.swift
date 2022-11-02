//
//  ThemeOptionView.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-11-01.
//

import SwiftUI

struct ThemeOptionView: View {
    @State var isOn = false
    @StateObject private var themeViewModel = ContentView.ThemeViewModel()
    
    
    let themesArray:[Themes] = [.soft, .glass, .simple]
    
    var body: some View {
        ZStack {
            Color.whiteGray.ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                ForEach(themesArray, id: \.self) {
                    theme in
                    
                    VStack(spacing: 10) {
                        HStack {
                            Text(theme.rawValue)
                                .font(.custom("Jost-Regular", size: 19))
                                .tracking(2)
                            Spacer()
                            
                            
                           showChechMark(theme)
                        }
                        .onTapGesture {
                            if theme == Themes.soft {
                                themeViewModel.setIsSoft()
                            } else if theme == Themes.glass {
                                themeViewModel.setIsGlass()
                            } else if theme == Themes.simple {
                                themeViewModel.setIsSimple()
                            }
                            
                        }
                        
                        Rectangle()
                            .fill(.gray)
                            .frame(width: WidthAndHeight.dividerWidth, height: 1)
                            .padding(.vertical, 3)
                    }
                    .padding([.trailing, .leading], 40)
                }
            
                
                Spacer()
            }
            .padding([.top], 20)
          
        }
        
    }
    
    func showChechMark(_ theme: Themes) -> Image? {
        if theme == Themes.soft {
             return themeViewModel.isSoft ? Image(systemName: "checkmark") : nil
        } else if theme == Themes.glass {
            return themeViewModel.isGlass ? Image(systemName: "checkmark") : nil
        } else if theme == Themes.simple {
             return themeViewModel.isSimple ? Image(systemName: "checkmark") : nil
        }
        return nil
    }
    
    
    
}


