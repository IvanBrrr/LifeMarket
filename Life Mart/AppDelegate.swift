//
//  AppDelegate.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 11/06/21.
//

import UIKit
import YandexMapsMobile

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        YMKMapKit.setApiKey("c6fce5d7-b16e-4be0-a755-f37fa509991e")

        self.window?.rootViewController = HomeVC(viewModel: HomeViewModel())
        self.window?.makeKeyAndVisible()
        
        return true
    }


}

