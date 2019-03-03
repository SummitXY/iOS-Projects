//
//  ViewController.swift
//  Timer
//
//  Created by apple on 2019/3/3.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()
    var currentTime = 0
    var isStart = false
    @IBOutlet weak var screen: UILabel!
    
    @IBAction func play(_ sender: Any) {
        if !isStart {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateScreen), userInfo: nil, repeats: true)
            isStart = true
        } else {
            timer.fireDate = NSDate.init() as Date
            timer.fireDate = Date.distantPast
        }
        
        
    }
    @IBAction func pause(_ sender: Any) {
        //timer.invalidate()
        timer.fireDate = Date.distantFuture
    }
    @IBAction func reset(_ sender: Any) {
        timer.invalidate()
        currentTime = 0
        screen.text = String(currentTime)
        isStart = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @objc func updateScreen(){
        currentTime += 1
        screen.text = String(currentTime)
    }


}

