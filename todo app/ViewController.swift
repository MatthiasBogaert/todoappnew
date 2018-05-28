//
//  ViewController.swift
//  todo app
//
//  Created by De Winter Laura on 25/05/18.
//  Copyright © 2018 Comflow. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableview: UITableView!

    var tasks : [Task] = []
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        tasks = makeTasks()
        
        tableview.dataSource = self
        tableview.delegate = self
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️\(task.name)"
        } else {
         cell.textLabel?.text = task.name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
        
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "gaan lopen"
        task1.important = true
        
        let task2 = Task()
        task2.name = "hond uitlaten"
        task2.important = false
        
        let task3 = Task()
        task3.name = "werken"
        task3.important = true
        
        return [task1, task2, task3]
    }

    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue"{
            
        let nextVC = segue.destination as!
        CreateTaskViewController
        nextVC.previousVC = self
        }
        if segue.identifier == "selectTaskSegue"{
        let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
        }
        
    }
    
}


