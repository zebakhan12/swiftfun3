//
//  AddToDoViewController.swift
//  ToDo List
//
//  Created by Zeba Khan on 5/1/18.
//  Copyright © 2018 Zeba Khan. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {

    var previousVC = ToDoTableViewController()
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addTapped(_ sender: Any) {
        
/*
        let toDo = ToDo()
        
        if let titleText = titleTextField.text {
            toDo.name = titleText
            toDo.important = importantSwitch.isOn
            
            previousVC.toDos.append(toDo)
            previousVC.tableView.reloadData()
            
            navigationController?.popViewController(animated: true)
        }
*/
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
        
            let toDo = ToDoCoreData(entity: ToDoCoreData.entity(), insertInto: context)
        
            if let titleText = titleTextField.text {
                toDo.name = titleText
                toDo.important = importantSwitch.isOn
            }
            
            try? context.save()
            
            navigationController?.popViewController(animated: true)

        }
    
    }
 
}
