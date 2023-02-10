//
//  UserAuth.swift
//  FoodSocialMedia
//
//  Created by Gerdin Ventura on 2/10/23.
//

import Foundation
import FirebaseAuth

final class UserAuth: ObservableObject {
    
    let auth = Auth.auth()
    
    var user: User? {
        didSet {
            objectWillChange.send()
        }
    }
    
    func createAccount(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error creating account: \(error.localizedDescription)")
                return
            }
        }
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            strongSelf.user = authResult?.user
            print("User info: \(String(describing: authResult))")
        }
    }
    
    func checkUserState() {
        auth.addStateDidChangeListener { [weak self] _, user in
            guard let self = self else {
                return
            }
            
            DispatchQueue.main.async {
                self.user = user
            }
        }
    }
    
    func signOut() {
        do {
            try auth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
