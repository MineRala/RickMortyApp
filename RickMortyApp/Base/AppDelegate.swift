//
//  AppDelegate.swift
//  RickMortyApp
//
//  Created by Mine Rala on 30.04.2022.
//

import UIKit

// arama çubuğunda main'i aratabilirsin.
// programatic ui için infoplistte main içeren herşeyi sil. SceneDelegate sil, AppDelegate içini sil ve bu fonksiyonu ekle.
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        let rickMortyVC = RickMortyViewController(nibName: nil, bundle: nil)
        window?.rootViewController = rickMortyVC
        return true
    }
}

