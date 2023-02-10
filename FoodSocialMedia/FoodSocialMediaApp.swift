//
//  FoodSocialMediaApp.swift
//  FoodSocialMedia
//
//  Created by Gerdin Ventura on 2/10/23.
//

import SwiftUI
import Firebase

@main
struct FoodSocialMediaApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        let authViewModel: UserAuth = UserAuth()
        
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
                .onAppear() {
                    authViewModel.checkUserState()
                }
        }
    }
}
