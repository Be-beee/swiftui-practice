//
//  Buttons.swift
//  StopWatch
//
//  Created by 서보경 on 2021/06/11.
//

import SwiftUI

struct StartStopButton: View {
    @Binding var isStart: Bool
    
    var body: some View {
        HStack (spacing: 0) {
            
            Button(action: {
                isStart = true
            }, label: {
                Text("START")
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.size.width/2, height: 50)
                    .background(Color.orange)
                // 버튼 여백을 탭해도 적용되도록!!!!!!
            })
            
            
            Button(action: {
                isStart = false
            }, label: {
                Text("STOP")
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.size.width/2, height: 50)
                    .background(Color.yellow)
            })
            
            
//            Button("Start") {
//                isStart = true
//            }
//
            
//            Button("Stop") {
//                isStart = false
//            }
//            .frame(width: UIScreen.main.bounds.size.width/2, height: 50)
//            .background(Color.yellow)
        }
        
    }
}
