//
//  ViewController.swift
//  LogInScreen
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit
import AVFoundation
import CoreData

class ViewController: UIViewController {

    var users = [User]()
    var appDelegate:AppDelegate?
    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var middelView: UIView!
    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var upView: UIView!
    @IBOutlet weak var loginScreen: UIView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBAction func signIn(_ sender: Any) {
        
        users = fetch() ?? [User]()
        //print(users)
        if users.count > 0 {
            if users.filter({$0.name == nameField.text! && $0.password == passwordField.text!}).count > 0 {
                performSegue(withIdentifier: "showSignIn", sender: nil)
            }
        }
    }
    
    @IBAction func toggleScreen(_ sender: Any) {
        if loginScreen.transform == .identity {
            UIView.animate(withDuration: 0.5, delay: 0, options: .allowUserInteraction, animations: {
                self.loginScreen.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height/2)
                self.upView.transform = CGAffineTransform(scaleX: 100, y: 100)
                self.mainTitle.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height/2)
                self.middelView.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height/4)
            }, completion: { finished in
                self.nameField.becomeFirstResponder()
            })
            
        } else {
            view.endEditing(true)
            UIView.animate(withDuration: 1, delay: 0, options: .allowUserInteraction, animations: {
                self.loginScreen.transform = .identity
                self.upView.transform = .identity
                self.mainTitle.transform = .identity
                self.middelView.transform = .identity
            
            }, completion: nil)
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //upButton.layer.borderWidth = 1
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
        mainTitle.layer.cornerRadius = 20
        signinBtn.layer.cornerRadius = 15
        signupBtn.layer.cornerRadius = 15
        upView.layer.cornerRadius = 25
        
        if let url = Bundle.main.url(forResource: "LoveStory", withExtension: ".mp3"){
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer.numberOfLoops = -1
                audioPlayer.play()
            } catch {
                print("no this music")
            }
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSignIn" {
            let controller = segue.destination as! DetailViewController
            controller.users = self.users
        }
    }
    
    func fetch() -> [User]? {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<User>(entityName:"User")
        fetchRequest.returnsObjectsAsFaults = false
        return try? context.fetch(fetchRequest)
        
    }


}

