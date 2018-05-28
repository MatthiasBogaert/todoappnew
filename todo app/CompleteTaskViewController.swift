//
//  CompleteTaskViewController.swift
//  todo app
//
//  Created by De Winter Laura on 28/05/18.
//  Copyright © 2018 Comflow. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    @IBOutlet weak var taskLabel: UILabel!
    var task = Task()
    
    var previousVC = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if task.important {
            
            taskLabel?.text = "❗️\(task.name)"
        } else {
            taskLabel?.text = task.name
        }
    }

    
    @IBAction func completeTapped(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tableview.reloadData()
        navigationController!.popViewController(animated: true)
    }
  
    

}
