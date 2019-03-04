//
//  ViewController.swift
//  twitterScreen
//
//  Created by apple on 2019/3/4.
//  C/Users/apple/Developer/iOS_projects/twitterScreen/twitterScreen/Base.lproj/Main.storyboardopyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let logo = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor(red: 29/155, green: 161/255, blue: 242/255, alpha: 1)
        
        logo.image = UIImage(named: "twitter")
        logo.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        logo.center = view.center
        view.addSubview(logo)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5, animations: {
            self.logo.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
            self.logo.center = self.view.center
        }) { (finished) in
            UIView.animate(withDuration: 0.5, animations: {
                self.logo.frame = CGRect(x: 0, y: 0, width: 1000, height: 1000)
                self.logo.center = self.view.center
                self.view.alpha = 0
            })
        }
    }


}

