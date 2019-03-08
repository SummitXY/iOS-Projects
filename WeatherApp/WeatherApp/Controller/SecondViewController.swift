//
//  SecondViewController.swift
//  WeatherApp
//
//  Created by apple on 2019/3/7.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit

protocol GetWeatherProtocol {
    func getWeather(of city:String)
}

class SecondViewController: UIViewController,UITextFieldDelegate {

    var delegate:GetWeatherProtocol?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var inputTextFiled: UITextField!
    @IBOutlet weak var summitButton: UIButton!
    
    @IBAction func returnButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func summitButtonAction(_ sender: Any) {
        if !inputTextFiled.text!.isEmpty {
            print(inputTextFiled.text!)
            delegate?.getWeather(of: inputTextFiled.text!)
            dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.layer.cornerRadius = 20
        summitButton.layer.cornerRadius = 15
    }
    
    override func viewWillAppear(_ animated: Bool) {
        inputTextFiled.becomeFirstResponder()
    }
    
    

}
