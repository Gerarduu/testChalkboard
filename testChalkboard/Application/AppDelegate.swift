//
//  AppDelegate.swift
//  testChalkboard
//
//  Created by Gerard Riera  on 24/01/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupFirstScreen()
        // Override point for customization after application launch.
        return true
    }
    
    func setupFirstScreen() {
        Navigation.shared.setSplash()
    }
}

