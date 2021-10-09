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
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 80, height: 5, alignment: .center)
                        .padding()
                    Text("RECIPT")
                        .font(.title)
                        .fontWeight(.bold)
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(20)
                .frame(height: geometry.size.height, alignment: .bottom)
                .offset(y: max(geometry.size.height - 100, 0))
            }
        }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView()
    }
}
