//
//  AppDelegate.swift
//  TestShop
//
//  Created by Artem Pavlov on 08.12.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: ShopViewController())
        window?.makeKeyAndVisible()
        return true
    }

  


}

