//
//  ViewController.swift
//  NoteBook
//
//  Created by apple on 2019/3/3.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var inputText: UITextField!
    @IBAction func showNewScene(_ sender: Any) {
        performSegue(withIdentifier: "showNewScene", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showNewScene" {
            let controller = segue.destination as! NewViewController
            controller.msg = inputText.text
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    


}

