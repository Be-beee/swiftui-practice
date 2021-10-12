//
//  ContentView.swift
//  MyOverseasRecipt
//
//  Created by 서보경 on 2021/10/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            ExchangeView()
            ReciptView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
