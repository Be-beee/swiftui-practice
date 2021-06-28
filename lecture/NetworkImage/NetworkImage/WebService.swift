//
//  WebService.swift
//  NetworkImage
//
//  Created by 서보경 on 2021/06/10.
//

import Foundation
import SwiftUI

struct User: Codable, Identifiable {
    var id: String
    var name: String
    var avatar: String
    var createdAt: String
}

class WebService: ObservableObject {
    func loadUsers(completion: @escaping ([User]) -> Void) {
        guard let url = URL(string: "https://60c1a6aa4f7e880017dbff6e.mockapi.io/user") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let hasData = data else {
                return
            }
            let users = try! JSONDecoder().decode([User].self, from: hasData)
            completion(users)
        }.resume()
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    var urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
        self.loadImageFromURL()
    }
    
    func loadImageFromURL() {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let hasData = data else { return }
            
            guard let loadedImage =  UIImage(data: hasData) else { return }
            
            DispatchQueue.main.async {
                self.image = loadedImage
            }
            
        }.resume()
    }
}

struct URLImage: View {
    @ObservedObject var loader: ImageLoader
    
    init(urlString: String) {
        self.loader = ImageLoader(urlString: urlString)
    }
    
    var body: some View {
        Image(uiImage: loader.image ?? UIImage(systemName: "photo")!)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
