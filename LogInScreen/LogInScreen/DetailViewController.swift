//
//  DetailViewController.swift
//  LogInScreen
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var users = [User]()
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        //navigationController?.popViewController(animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "DELETE") { (rowAction, indexPath) in
            self.deleteItem(indexPath)
            self.users.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        deleteAction.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        return [deleteAction]
    }
    
    func deleteItem(_ indexPath:IndexPath)  {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(users[indexPath.row])
        
        try? context.save()
    }
    

}
