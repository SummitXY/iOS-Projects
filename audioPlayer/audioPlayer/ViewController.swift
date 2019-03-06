//
//  ViewController.swift
//  audioPlayer
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer:AVAudioPlayer?

    @IBOutlet var btns: [UIButton]!
    
    @IBAction func chosePlayer(_ sender: UIButton) {
        let index = btns.firstIndex(of: sender) ?? 0
        if let url = Bundle.main.url(forResource: "\(index+1)", withExtension: "mp3") {
            //print(url)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("some thing wrong")
            }
            
        } else {
            print("no")
        }
        
        
        //print(url ?? "no")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

