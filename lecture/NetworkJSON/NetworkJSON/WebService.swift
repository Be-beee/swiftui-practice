//
//  WebService.swift
//  NetworkJSON
//
//  Created by 서보경 on 2021/06/09.
//

//"userId": 1,
//    "id": 3,
//    "title": "fugiat veniam minus",
//    "completed": false
import SwiftUI

// https://jsonplaceholder.typicode.com/todos
// fake api

struct Todo: Codable, Identifiable {
    var userId: Int?
    var id: Int?
    var title: String?
    var completed: Bool?
}


class WebService {
    
    func getTodos(completion: @escaping ([Todo]) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let hasData = data else { return }
            print(hasData)
            
            let todos = try! JSONDecoder().decode([Todo].self, from: hasData)
            
            completion(todos)
            
        }.resume()
    }
}
