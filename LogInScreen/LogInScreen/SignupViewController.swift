//
//  SignupViewController.swift
//  LogInScreen
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    var appDelegate:AppDelegate?
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func signUp(_ sender: Any) {
        if let context = appDelegate?.persistentContainer.viewContext {
            if !nameField.text!.isEmpty, !passwordField.text!.isEmpty {
                let user = User(context: context)
                
                user.name = nameField.text!
                user.password = passwordField.text!
                
                do {
                    try context.save()
                    print("save sucessfully")
                } catch {
                    print("can not save")
                }
            }
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
