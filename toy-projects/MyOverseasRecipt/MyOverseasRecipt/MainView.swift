//
//  ContentView.swift
//  Rename --> MainView.swift
//
//  MyOverseasRecipt
//
//  Created by 서보경 on 2021/10/06.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            ExchangeView()
            ReciptView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
