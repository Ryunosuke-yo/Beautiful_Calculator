//
//  ContentView.swift
//  Beautiful_Calculator
//
//  Created by Ryunosuke Yokokawa on 2022-10-26.
//

import SwiftUI

struct ContentView: View {
    @State private var showSetting = false
    
    let buttons: [[CalcBtn]] = [
        [.ac, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .theree, .plus],
        [.zero, .dot, .equal]
    ]
    
    //    init(){
    //        for family in UIFont.familyNames {
    //             print(family)
    //
    //             for names in UIFont.fontNames(forFamilyName: family){
    //             print("== \(names)")
    //             }
    //        }
    //    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 2) {
                Spacer()
                VStack {
                    Button {
                        showSetting.toggle()
                    } label: {
                        Image(systemName: "gearshape.fill")
                    }
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                    .position(x:25, y:30)
                    .sheet(isPresented: $showSetting) {
                        SettingView(showSetting: $showSetting)
                            .presentationDetents([.fraction(0.55)])
                    }
                    HStack {
                        Spacer()
                        VStack(alignment:.trailing){
                            Text("3 + 4 = ")
                                .foregroundColor(.white)
                                .font(.custom("Jost-Regular", size: 21))
                            Text("7")
                                .foregroundColor(.white)
                                .font(.custom("Jost-Regular", size: 23))
                            Text("3 + 4 = ")
                                .foregroundColor(.white)
                                .font(.custom("Jost-Regular", size: 21))
                        }
                        
                        
                    }
                    HStack {
                        Spacer()
                        Text("0")
                            .foregroundColor(.white)
                            .font(.custom("Jost-Regular", size: 60))
                    }
                }
                .padding(.horizontal, 25)
                
                
                
                Rectangle()
                    .fill(.gray)
                    .frame(width: WidthAndHeight.dividerWidth, height: 1)
                    .padding(.vertical, 10)
                
                ForEach(buttons, id: \.self ) { groups in
                    
                    HStack {
                        ForEach(groups, id: \.self ) { value in
                            Button(action: {} , label: {
                                
                                Text(value.rawValue)
                                    .frame(width: WidthAndHeight.btnWidth(value), height: WidthAndHeight.btnHeight())
                                    .background(.black)
                                    .foregroundColor(.white)
                                    .font(.custom("Jost-Regular", size: 30))
                                
                                
                                
                            })
                            
                        }
                    }
                }
                
                
            }
  
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
