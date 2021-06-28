//
//  CalcLogic.swift
//  Caculator
//
//  Created by 서보경 on 2021/06/15.
//

import Foundation
import SwiftUI

class CalcLogic {
    var digit1: Double? = nil
    var digit2: Double? = nil
    
    var calculateResult: Double? = nil
    var rememberSymbol: String? = nil
    
    func logic() -> Double? {
        switch rememberSymbol {
        case "+":
            calculateResult = digit1! + digit2!
        case "-":
            calculateResult = digit1! + digit2!
        case "+-":
            calculateResult = -digit1!
        case "%":
            calculateResult = digit1! * 0.01
        default:
            break
        }
        return calculateResult
    }
    
    
}
