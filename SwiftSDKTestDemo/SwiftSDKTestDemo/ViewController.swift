//
//  ViewController.swift
//  SwiftSDKTestDemo
//
//  Created by apple on 2019/3/10.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit
import SwiftSDK
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var test = SwiftSDKClass()
        test.getName()
    }


}

