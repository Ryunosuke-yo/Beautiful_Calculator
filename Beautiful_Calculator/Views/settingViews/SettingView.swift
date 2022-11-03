//
//  SettingView.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-10-30.
//  
//

import SwiftUI

struct SettingView: View {
    @Binding var showSetting: Bool
    @EnvironmentObject private var colorView: ColorView
    
    let colorOptions:[Color] = [.white, .myBlack, .myRed, .myGreen, .myPurple]
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.whiteGray.ignoresSafeArea()
                Button {
                    showSetting = false
                } label: {
                    Image(systemName: "xmark")
                    
                }
                
                .position(x: 360, y: 30)
                .foregroundColor(.myBlack)
                
                VStack(spacing: 0){
                    
                    Spacer()
                    
                    VStack(spacing : 15){
                        HStack{
                            Text("Calculator color")
                                .foregroundColor(.black)
                                .font(.custom("Jost-Regular", size: 19))
                                .tracking(2)
                            Spacer()
                        }
                        .padding([.leading], 30)
                        
                        HStack(spacing: 20) {
                            ForEach(colorOptions, id: \.self ){ color in
                                ColorOptionCircle(fillColor: color, changeColor: colorView.changeBgColor)
                            }
                            
                        }
                    }
                    
                    Spacer()
                    
                    VStack(spacing:15) {
                        HStack{
                            Text("Text color")
                                .foregroundColor(.black)
                                .font(.custom("Jost-Regular", size: 19))
                                .tracking(2)
                            Spacer()
                        }
                        .padding([.leading], 30)
                        
                        HStack(spacing: 20) {
                            ForEach(colorOptions, id: \.self ){ color in
                                ColorOptionCircle(fillColor: color, changeColor: colorView.changeTextColor)
                            }
                        }
                    }
                    
                    
                    Spacer()
                    
                    NavigationLink(destination: ThemeOptionView()) {
                        HStack {
                            Text("Select theme")
                                .foregroundColor(.black)
                                .font(.custom("Jost-Regular", size: 19))
                                .tracking(2)
                            Spacer()
                            Text("Soft")
                                .foregroundColor(.gray)
                                .font(.custom("Jost-Regular", size: 19))
                                .tracking(2)
                            Image(systemName: "chevron.forward")
                                .foregroundColor(.gray)
                        }
                        .padding([.leading, .trailing], 30)
                    }
                    Spacer()
                }
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
}

