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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
        
        // Create task from outlet information
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        task.name = TaskNameTextField.text!
        task.important = importantSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        
        // Pop Back
        
        navigationController!.popViewController(animated: true)
        
        
    }
   
}
