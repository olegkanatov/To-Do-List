//
//  TableViewController.swift
//  ToDoList
//
//  Created by Oleg Kanatov on 10.09.21.
//

import UIKit

class TableViewController: UITableViewController {
    
    var tasks: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSetup()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
    
    
    //-------------------------------------------------
    // MARK: - Content
    //-------------------------------------------------
    
    func viewSetup() {
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        
        self.title = "To-Do list"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonItem.SystemItem.add,
            target: self,
            action: #selector(saveTask)
        )
    }
    
    @objc func saveTask() {
        let alertController = UIAlertController(title: "New Task",
                                      message: "Please add a new task",
                                      preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { action in
            let textField = alertController.textFields?.first
            if let newTask = textField?.text {
                self.tasks.insert(newTask, at: 0)
                self.tableView.reloadData()
            }
        }
        
        alertController.addTextField { _ in }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
}
