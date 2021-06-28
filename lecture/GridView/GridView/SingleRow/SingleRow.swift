//
//  SingleRow.swift
//  GridView
//
//  Created by 서보경 on 2021/06/09.
//

import SwiftUI

struct SingleRow: View {
    let item: Item
    
    var body: some View {
        ZStack {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack {
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.mainTitle)
                            .font(.headline)
                        Text(item.subTitle)
                            .font(.subheadline)
                    }
                    Spacer()
                }
                .padding(10)
                .background(Color.white.opacity(0.5))
            }
        }
    }
}

struct SingleRow_Previews: PreviewProvider {
    static var previews: some View {
        SingleRow(item: Item(mainTitle: "main", subTitle: "subtitle", imageName: "sample2"))
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/))
    }
}
