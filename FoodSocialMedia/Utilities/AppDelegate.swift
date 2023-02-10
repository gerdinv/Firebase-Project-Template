//
//  AppDelegate.swift
//  FoodSocialMedia
//
//  Created by Gerdin Ventura on 2/10/23.
//

import Foundation
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        return true
    }
    
}
