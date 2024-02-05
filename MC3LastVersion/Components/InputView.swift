//
//  InputView.swift
//  MC3LastVersion
//
//  Created by Abrar Ghandurah on 23/07/1445 AH.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeHolder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing:12 ){
            Text(title)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            
            if isSecureField{
                SecureField(placeHolder, text: $text)
                    .font(.system(size: 14))
            }else {
                TextField(placeHolder, text: $text)
                    .font(.system(size: 14))
            }
            Divider()
        }//vstack
    }//body
}//InputView

#Preview {
    InputView(text: .constant("") , title: "Email Address" , placeHolder: "name@example.com")
}
