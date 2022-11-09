//
//  AppDelegate.swift
//  ToDoList
//
//  Created by Azimjon Abdurasulov on 07/11/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let mainVC = MainVC(nibName: "MainVC", bundle: nil)
        let navMainVC = UINavigationController(rootViewController: mainVC)
        window?.rootViewController = navMainVC
        window?.makeKeyAndVisible()
        return true
    }

    
}

