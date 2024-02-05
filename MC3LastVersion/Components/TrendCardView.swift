//
//  TrendCardView.swift
//  MC3LastVersion
//
//  Created by Lujain Abdullah Halabi Almeri on 24/07/1445 AH.
//

import SwiftUI

struct TrendCardView: View {
    @State var name: String
    @State var img: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 140, height: 140)
                .background(
                    Image(img)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 140, height: 140)
                        .clipped()
                        .opacity(0.9)
                )
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                .offset(x: 5 , y:10 )

            Rectangle()

                .foregroundColor(.clear)
                .frame(width: 160, height: 37)
                .background(.white.opacity(0.8))
                .cornerRadius(10)
                .offset(x:6, y:55 )
            
            Text(name)
                .padding(.top,100)
                .foregroundColor(.black)
            
            
            
            
        }
    }
}

#Preview {
    TrendCardView(name: "name", img: "mg5")
}
