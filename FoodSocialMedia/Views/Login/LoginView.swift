//
//  LoginView.swift
//  FoodSocialMedia
//
//  Created by Gerdin Ventura on 2/10/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authViewModel: UserAuth
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            
            Button {
                authViewModel.createAccount(email: email, password: password)
            } label: {
                Text("Sign in")
            }
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
