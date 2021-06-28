//
//  GridTypePicker.swift
//  GridView
//
//  Created by 서보경 on 2021/06/09.
//

import SwiftUI

struct GridTypePicker: View {
    @Binding var gridType: GridType
    var body: some View {
        Picker("Grid Type", selection: $gridType) {
            ForEach(GridType.allCases, id: \.self) { type in
                switch type {
                case .single:
                    Image(systemName: "rectangle.grid.1x2")
                    
                case .double:
                    Image(systemName: "rectangle.grid.2x2")
                    
                case .triple:
                    Image(systemName: "rectangle.grid.3x2")
                    
                case .adaptive:
                    Image(systemName: "square.grid.4x3.fill")
                }
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}
