//
//  Task.swift
//  Walker
//
//  Created by Ganna Melnyk on 9/10/18.
//  Copyright © 2018 Ganna Melnyk. All rights reserved.
//

import UIKit

struct Task: Decodable {
    let id: Int
    let taskDescription: String
    let answer: String
    
//    init(json: [String: Any]) {
//        id = json["id"] as? Int ?? -1
//        taskDescription = json["taskDescription"] as? String ?? ""
//        answer = json["answer"] as? String ?? ""
//    }

}
