//
//  FirstViewController.swift
//  Note
//
//  Created by apple on 2019/3/3.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var lists = [String]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        lists = UserDefaults.standard.object(forKey: "list") as? [String] ?? [String]()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(lists.count)
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = lists[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            lists.remove(at: indexPath.row)
            UserDefaults.standard.set(lists, forKey: "list")
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }


}

