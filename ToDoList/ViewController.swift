//
//  ViewController.swift
//  The Night Porter
//
//  Created by Dmitry Grebenyuk on 5/9/20.
//  Copyright © 2020 Dmitry Grebenyuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath)
//        cell?.accessoryType = .checkmark
//        cell?.textLabel?.textColor = .lightGray
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "Complete") {
            (_: UIContextualAction, _: UIView, isCompleted: (Bool) -> Void) in
            switch indexPath.section {
            case 0:
                self.dailyTasks[indexPath.row].isCompleted = true
            case 1:
                self.weeklyTasks[indexPath.row].isCompleted = true
            case 2:
                self.monthlyTasks[indexPath.row].isCompleted = true
            default:
                print("Something wrong")
            }
            
            tableView.reloadData()
            isCompleted(true)
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return dailyTasks.count
        case 1:
            return weeklyTasks.count
        case 2:
            return monthlyTasks.count
        default:
            return -1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        
        var task: Task
        
        switch indexPath.section {
        case 0:
            task = dailyTasks[indexPath.row]
        case 1:
            task = weeklyTasks[indexPath.row]
        case 2:
            task = monthlyTasks[indexPath.row]
        default:
            print("Something wrong")
            task = dailyTasks[indexPath.row]
        }
        
        cell.textLabel?.text = task.task
        if task.isCompleted {
            cell.accessoryType = .checkmark
            cell.textLabel?.textColor = .lightGray
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Daily Tasks"
        case 1:
            return "Weekly Tasks"
        case 2:
            return "Monthly Tasks"
        default:
            return "Error"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var dailyTasks = [Task(task: "Feed the cat", type: .daily, isCompleted: true),
                      Task(task: "Walk the dog", type: .daily),
                      Task(task: "Walk the dog1", type: .daily),
                      Task(task: "Walk the dog2", type: .daily),
                      Task(task: "Walk the dog3", type: .daily),
                      Task(task: "Walk the dog4", type: .daily),
                      Task(task: "Walk the dog5", type: .daily),
                      Task(task: "Walk the dog6", type: .daily),
                      Task(task: "Walk the dog7", type: .daily),
                      Task(task: "Walk the dog8", type: .daily),
                      Task(task: "Walk the dog9", type: .daily),
                      Task(task: "Walk the dog10", type: .daily),
                      Task(task: "Walk the dog11", type: .daily)]
    var weeklyTasks = [Task(task: "Clean the room", type: .weekly),
                       Task(task: "Do the laundry", type: .weekly)]
    var monthlyTasks = [Task(task: "Do nothing", type: .monthly)]
}

