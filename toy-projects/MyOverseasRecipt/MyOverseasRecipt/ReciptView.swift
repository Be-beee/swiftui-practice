//
//  ReciptView.swift
//  MyOverseasRecipt
//
//  Created by 서보경 on 2021/10/09.
//

import SwiftUI

struct ReciptView: View {
    @State var transition: CGFloat = UIScreen.main.bounds.height - 150
    // recipt view를 위한 적정 높이 계산 필요
    var dragGesture: some Gesture {
        DragGesture()
            .onEnded { value in
                if value.translation.height > 50 {
                    self.transition = 0
                }
            }
    }
    // gesture 적용 필요
    var body: some View {
        GeometryReader { geometry in
            VStack {
                IndicatorView()
                ReciptContentView()
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(20)
            .offset(y: max(transition, 0))
//            .gesture(dragGesture)
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
                EmptyReciptContentView()
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

struct EmptyReciptContentView: View {
    var body: some View {
        Text("No Items")
            .padding()
    }
}

struct ReciptView_Previews: PreviewProvider {
    static var previews: some View {
        ReciptView()
    }
}
