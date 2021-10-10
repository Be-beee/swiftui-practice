//
//  ReciptView.swift
//  MyOverseasRecipt
//
//  Created by 서보경 on 2021/10/09.
//

import SwiftUI

struct SampleView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                IndicatorView()
                ReciptContentView()
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(20)
            .offset(y: max(geometry.size.height - 100, 0))
        }
    }
}

struct IndicatorView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .frame(width: 80, height: 5, alignment: .center)
            .padding()
    }
}

struct ReciptContentView: View {
    var body: some View {
        Text("RECIPT")
            .font(.title)
            .fontWeight(.bold)
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView()
    }
}
