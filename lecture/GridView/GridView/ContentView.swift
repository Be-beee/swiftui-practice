//
//  ContentView.swift
//  GridView
//
//  Created by 서보경 on 2021/06/09.
//

import SwiftUI

struct ContentView: View {
    
    var items = Item.dummyData
    
    @State private var selectedGridType: GridType = .single
    
    var body: some View {
        VStack {
            GridTypePicker(gridType: $selectedGridType)
            ScrollView {
                LazyVGrid(columns: selectedGridType.columns, content: {
                    ForEach(items) { item in
                        switch selectedGridType {
                        case .single,
                             .double:
                            SingleRow(item: item)
                        default:
                            Image(item.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                })
                .animation(.default)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
