//
//  GlassLayout.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-11-03.
//

import SwiftUI


struct GlassLayout: View {
    @Binding var showSetting: Bool
    @EnvironmentObject private var colorView: ColorView
    
    let buttons = CalcUltils.buttons
    
    let glassCalcFieldWidth = UIScreen.main.bounds.width - 35
    let glassCalcBtnWidth = UIScreen.main.bounds.width
    let glassCalcBtnHeight = UIScreen.main.bounds.height / 1.6
    
    let btnSize = UIScreen.main.bounds.width / 6
    
   
    
    
    var body: some View {
        ZStack {
            colorView.cuurentBgColor.ignoresSafeArea()
            Image("bottom_blob")
                .position(x:200, y: 700)
            
            Image("right_blob")
                .position(x:400, y:100)
            
            Image("left_blob")
                .position(x:-80, y: -250)
                .frame(width: 210, height: 210)
            
            VStack(spacing: 10) {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        showSetting.toggle()
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .frame(width: 40, height: 40)
                        

                    }
                    .foregroundColor(colorView.currentTextColor)
                    .font(.system(size: 15))
                    .position(x:20, y:40)
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
                    .position(x:-101, y:90)
                    .sheet(isPresented: $showSetting) {
                        SettingView(showSetting: $showSetting)
                            .presentationDetents([.fraction(0.55)])
                    }
                    
                    
                    VStack(alignment: .trailing) {
                        Text("3 + 4 = ")
                            .foregroundColor(colorView.currentTextColor)
                            .font(.custom("MontserratRoman-Regular", size: 21))
                        Text("7")
                            .foregroundColor(colorView.currentTextColor)
                            .font(.custom("MontserratRoman-Regular", size: 23))
                        Text("3 + 4 = ")
                            .foregroundColor(colorView.currentTextColor)
                            .font(.custom("MontserratRoman-Regular", size: 21))
                           
                            Text("0")
                                .foregroundColor(colorView.currentTextColor)
                                .font(.custom("MontserratRoman-Regular", size: 60))
                        
                    }
                    .padding()
                }
                
                
                    .foregroundColor(.myWhite)
                    .frame(width: glassCalcFieldWidth, height: 200)
                    .background(glassBgView())
                   
                Spacer()
                VStack {
                    ForEach(buttons, id: \.self ) { groups in
                        HStack {
                            ForEach(groups, id: \.self ) { value in
                                if value == CalcBtn.zero {
                                    Button(action: {
                                       
                                    } , label: {
                                        Text(value.rawValue)
                                            .font(.custom("MontserratRoman-Regular", size: 25))
                                            .frame(width: btnSize * 2, height: 30)
                                            .foregroundColor(colorView.currentTextColor)
                                            
                                    })
                                    
                                    .padding()
                                } else {
                                    Button(action: {
                                    } , label: {
                                        Text(value.rawValue)
                                            .font(.custom("MontserratRoman-Regular", size: 30))
                                            .frame(width: btnSize, height: 90)
                                            .foregroundColor(colorView.currentTextColor)
                                            
                                    })
                                    
                                    .padding(3)
                                }
                                

                            }
                        }
                    }
                }
                
                
                .foregroundColor(.myWhite)
                .frame(width: glassCalcBtnWidth, height: glassCalcBtnHeight)
                .background(glassBgView().ignoresSafeArea())
                
                
            }
           

                
            
            
            
        }
    }
    
    
    @ViewBuilder func glassBgView()-> some View {
        Group{
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.ultraThinMaterial)
                .foregroundColor(.glassBgWhite)
                .opacity(0.3)
            
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(
                    .linearGradient(colors: [
                        .glassBgWhite.opacity(0.4),
                        .glassBgWhite.opacity(0.2)
                        
                    ], startPoint: .topLeading, endPoint: .bottomTrailing))
                .opacity(0.5)
            
            
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .stroke(
                    .linearGradient(colors: [
                        .myWhite.opacity(0.4),
                        .myWhite.opacity(0.2),
                        .myWhite.opacity(0.2),
                        .myWhite.opacity(0.2)
                        
                    ], startPoint: .topLeading, endPoint: .bottomTrailing),
                    lineWidth: 2)

        }
        .shadow(color: .black.opacity(0.3), radius: 6, x: 10, y: 5)
        
        
    }
    
    
}



struct GlassLayout_Previews: PreviewProvider {
    @State static var showSetting = false
    static var previews: some View {
        GlassLayout(showSetting: $showSetting)
            .environmentObject(ColorView())
    }
}


