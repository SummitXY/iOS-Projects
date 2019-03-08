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
        
        //let imageView = UIView(frame: CGRect(x:0, y:0, width: 200, height: 200))
        let imageView = UIImageView(frame: CGRect(x: 36, y: 36, width: 256, height: 256))
//        imageView.layer.shadowColor = UIColor.gray.cgColor
//        imageView.layer.shadowOffset = CGSize(width: 10, height: 10)
//        imageView.layer.shadowOpacity = 0.5
//        imageView.layer.shadowRadius = 10
        
        let image = UIImage(named: "paper")
        //let patternColor = UIColor(patternImage: image!)
        //imageView.backgroundColor = patternColor
        imageView.image = image
//        let gradienLayer = CAGradientLayer()
//        gradienLayer.frame = imageView.frame
//
//        let redColor = UIColor.red.cgColor
//        let greenColor = UIColor.green.cgColor
//        let blueColor = UIColor.blue.cgColor
//
//        gradienLayer.colors = [redColor,blueColor,greenColor]
//
//        imageView.layer.addSublayer(gradienLayer)
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPress(_:)))
        
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(doubleTap(_:)))
        doubleTapGesture.numberOfTouchesRequired = 1
        doubleTapGesture.numberOfTapsRequired = 2
        
        imageView.isUserInteractionEnabled = true
        
        imageView.addGestureRecognizer(longPressGesture)
        imageView.addGestureRecognizer(doubleTapGesture)
        
        view.addSubview(imageView)
        
//        UIView.animate(withDuration: 4) {
//            imageView.transform = CGAffineTransform(translationX: 50, y: 50)
//        }
        
        
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

