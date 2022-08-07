//
//  AppDelegate.swift
//  MovieApp
//
//  Created by ProdMac on 5.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

   var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: SplashViewController())
        window?.makeKeyAndVisible()
        return true
    }


}

