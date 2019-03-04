//
//  SecondViewController.swift
//  Note
//
//  Created by apple on 2019/3/3.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    
    @IBOutlet weak var addItem: UITextField!
    
    @IBAction func saveItem(_ sender: Any) {
        let item = addItem.text!
        if !item.isEmpty {
            //var lists = [String]()
            if var storedData = UserDefaults.standard.object(forKey: "list") as? [String] {
                storedData.append(item)
                UserDefaults.standard.set(storedData, forKey: "list")
            }
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

