//
//  ContentView.swift
//  GalleryCard
//
//  Created by 서보경 on 2021/06/28.
//

import SwiftUI

struct GalleryItem: Hashable {
    var color: Color
    var title: String
    
}


struct ContentView: View {
    
    var items = [
        GalleryItem(color: .red, title: "title1 ttttttttttttt"),
        GalleryItem(color: .blue, title: "title2"),
        GalleryItem(color: .gray, title: "title3"),
        GalleryItem(color: .green, title: "title4"),
        GalleryItem(color: .orange, title: "title5"),
        GalleryItem(color: .yellow, title: "title6"),
        GalleryItem(color: .pink, title: "title7"),
    ]
    
    var itemSize = CGSize(width: 100, height: 100)
    var scrollViewSize = CGSize(width: 300, height: 300)
    
    var leadingPadding: CGFloat {
        scrollViewSize.width / 2 - itemSize.width / 2
    }
    
    var body: some View {
        VStack(spacing: 0) {
            makeGallery()
            makeGallery()
        }
        
    }
    
    func makeGallery() -> some View {
        GeometryReader { scrollGeo in
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 20) {
                    
                    ForEach(items, id: \.self) { item in
                        
                        GeometryReader { geometry in
                            
                            ZStack {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: itemSize.width, height: itemSize.height)
                                    .foregroundColor(item.color)
                                VStack {
                                    Spacer()
                                    Text(item.title)
                                        .padding(.bottom, 10)
                                }
                            }
                            .rotation3DEffect(
                                .degrees((Double(geometry.frame(in: .global).minX - leadingPadding) - Double(scrollGeo.frame(in: .global).minX)) / 3),
                                axis: (x: 0, y: -1, z: 0)
                            )
                            // axis: x, y, z중 하나만 있으면 값이 1이든 1000이든 효과는 동일하지만 2개 이상일 경우 각 값의 비율로 효과의 적용 정도가 변경된다. 만약 y: 5, z: 10이면 1:2 비율로 적용됨
                            
                        }.frame(width: itemSize.width, height: itemSize.height)
                        
                    }
                }.padding(.vertical, 50)
                .padding(.leading, self.leadingPadding)
                .padding(.trailing, self.leadingPadding)
            })
            .background(Color.black.opacity(0.2))
        }.frame(width: self.scrollViewSize.width, height: self.scrollViewSize.height)
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
