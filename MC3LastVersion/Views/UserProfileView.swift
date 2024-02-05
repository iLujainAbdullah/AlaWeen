//
//  UserProfileVIew.swift
//  MC3LastVersion
//
//  Created by Abrar Ghandurah on 23/07/1445 AH.
//

import SwiftUI

struct UserProfileView: View {

    var body: some View {
        List{
            
            Section{
                HStack {
                    Text(User.MOCK_User.initials)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray3))
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text(User.MOCK_User.fullName)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top,4)
                        
                        Text(User.MOCK_User.email)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }//VStack
                }//HStack
                
            }//section
            Section("عام"){
                HStack{
                    SettingsRowView(imageName: "gear", title: "الاصدار", tintColor: Color(.systemGray))
                    Spacer()
                    
                    Text("1.0.0")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                }
                
            }//section
            Section("الحساب"){
                
                Button{
                    print("Sign out..")
                }label:{
                    SettingsRowView(imageName: "arrow.left.circle.fill", title: "تسجيل الخروج", tintColor: .red)
                }
                
                
                Button{
                    print("Delete Account")
                }label: {
                    SettingsRowView(imageName: "xmark.circle.fill", title: "حذف الحساب", tintColor: .red)
                }
                
                
            }//section
        }//List
        .environment(\.layoutDirection,.rightToLeft)
    }//Body
}//UserProfileView

#Preview {
    UserProfileView()
}
