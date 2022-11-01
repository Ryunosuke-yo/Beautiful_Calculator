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
    
    let colorOptions = [Color.white, MyColors.myBlack, MyColors.myRed, MyColors.myGreen, MyColors.myPurple]
    
    
    var body: some View {
        NavigationView {
            ZStack {
                MyColors.whiteGray.ignoresSafeArea()
                Button {
                    showSetting = false
                } label: {
                    Image(systemName: "xmark")
                    
                }
                
                .position(x: 360, y: 30)
                .foregroundColor(MyColors.myBlack)
                
                VStack{
                    Spacer()
                    VStack(spacing: 5){
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
                                ColorOptionCircle(fillColor: color)
                            }
                            
                        }
                        
                        
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
                                ColorOptionCircle(fillColor: color)
                            }
                        }
                        
                        
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
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            
            
        }
        
    }
}

