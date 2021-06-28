//
//  SecondHand.swift
//  StopWatch
//
//  Created by 서보경 on 2021/06/11.
//

import SwiftUI


struct SecondHand: View {
    var sec: Double
    private var height: CGFloat = 80
    
    init(sec: Double) {
        self.sec = sec
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.orange)
                .frame(width: 3, height: height)
                .offset(y: -height/2)
                .rotationEffect(.degrees( sec / 60 * 360 ))
        }
    }
}

struct MinuteHand: View {
    var sec: Double
    private var height: CGFloat = 50
    init(sec: Double) {
        self.sec = sec
    }

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.blue)
                .frame(width: 3, height: height)
                .offset(y: -height/2)
                .rotationEffect(.degrees( sec / 60 / 60 * 360 ))
        }
    }
}


struct HundredMilliSecHand: View {
    var sec: Double
    private var height: CGFloat = 25
    init(sec: Double) {
        self.sec = sec
    }

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.gray)
                .frame(width: 3, height: height)
                .offset(y: -height/2)
                .rotationEffect(.degrees( sec / 60 * 60 * 360 ))
        }
    }
}
