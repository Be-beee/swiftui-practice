//
//  ContentView.swift
//  MyOverseasRecipt
//
//  Created by 서보경 on 2021/10/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ExchangeView()
    }
}

struct ReciptSampleView: View {
    
    var body: some View {
        ZStack {
            Color(UIColor.systemBlue)
            Text("RECIPT")
                .font(.title)
        }
        .frame(width: UIScreen.main.bounds.width, height: 120)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
