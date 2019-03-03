//
//  ViewController.swift
//  DiceGame
//
//  Created by apple on 2019/3/3.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var dice1: UIImageView!
    @IBOutlet weak var dice2: UIImageView!
    @IBAction func roll(_ sender: Any) {
        updateDice()
    }
    func updateDice()  {
        let randomDiceKey1 = Int(arc4random_uniform(6))
        let randomDiceKey2 = Int(arc4random_uniform(6))
        
        dice1.image = UIImage(named: "dice"+String(randomDiceKey1+1))
        dice2.image = UIImage(named: "dice"+String(randomDiceKey2+1))
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateDice()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake{
            updateDice()
        }
    }


}

