//
//  ViewController.swift
//  RemberMe
//
//  Created by apple on 2019/3/3.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var msgText: UILabel!
    //MARK:- IBAction
    @IBAction func save(_ sender: Any) {
        let name = String(inputText.text!)
        if !name.isEmpty {
            UserDefaults.standard.set(name, forKey: "name")
            msgText.textColor = UIColor.red
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let name = UserDefaults.standard.object(forKey: "name") as? String {
            inputText.placeholder = name
        }
    }


}

