//
//  RegestrationView.swift
//  MC3LastVersion
//
//  Created by Abrar Ghandurah on 23/07/1445 AH.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullName = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            //Image
            Image("logoAla")
                .resizable()
                .frame(width: 200, height: 160)
                .padding(.vertical ,32)
            
            
            //form fields
            VStack(spacing: 24){
                
                //Email input
                InputView(text: $email, title: "البريد", placeHolder: "name@example.com")
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
                //Full Name input
                InputView(text: $fullName, title: "الاسم", placeHolder: "Enter your name")
                
                //Password input
                InputView(text: $password, title: "كلمة المرور", placeHolder: "Enter your password", isSecureField: true)
                
                //Confirm Password
                InputView(text: $confirmPassword, title: "تأكيد كلمة المرور", placeHolder: "Confirm your password" , isSecureField: true)
                
                
            }//vstack
            .padding(.horizontal)
            .padding(.top,12)
            
            //Button
            Button{
                print("Sign user up")
            } label: {
                HStack{
                    Text("تسجيل حساب جديد")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.left")
                }//HStack
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32 , height: 48)
            }//label of button
            .background(Color(.customBackground))
            .cornerRadius(10)
            .padding(.top,24)
            
            Spacer()
            
            Button{
                dismiss()
            } label: {
                HStack(spacing: 3){
                    Text("عندك حساب ؟")
                    Text("تسجيل الدخول")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .font(.system(size:14))
            }
        }//VStack
        .environment(\.layoutDirection,.rightToLeft)
    }//body
        
}//RegistrationView

#Preview {
    RegistrationView()
}
