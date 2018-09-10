//
//  JsonHandler.swift
//  Walker
//
//  Created by Ganna Melnyk on 9/10/18.
//  Copyright © 2018 Ganna Melnyk. All rights reserved.
//
import Foundation

class JsonHandler {

     let jsonUrlString = "https://gist.githubusercontent.com/GannaMelnyk/7fee4ddd25d3f8eb3c421e782a5dc83e/raw/7afe5096150881c53d564d46b062f200bf06d214/Tasks.json"
    
    static let shared = JsonHandler()
    
    private init() {
        
    }
    
//    func getTasks() -> [Task]? {
//
//        guard let url = URL(string: jsonUrlString) else { return nil }
//
//        URLSession.shared.dataTask(with: url) { (data, response, err) in
//
//            guard let data = data else { return }
//
//            do {
//                let tasks = try JSONDecoder().decode([Task].self, from: data)
//            } catch let jsonErr {
//                print("error:", jsonErr)
//            }
//            }.resume()
//        return nil
//    }
    
    func downloadJson(completion: @escaping ([Task]?) -> ()) {
        executeGetRequest(with: jsonUrlString) { (data) in  // Data received from closure
            do {
                guard let data = data else { return }
                    let tasks = try JSONDecoder().decode([Task].self, from: data)
                    completion(tasks)
            } catch {
                print("ERROR: could not retrieve response")
            }
        }
    }
    
    func executeGetRequest(with urlString: String, completion: @escaping (Data?) -> ()) {
        
        let url = URL.init(string: urlString)
        let urlRequest = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            //  Log errors (if any)
            if error != nil {
                print(error.debugDescription)
            } else {
                //  Passing the data from closure to the calling method
                completion(data)
            }
            }.resume()  // Starting the dataTask
    }
    
}
