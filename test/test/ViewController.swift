//
//  ViewController.swift
//  test
//
//  Created by apple on 2019/3/7.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Start...")
        
        let group = DispatchGroup()
        let globalQueue = DispatchQueue.global()
        
        globalQueue.async(group: group, execute: DispatchWorkItem{
            print("1")
        })
        globalQueue.async(group: group, execute: DispatchWorkItem{
            print("2")
        })
        group.notify(queue: globalQueue, work: DispatchWorkItem{
            print("End...")
        })
        globalQueue.async(group: group, execute: DispatchWorkItem{
            print("3")
        })
        globalQueue.async(group: group, execute: DispatchWorkItem{
            print("4")
        })
        globalQueue.async(group: group, execute: DispatchWorkItem{
            print("5")
        })
        globalQueue.async(group: group, execute: DispatchWorkItem{
            print("6")
        })
        globalQueue.async(group: group, execute: DispatchWorkItem{
            print("7")
        })
        globalQueue.async(group: group, execute: DispatchWorkItem{
            print("8")
        })
        globalQueue.async(group: group, execute: DispatchWorkItem{
            print("9")
        })
        globalQueue.async(group: group, execute: DispatchWorkItem{
            print("10")
        })
        globalQueue.async(group: group, execute: DispatchWorkItem{
            print("11")
        })
        
        
    }
    
    @objc func longPress(_ gesture : UILongPressGestureRecognizer){
        if gesture.state == .began{
            let alert = UIAlertController(title: "Information", message: "Long Message", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(OKAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func doubleTap(_ gesture : UITapGestureRecognizer){
        let alert = UIAlertController(title: "Information", message: "Double Tap", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion: nil)
    }

}

