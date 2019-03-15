//
//  ViewController.swift
//  UberClone
//
//  Created by apple on 2019/3/10.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit
import EasyBeautyView
import FirebaseAuth
class ViewController: UIViewController {

    @IBOutlet weak var userModelSwitch: UISwitch!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var buttonOutlet: UIButton!
    
    @IBAction func signinButton(_ sender: UIButton) {
        if !emailAddress.text!.isEmpty && !passwordTextField.text!.isEmpty {
            authService(email: emailAddress.text!, password: passwordTextField.text!)
        } else {
            displayAlert(title: "Sign In Error", message: "Please input your email and password")
            //performSegue(withIdentifier: "RiderSegue", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        EasyBeautyView.setViewCornerRadius(of: 20.0, with: loginView,buttonOutlet)
        EasyBeautyView.setTextFieldLeftIcon(of: "email", in: emailAddress, with: 35)
        EasyBeautyView.setTextFieldLeftIcon(of: "password", in: passwordTextField, with: 35)
    }
    
    func authService(email:String, password:String)  {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                let errorString = String(describing: (error! as NSError).userInfo["error_name"]!)
                print(errorString)
                if errorString == "ERROR_USER_NOT_FOUND" {
                    
                    Auth.auth().createUser(withEmail: email, password: password, completion: { (result, error) in
                        if error != nil {
                            self.displayAlert(title: "Create Account Error", message: error!.localizedDescription)
                        } else {
                            print("User already created")
                            if self.userModelSwitch.isOn {
                                print("userModelSwifth on")
                                self.doChangeRequest(displayname: "Rider")
                            } else {
                                print("userModelSwifth off ")
                                self.doChangeRequest(displayname: "Driver")
                            }
                            
                        }
                    })
                } else {
                    self.displayAlert(title: "Sign In Error", message: error!.localizedDescription)
                }
                
            } else {
                print("User already signin")
                if result?.user.displayName == "Rider"{
                    print("User already signin Rider")
                    self.performSegue(withIdentifier: "RiderSegue", sender: self)
                } else if result?.user.displayName == "Driver"{
                    print("User already signin Rider")
                    self.performSegue(withIdentifier: "DriverSegue", sender: self)
                }else {
                    print(result?.user.displayName)
                }
 
            }
        }
    }
    
    func displayAlert(title:String, message:String)  {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func doChangeRequest(displayname:String){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = displayname
        changeRequest?.commitChanges(completion: nil)
    }

}

