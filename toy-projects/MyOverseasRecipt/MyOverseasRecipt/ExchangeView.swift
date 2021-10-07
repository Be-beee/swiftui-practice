//
//  ExchangeView.swift
//  MyOverseasRecipt
//
//  Created by 서보경 on 2021/10/07.
//

import SwiftUI

struct ExchangeView: View {
    
    var body: some View {
        VStack {
            ExInfoView(selected: 0)
            ExInfoView(selected: 1)
            AddButtonView()
        }
    }
}

struct ExInfoView: View {
    var nations = [("한국", "KRW"), ("미국", "USD"), ("일본", "JPY"), ("대만", "TWD"), ("홍콩", "HKD"), ("멕시코", "MXN"), ("러시아", "RUB")]
    @State var selected: Int
    @State var exPrice = ""
    var body: some View {
        VStack {
            HStack {
                Picker(selection: $selected, label: Text("국가 선택")) {
                        ForEach(0 ..< nations.count) {
                            Text(self.nations[$0].0)
                        }
                }
                Spacer()
            }
            HStack{
                TextField("가격 입력", text: $exPrice)
                    .multilineTextAlignment(.trailing)
                Spacer()
                Text(nations[selected].1)
            }
        }
        .padding()
    }
}

struct AddButtonView: View {
    var body: some View {
        Button {
            print("Add to recipt")
        } label: {
            Text("영수증에 추가")
        }

    }
}

struct ExchangeView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeView()
    }
}
