//
//  AppDelegate.swift
//  LogInScreen
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit
import CoreData
import MovingBackgroundImage
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        let bgImageView = UIImageView()
//        bgImageView.image = UIImage(named: "bgTaylor")
//        bgImageView.frame.size.width = bgImageView.image!.size.width
//        bgImageView.frame = CGRect(x: 0, y: 0, width: bgImageView.image!.size.width, height: window!.frame.height)
//        bgImageView.contentMode = .scaleAspectFill
//        window?.addSubview(bgImageView)
//
//
//        UIView.animate(withDuration: 10, delay: 0.8, options: [.repeat,.autoreverse], animations: {
//            bgImageView.center.x -= (bgImageView.frame.width - self.window!.frame.width)
//        }, completion: nil)
        MovingBackgroundImage().move(window: window!, backgroundImageName: "bgTaylor", animationDuration: 10.0)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "LogInScreen")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }


}

