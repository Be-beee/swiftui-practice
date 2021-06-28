//
//  ContentView.swift
//  StopWatch
//
//  Created by 서보경 on 2021/06/11.
//

import SwiftUI

struct ContentView: View {
    
    @State private var time: Double = 0
    
    var humanReadableTime: String {
        let sec = Int(time) % 60
        let secString = String(format: "%02d", sec)
        
        let minute = Int(time) / 60
        let minuteString = String(format: "%02d", minute)
        
        let millisec = time.truncatingRemainder(dividingBy: 1)
        let milliString = String(format: "%.2f", millisec).split(separator: ".").last ?? "0"
        
        return "\(minuteString):\(secString).\(milliString)"
        
    }
    
    var timer = Timer.publish(every: 0.1, on: .current, in: .default).autoconnect()
    
    @State private var isStart = false
    
    var body: some View {
        VStack {
            ZStack {
                ClockTick()
                ClockNumber()
                
                SecondHand(sec: time)
                MinuteHand(sec: time)
                
                CenterCircle()
                
                MilliClockTick()
                    .offset(y: 50)
                HundredMilliSecHand(sec: time)
                    .offset(y: 50)
                CenterCircle()
                    .offset(y: 50)
            }
            .padding(.bottom, 100)
            
            StartStopButton(isStart: $isStart)
                .padding()
            
            Text(humanReadableTime)
                .font(.largeTitle)
        }
        
        .onReceive(timer, perform: { _ in
            withAnimation {
                if isStart {
                    self.time += 0.1
                }
            }
        })
        
    }
}

struct CenterCircle: View {
    var body: some View {
        Circle()
            .fill(Color.gray)
            .frame(width: 10, height: 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
