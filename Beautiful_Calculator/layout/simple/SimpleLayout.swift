//
//  SimpleLayout.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-11-03.
//

import SwiftUI

struct SimpleLayout: View {
    @Binding var showSetting: Bool
    @EnvironmentObject private var colorView: ColorView
    @EnvironmentObject private var calculation: Calculation

    let buttons = CalcUltils.buttons
   
    let bthHeight = UIScreen.main.bounds.height / 8
    let dividerWidth = UIScreen.main.bounds.width - 65
    
    var body: some View {
        ZStack {
        colorView.cuurentBgColor.ignoresSafeArea()
            VStack(spacing: 2) {
                Spacer()
                VStack {
                    Button {
                        showSetting.toggle()
                    } label: {
                        Image(systemName: "gearshape.fill")
                    }
                    .foregroundColor(colorView.currentTextColor)
                    .font(.system(size: 15))
                    .position(x:25, y:30)
                    .sheet(isPresented: $showSetting) {
                        SettingView(showSetting: $showSetting)
                            .presentationDetents([.fraction(0.5)])
                    }
                    HStack {
                        Spacer()
                        Text(calculation.answer != nil ? calculation.answer! : calculation.secondValue != nil ? calculation.secondValue! : "0")
                            .foregroundColor(colorView.currentTextColor)
                            .font(.custom("Jost-Regular", size: 65))
                            .lineLimit(1)
                            .minimumScaleFactor(0.4)
                    }
                }
                .padding(.horizontal, 25)
                
                
                
                Rectangle()
                    .fill(colorView.currentTextColor)
                    .frame(width: dividerWidth, height: 1)
                    .opacity(0.8)
                    .padding(.vertical, 10)
                
                ForEach(buttons, id: \.self ) { groups in
                    
                    HStack {
                        ForEach(groups, id: \.self ) { value in
                            Button(action: {
                                calculation.pressedBtns(value: value)
                            } , label: {
                                
                                Text(value.rawValue)
                                    .frame(width: btnWidth(value), height: bthHeight)
                                    .background(colorView.cuurentBgColor)
                                    .foregroundColor(colorView.currentTextColor)
                                    .font(.custom("Jost-Regular", size: 38))
                                
                            })
                            
                        }
                    }
                }
            }
            
        }
    
    }
    
    func btnWidth(_ value: CalcBtn)-> CGFloat {
        let btn = UIScreen.main.bounds.width / 5
        return value == .zero ? btn * 2 : btn
    }
       
}


struct SimpleLayout_Previews: PreviewProvider {
    @State static var showSetting = false
    static var previews: some View {
        SimpleLayout(showSetting: $showSetting)
            .environmentObject(ColorView())
            .environmentObject(ShadowViewModel())
    }
}
