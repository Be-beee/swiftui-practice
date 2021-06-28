//
//  ContentView.swift
//  Caculator
//
//  Created by 서보경 on 2021/06/15.
//

import SwiftUI

struct ContentView: View {
    
    @State var geoCircleHeight: CGFloat = 50
    @State private var display = "0"
    
    @State private var isIntheTypinOfDigit = false
    
    var calcLogic = CalcLogic()
    
    let data = [
        ["AC", "+-", "%", "/"],
        ["7", "8", "9", "*"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", "="]
    ]
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            Text(display)
                .font(.largeTitle)
                .padding(.trailing, 10)
                .frame(width: UIScreen.main.bounds.size.width, alignment: .trailing)
                
            
            ForEach (0 ..< 4) { indexI in
                HStack(spacing: 10) {
                    ForEach (0 ..< 4) { indexJ in
                        
                        Button(action: {
                            calcAction(symbol: data[indexI][indexJ])
                        }, label: {
                            CalcButton(buttonName: data[indexI][indexJ])
                                .aspectRatio(1, contentMode: .fit)
                                .foregroundColor(.black)
                        })
                        
                        
                    }
                }
                .padding(.horizontal, 10)
            }
            
            // last line
            HStack(spacing: 10) {
                GeometryReader(content: { geometry in
                    Capsule()
                        .foregroundColor(.orange)
                        .aspectRatio(CGSize(width: geometry.size.height*2+10, height: geometry.size.height), contentMode: .fit)
                        .overlay (
                            Text(data[4][0])
                                .font(.largeTitle)
                        )
                        .onAppear {
                            self.geoCircleHeight = geometry.size.height
                        }
                        .onTapGesture {
                            calcAction(symbol: data[4][0])
                        }
                })
                
                CalcButton(buttonName: data[4][1])
                    .aspectRatio(1, contentMode: .fit)
                    .onTapGesture {
                        calcAction(symbol: data[4][1])
                    }
                CalcButton(buttonName: data[4][2])
                    .aspectRatio(1, contentMode: .fit)
                    .onTapGesture {
                        calcAction(symbol: data[4][2])
                    }
            }
            .aspectRatio(CGSize(width: geoCircleHeight*4+30, height: geoCircleHeight), contentMode: .fit)
            .padding(.horizontal, 10)
            
        }
        .padding(.bottom, 10)
        
    }
    
    func calcAction(symbol: String) {
        if Int(symbol) != nil {
            if isIntheTypinOfDigit {
                display += symbol
            } else {
                isIntheTypinOfDigit = true
                display = symbol
            }
            
            if calcLogic.rememberSymbol == nil {
                calcLogic.digit1 = Double(display)
            } else {
                calcLogic.digit2 = Double(display)
            }
            
        } else {
            if symbol != "=" {
                calcLogic.rememberSymbol = symbol
            }
            isIntheTypinOfDigit = false
            if symbol == "AC" {
                calcLogic.digit1 = nil
                calcLogic.digit2 = nil
                calcLogic.calculateResult = nil
                calcLogic.rememberSymbol = nil
                display = "0"
            }
            if symbol == "%" {
                display = "\(calcLogic.logic() ?? 0)"
                calcLogic.digit1 = Double(display)
            }
            
            if symbol == "=" {
                display = "\(calcLogic.logic() ?? 0)"
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
