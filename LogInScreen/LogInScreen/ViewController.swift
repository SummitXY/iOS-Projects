//
//  ViewController.swift
//  LogInScreen
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var upView: UIView!
    @IBOutlet weak var loginScreen: UIView!
    
    @IBAction func toggleScreen(_ sender: Any) {
        if loginScreen.transform == .identity {
            UIView.animate(withDuration: 0.5, delay: 0, options: .allowUserInteraction, animations: {
                self.loginScreen.transform = CGAffineTransform(translationX: 0, y: -200)
                self.upView.transform = CGAffineTransform(scaleX: 100, y: 100)
            }, completion: nil)
            
        } else {
            UIView.animate(withDuration: 1, delay: 0, options: .allowUserInteraction, animations: {
                self.loginScreen.transform = .identity
                self.upView.transform = .identity
            }, completion: nil)
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //upButton.layer.borderWidth = 1
        
        upView.layer.cornerRadius = 20
    }


}

