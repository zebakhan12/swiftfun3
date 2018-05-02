//
//  CompleteViewController.swift
//  ToDo List
//
//  Created by Zeba Hashimi on 5/2/18.
//  Copyright © 2018 Zeba Khan. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()
    var selectedToDo : ToDoCoreData? = nil
    
    @IBOutlet weak var ToDoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ToDoLabel.text = selectedToDo?.name
    }
    
    @IBAction func completeTapped(_ sender: Any) {
       
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let theToDo = selectedToDo {
            context.delete(theToDo)
            navigationController?.popViewController(animated: true)
            }
        }

        /*
         var index = 0
         
         for toDo in previousVC.toDos {
         if toDo.name == selectedToDo.name {
         previousVC.toDos.remove(at: index)
         previousVC.tableView.reloadData()
         navigationController?.popViewController(animated: true)
         break
         }
         index += 1
         }
         
         */
    }
    
}
