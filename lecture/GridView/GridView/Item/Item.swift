//
//  Item.swift
//  GridView
//
//  Created by 서보경 on 2021/06/09.
//

import Foundation

struct Item: Identifiable {
    let id = UUID()
    let mainTitle: String
    let subTitle: String
    let imageName: String
    
    static var dummyData: [Item] {
        (0...30).map { index in
            Item(mainTitle: "Main Title Index\(index)",
                 subTitle: "Sub Title Index\(index)",
                 imageName: "sample2"
            )
        }
    }
    
    
}
