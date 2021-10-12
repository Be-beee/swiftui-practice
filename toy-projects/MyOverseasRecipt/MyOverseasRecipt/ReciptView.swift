//
//  ReciptView.swift
//  MyOverseasRecipt
//
//  Created by 서보경 on 2021/10/09.
//

import SwiftUI

struct ReciptView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                IndicatorView()
                ReciptContentView()
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(20)
            .offset(y: max(0, 0))
            // 임시 offset 조정
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
    @State var itemlist: [ReciptInfo] = []
    @State var totalPrice = 0
    var body: some View {
        VStack {
            Text("RECIPT")
                .font(.title)
                .fontWeight(.bold)
            if itemlist.count > 0 {
                List {
                    ForEach(itemlist) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("\(item.price) KRW")
                        }
                    }
                }
            } else {
                Text("No Items")
                    .padding()
            }
            
            Divider()
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            Text("Total: \(totalPrice) KRW")
                .fontWeight(.semibold)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 0))
        }
        .frame(width: UIScreen.main.bounds.width, alignment: .center)
    }
}

struct ReciptView_Previews: PreviewProvider {
    static var previews: some View {
        ReciptView()
    }
}
