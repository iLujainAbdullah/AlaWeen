//
//  LoginView.swift
//  MC3LastVersion
//
//  Created by Abrar Ghandurah on 23/07/1445 AH.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    
//MARK: Creating Variables
    
    @State private var email = ""
    @State private var password = ""
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink(destination: MainView().navigationBarBackButtonHidden(true)
                ){
                Label("تخطي", systemImage: "")
                        .padding(.leading, 260.0)
                        .padding(.top,20)
                    .foregroundColor(.customBackground)
                }.navigationBarBackButtonHidden(true)


                
//MARK: Adding Logo
                //Image
                Image("logoAla")
                    .resizable()
                    .frame(width: 200, height: 160)
                    .padding(.vertical ,32)
                
                
//MARK: Form Fields
                
                //form fields
                VStack(spacing: 24){
                    InputView(text: $email, title: "Email Address", placeHolder: "name@example.com")
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    InputView(text: $password, title: "Password", placeHolder: "Enter your password", isSecureField: true)
                }//vstack
                .padding(.horizontal)
                .padding(.top,12)
                
                //sign in button
                Button{
                    print("Log user in..")
                } label: {
                    
                    HStack{
                        Text("تسجيل الدخول")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.left")
                    }//HStack
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32 , height: 47)
                }//label of button
                .background(Color(.customBackground))
                .cornerRadius(5)
                .padding(.top,28)
                .padding(.vertical)

                HStack{
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2 ) - 40  , height: 0.5)
                        .foregroundColor(.gray)
                    
                    Text("او")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40 , height: 0.5)
                        .foregroundColor(.gray)

                }//HStack
                

                //MARK: Sign-in with Apple
                SignInWithApple()
                Spacer()
                
                //sign up button
                NavigationLink{
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                }label: {
                    HStack(spacing: 3){
                        Text("ما عندك حساب ؟")
                        Text("تسجيل حساب")
                            .fontWeight(.bold)
                    }//HStack
                    .font(.system(size: 14))
                    .accentColor(.customBackground)
                    
                    
                }//Label
                
            }//vstack
            
        }//navigationStack
        .environment(\.layoutDirection,.rightToLeft)
        
    }//Body
        
}//LoginView
    

#Preview {
    LoginView()
}
