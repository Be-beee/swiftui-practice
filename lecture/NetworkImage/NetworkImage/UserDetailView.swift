//
//  UserDetailView.swift
//  NetworkImage
//
//  Created by 서보경 on 2021/06/10.
//

import SwiftUI

struct UserDetailView: View {
    
    var user: User
    
    
    var body: some View {
        VStack() {
            URLImage(urlString: user.avatar)
                .frame(width: UIScreen.main.bounds.size.width, height: 250)
                .aspectRatio(contentMode: .fill)
            Text(user.name)
                .font(.largeTitle)
            Text(user.createdAt)
            Spacer()
        }
    }
}
