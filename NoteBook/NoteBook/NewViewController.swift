//
//  NewViewController.swift
//  NoteBook
//
//  Created by apple on 2019/3/3.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    var msg:String?
    @IBOutlet weak var message: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        message.text = msg
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
