//
//  ClockTick.swift
//  StopWatch
//
//  Created by 서보경 on 2021/06/11.
//

import SwiftUI


struct ClockTick: View {
    var tickCount = 60
    
    var body: some View {
        ZStack {
            ForEach(0 ..< tickCount) { tick in
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 1, height: tick % 5 == 0 ? 20 : 10)
                    .offset(y: 100)
                    .rotationEffect(.degrees( Double(tick) / Double(tickCount) * 360))
            }
            
        }
    }
}

struct MilliClockTick: View {
    var tickCount = 10
    
    var body: some View {
        ZStack {
            ForEach(0 ..< tickCount) { tick in
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 1, height: 10)
                    .offset(y: 30)
                    .rotationEffect(.degrees( Double(tick) / Double(tickCount) * 360))
            }
            
        }
    }
}


struct ClockNumber: View {
    var tickCount = 60
    var body: some View {
        ZStack {
            ForEach(0 ..< tickCount) { tick in
                if tick % 5 == 0 {
                    ZStack {
                        Text("\(tick)")
                            .rotationEffect(.degrees( Double(tick) / Double(tickCount) * -360))
                        // 회전 효과를 준 텍스트에 다시 반대 방향으로 회전 효과를 주면 글자가 원래대로 돌아감
                    }
                    .offset(y: -120)
                    .rotationEffect(.degrees( Double(tick) / Double(tickCount) * 360))
                }
            }
        }
    }
}
