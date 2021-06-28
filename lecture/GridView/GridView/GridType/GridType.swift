//
//  GridType.swift
//  GridView
//
//  Created by 서보경 on 2021/06/09.
//

import SwiftUI

enum GridType: CaseIterable {
    case single
    case double
    case triple
    case adaptive
    
    var columns: [GridItem] {
        switch self {
        case .single:
            return [GridItem(.flexible())]
        case .double:
            return [GridItem(.flexible()),
                    GridItem(.flexible())]
        case .triple:
            return [GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())]
        case .adaptive:
            return [GridItem(.adaptive(minimum: 60))]
        }
    }
}
