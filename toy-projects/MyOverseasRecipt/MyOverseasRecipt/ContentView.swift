//
//  ContentView.swift
//  MyOverseasRecipt
//
//  Created by 서보경 on 2021/10/06.
//

import SwiftUI

struct ContentView: View {
    @State var isHidden = false
    var overValue = 1
    @State var overseasValue = "1"
    @State var koreanValue = "1200"
    var body: some View {
        ZStack {
            VStack {
                // graph
                Spacer()
                HStack {
                    Text("미국 USD")
                    Spacer()
                }
                .padding()
                .border(.black, width: 1)
                
                HStack {
                    TextField("USD 입력", text: $overseasValue)
                        .padding()
                        .multilineTextAlignment(.trailing)
                    Text("usd")
                        .padding()
                }
                
                Spacer()
                
                HStack {
                    Text("한국 KRW")
                    Spacer()
                }
                .padding()
                .border(.black, width: 1)
                
                HStack {
                    TextField("KRW 입력", text: $koreanValue)
                        .padding()
                        .multilineTextAlignment(.trailing)
                    Text("krw")
                        .padding()
                }
                
                Spacer()
                
                Button(action: {
                    // action
                    print("Add to recipt")
                }, label: {
                    // display
                    Text("영수증에 추가")
                })
                Spacer()
                ReciptView() // 영수증 위치
                    .frame(width: UIScreen.main.bounds.width, height: 120)
                    .background(Color.blue)
            }
            
        }
        .ignoresSafeArea()
    }
}

struct ReciptView: View {
    
    var body: some View {
        Text("RECIPT")
            .font(.title)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
