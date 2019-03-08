//
//  ViewController.swift
//  WeatherApp
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class ViewController: UIViewController,GetWeatherProtocol {
    //MARK:- Protocol
    func getWeather(of city: String) {
        let inputs = ["q":city,"appid":appid]
        SVProgressHUD.show()
        getWeatherData(url: openWeatherPage, inputs: inputs)
    }
    
    let weatherDataModel = WeatherDataModel()
    let openWeatherPage = "http://api.openweathermap.org/data/2.5/weather"
    //let newURL = "http://t.weather.sojson.com/api/weather/city/101030100"
    let appid = "a6182bb02891bb719986966ddc5614a6"
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        // Do any additional setup after loading the view, typically from a nib.
        //let longitude = "114"
        //let latitude = "23"
        let city = "BEIJING"
        //let inputs = ["lon":longitude,"lat":latitude,"appid":appid]
        let inputs = ["q":city,"appid":appid]
        
        SVProgressHUD.showInfo(withStatus: "Loading...")
        getWeatherData(url: openWeatherPage, inputs: inputs)
        //updateUI()
        
        imageView.contentMode = .scaleAspectFit
        
        
    }
    
    func getWeatherData(url:String, inputs:[String:String])  {
        Alamofire.request(url, method: .get, parameters: inputs, encoding: URLEncoding.default, headers: nil).responseJSON { (reponse) in
            if reponse.result.isSuccess {
                //print("yes")
                let weatherJSONData = JSON(reponse.result.value)
                self.updateWeatherData(jsonData: weatherJSONData)
                //print(weatherJSONData)
            } else {
                print("no")
            }
        }
        //print("test")
    }
    
    func updateWeatherData(jsonData:JSON)  {
        
        weatherDataModel.temperature = jsonData["main"]["temp"].int  ?? -1000
        weatherDataModel.city = jsonData["name"].string ?? "No Data"
        weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition: jsonData["weather"][0]["id"].int ?? -1)
        
        print(weatherDataModel.temperature)
        print(weatherDataModel.city)
        print(weatherDataModel.weatherIconName)
        
        updateUI()
        
    }
    
    func updateUI()  {
        if (weatherDataModel.temperature == -1000) {
            tempLabel.text = "No Data"
        } else {
            tempLabel.text = String(weatherDataModel.temperature - 273 ) + "˚"
        }
        imageView.image = UIImage(named: weatherDataModel.weatherIconName)
        
        cityLabel.text = String(weatherDataModel.city)
        
        SVProgressHUD.dismiss()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSecondPage" {
            let destination = segue.destination as! SecondViewController
            destination.delegate = self
        }
    }


}

