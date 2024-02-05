//
//  SignInWithApple.swift
//  MC3LastVersion
//
//  Created by Abrar Ghandurah on 23/07/1445 AH.
//

import SwiftUI
import AuthenticationServices

struct SignInWithApple: View {
    //Allowing Dark mode for the sign-in with apple button
    @Environment(\.colorScheme) var colorScheme
    
    
    //Caching the data
    @AppStorage("email") var Appleemail: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userId") var userId: String = ""
    
    
    
    var body: some View {
        SignInWithAppleButton(.continue) { request in
            request.requestedScopes = [.fullName , .email]
        } onCompletion: { result in
            
            switch result {
            case .success(let auth):
                
                switch auth.credential {
                case let credential as ASAuthorizationAppleIDCredential:
                    let userID = credential.user
                    let email = credential.email
                    let firstName = credential.fullName?.givenName
                    let lastName = credential.fullName?.familyName
                    
                    self.userId = userID
                    self.Appleemail = email ?? ""
                    self.firstName = firstName ?? ""
                    self.lastName  = lastName ?? ""
                default:
                    break
                }
            case .failure(let error):
                print("error")
            }
        }
        
        //Changing the style of the button in dark - light mode
        .signInWithAppleButtonStyle(colorScheme == .dark ? .white : .black)
        .frame(width: UIScreen.main.bounds.width - 32 , height: 48)
        .padding()
        .cornerRadius(5)
    }
}

#Preview {
    SignInWithApple()
}
