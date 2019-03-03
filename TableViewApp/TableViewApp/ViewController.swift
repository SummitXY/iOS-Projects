//
//  ViewController.swift
//  TableViewApp
//
//  Created by apple on 2019/3/3.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    //MARK:- IBOutlet
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tableView: UITableView!
    //MARK:- IBAction
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        //print(sender.value)
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = String(Int(slider.value*10)*(indexPath.row+1))
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

