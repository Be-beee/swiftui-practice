//
//  CalcButton.swift
//  Caculator
//
//  Created by 서보경 on 2021/06/15.
//

import SwiftUI

struct CalcButton: View {
    var buttonName = ""
    var body: some View {
        Circle()
            .foregroundColor(.orange)
            .overlay(
                Text(buttonName)
                    .font(.largeTitle)
            )
    }
}
