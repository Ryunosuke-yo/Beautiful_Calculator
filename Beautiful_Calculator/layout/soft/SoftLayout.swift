//
//  SoftLayout.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-11-03.
//

import SwiftUI


struct SoftLayout: View {
    @EnvironmentObject private var colorView: ColorView
    @State private var showSetting = false
    
    let answerSectionWidth = CalcUltils.scrrenWidth - 50
    let buttons = CalcUltils.buttons
    let softBtnWidth = UIScreen.main.bounds.width / 5.2
    
    
    
    var body: some View {
        ZStack {
            colorView.cuurentBgColor.ignoresSafeArea()
            VStack {
                HStack {
                    
                    Button {
                        showSetting.toggle()
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .frame(width: 40, height: 40)
                        

                    }
                    .foregroundColor(colorView.currentTextColor)
                    .font(.system(size: 15))
                    .buttonStyle(SoftBtnStyle(isRectangle: false))
                    .position(x:40, y:40)
                    .sheet(isPresented: $showSetting) {
                        SettingView(showSetting: $showSetting)
                            .presentationDetents([.fraction(0.55)])
                    }
                    
                    Button {
                        showSetting.toggle()
                    } label: {
                        Image(systemName: "circle.grid.cross")
                            .frame(width: 40, height: 40)
                            .foregroundColor(colorView.currentTextColor)
                        

                    }
                    .foregroundColor(colorView.currentTextColor)
                    .font(.system(size: 15))
                    .buttonStyle(SoftBtnStyle(isRectangle: false))
                    .position(x:-78, y:100)
                    .sheet(isPresented: $showSetting) {
                        SettingView(showSetting: $showSetting)
                            .presentationDetents([.fraction(0.55)])
                    }
                    
                    
                    
                    VStack(alignment: .trailing) {
                        Text("3 + 4 = ")
                            .foregroundColor(colorView.currentTextColor)
                            .font(.custom("Jost-Regular", size: 21))
                        Text("7")
                            .foregroundColor(colorView.currentTextColor)
                            .font(.custom("Jost-Regular", size: 23))
                        Text("3 + 4 = ")
                            .foregroundColor(colorView.currentTextColor)
                            .font(.custom("Jost-Regular", size: 21))

                        HStack {
                            Spacer()
                            Text("0")
                                .foregroundColor(colorView.currentTextColor)
                                .font(.custom("Jost-Regular", size: 60))
                        }
                    }
                    .padding([.trailing], 40)
                }
                .frame(maxWidth: answerSectionWidth)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.shadow(.inner(color: .white.opacity(0.7), radius: 10, x:-10, y: -10))
                            .shadow(.inner(color: .myBlack.opacity(0.2), radius: 5, x:5, y: 5)))
                        .foregroundColor(.myWhite)
                    )
                    
               
                
                ForEach(buttons, id: \.self ) { groups in
                    HStack {
                        ForEach(groups, id: \.self ) { value in
                            if value == CalcBtn.zero {
                                Button(action: {
                                } , label: {
                                    Text(value.rawValue)
                                        .frame(width: softBtnWidth * 2, height: softBtnWidth)
                                        .foregroundColor(colorView.currentTextColor)
                                        
                                })
                                .buttonStyle(SoftBtnStyle(isRectangle: true))
                                .padding()
                            } else {
                                Button(action: {
                                } , label: {
                                    Text(value.rawValue)
                                        .frame(width: softBtnWidth, height: softBtnWidth)
                                        .foregroundColor(colorView.currentTextColor)
                                        
                                })
                                .buttonStyle(SoftBtnStyle(isRectangle: false))
                                .padding(3)
                            }
                            

                        }
                    }
                }

            }
        }
        
    }
}

struct SoftLayout_Previews: PreviewProvider {
    static var previews: some View {
        SoftLayout()
            .environmentObject(ColorView())
    }
}
