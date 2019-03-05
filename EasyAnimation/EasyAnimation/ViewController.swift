//
//  ViewController.swift
//  EasyAnimation
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var orange: UIView!
    @IBOutlet weak var blue: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1, delay: 0, options: [.autoreverse,.repeat], animations: {
            self.orange.center.y += 400
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0.2, options: [.autoreverse,.repeat], animations: {
            self.blue.center.y += 400
        }, completion: nil)
    }


}

