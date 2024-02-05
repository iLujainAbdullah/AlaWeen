//
//  FavRow.swift
//  MC3Project
//
//  Created by Hasna Ahmad on 16/07/1445 AH.
//

import SwiftUI

struct FavRow: View {
    @State var placeName = "نمق كافية | Namq Cafe"
    @State var placeDes = "مقهى"
    
    var body: some View {
        
            HStack(){
                
                Text("")

                Button(action: {
                    
                }, label: {
                    
                    
                    
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundColor(Color("LikeColor"))
                    
                })
                
                Spacer()
                
                VStack(alignment:.trailing){
                    
                    
                    
                    Text(placeName)
                        .bold()
                    Text(placeDes)
                        .foregroundColor(.gray)

                }
                
                
                
                Image("7")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .cornerRadius(10)
                
            }
        
    }
}

#Preview {
    FavRow()
}
