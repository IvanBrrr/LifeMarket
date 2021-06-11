//
//  AppDelegate.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 11/06/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window?.rootViewController = SignInVC(viewModel: SignInViewModel())
        self.window?.makeKeyAndVisible()
        
        return true
    }


}

