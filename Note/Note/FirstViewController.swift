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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lists = UserDefaults.standard.object(forKey: "list") as? [String] ?? [String]()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = lists[indexPath.row]
        return cell
    }


}

