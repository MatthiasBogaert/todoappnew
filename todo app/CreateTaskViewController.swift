//
//  CreateTaskViewController.swift
//  todo app
//
//  Created by De Winter Laura on 25/05/18.
//  Copyright © 2018 Comflow. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    
    
    @IBOutlet weak var importantSwitch: UISwitch!
    @IBOutlet weak var TaskNameTextField: UITextField!
    
    var previousVC = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
        
        // Create task from outlet information
        
        let task = Task()
        task.name = TaskNameTextField.text!
        task.important = importantSwitch.isOn
        
        
        // Add new task to array in previous viewcontroller
        
        previousVC.tasks.append(task)
        previousVC.tableview.reloadData()
        
        navigationController!.popViewController(animated: true)
        
        
    }
   
}
