//
//  ContentView.swift
//  NetworkImage
//
//  Created by 서보경 on 2021/06/10.
//

import SwiftUI

// https://60c1a6aa4f7e880017dbff6e.mockapi.io

struct ContentView: View {
    @State private var users: [User] = []
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                
                LazyVGrid(columns: [GridItem(.flexible())], alignment: .leading, content: {
                    
                    ForEach(users) { user in
                        
                        NavigationLink(
                            destination: UserDetailView(user: user),
                            label: {
                                HStack {
                                    URLImage(urlString: user.avatar)
                                        .frame(width: 100, height: 100)
                                    Text("\(user.name)")
            //                        Spacer()
                                }
                            })
                    }
                })
            }
            .navigationBarTitle("User List")
        }
        .onAppear{
            WebService().loadUsers { user in
                self.users = user
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
