//
//  JsonVC.swift
//  Walker
//
//  Created by Ganna Melnyk on 9/10/18.
//  Copyright © 2018 Ganna Melnyk. All rights reserved.
//

import UIKit

class JsonVC: UIViewController {
    var tasks: [Task]?
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var answerField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        JsonHandler.shared.downloadJson { (tasksFromJson: [Task]?) in
            self.tasks = tasksFromJson
            print(tasksFromJson ?? "default value")

            guard let tasks = tasksFromJson else { return }

            DispatchQueue.main.async(execute: {
                if self.textView.text == nil || self.answerField.placeholder == nil {
                    self.textView.text = tasks[0].taskDescription
                    self.answerField.placeholder = tasks[0].answer
                }
            })
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let unwrapedTasks = tasks else { return }
        let firstTask = unwrapedTasks[0]
        
            textView.text = firstTask.taskDescription
            answerField.placeholder = firstTask.answer
        
        
//        let task = tasks[0] as Task
        guard tasks != nil else { return }
//        guard let task = tasks[0] as Task else { return }
        
    }
    
    @IBAction func checkTheAnswer(_ sender: UIButton) {
        
    }
    
}
