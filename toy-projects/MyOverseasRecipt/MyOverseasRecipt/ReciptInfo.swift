//
//  ReciptInfo.swift
//  MyOverseasRecipt
//
//  Created by 서보경 on 2021/10/11.
//

import SwiftUI

enum ExUnit {
    case krw, usd, jpy, twd
}

struct ReciptInfo: Identifiable {
    let id = UUID()
    var name: String = "asdf"
    var price: Int = 0
    var unit: ExUnit = .krw
}

