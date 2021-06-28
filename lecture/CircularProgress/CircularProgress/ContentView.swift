//
//  ContentView.swift
//  CircularProgress
//
//  Created by 서보경 on 2021/06/10.
//

import SwiftUI

struct ContentView: View {
    
    @State private var progress: CGFloat = 0
    
    var body: some View {
        VStack {
            Slider(value: $progress)
            CircularProgressBar(progress: $progress)
        }
        .padding(30)
        
        
        
    }
}

struct CircularProgressBar: View {
    @Binding var progress: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray, lineWidth: 20)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .fill(progress == 1 ? Color.green : Color.red)
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut)
            
            Text("\(String(format: "%.2f", progress * 100))" + "%")
                .foregroundColor(progress == 1 ? Color.green : Color.red)
                .font(.largeTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
