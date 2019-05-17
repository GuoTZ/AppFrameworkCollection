//
//  AppDelegate.swift
//  AppFrameworkCollection
//
//  Created by DingYD on 2019/5/11.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.black
        let nav = UINavigationController.init(navigationBarClass: NavigationBar.self, toolbarClass: nil)
        nav.pushViewController(ViewController(), animated: true)
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
//        print()
        return true
    }
     
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {

        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "OPenUrlFilesName"), object: nil, userInfo: ["url":url])
        return true
    }


}

