//
//  PlaceCardView.swift
//  MC3LastVersion
//
//  Created by Lujain Abdullah Halabi Almeri on 24/07/1445 AH.
//

import SwiftUI

struct PlaceCardView: View {

    @State var name: String
    @State var price: String
    @State var img: String
    @State var category: String
    
    @AppStorage("stars") var stars: Int = Int.random(in: 3...5)
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 341, height: 80)
                .background(Color(red: 0.72, green: 0.71, blue: 0.69).opacity(0))
            
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.72, green: 0.71, blue: 0.69), lineWidth: 1)
                    
                )
            
            
            Image(img)
                .resizable()
                .scaledToFit()
                .frame(width: 77, height: 77 )
                .cornerRadius(8)
                
            
                .offset(x: -131 , y :0)
            
            Text(name)
                .font(
                    Font.custom("SF Arabic", size: 12)
                        .weight(.bold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
            
                .frame(width: 104, height: 19, alignment: .top)
                .offset(x:-30 , y: -20)
            Text(category)
                .font(
                    Font.custom("SF Arabic", size: 10)
                        .weight(.bold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.72, green: 0.71, blue: 0.69))
                .frame(width: 104, height: 19, alignment: .top)
                .offset(x: -40 , y :0)
            
            Image("mo")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 70 )
            
                .offset(x: -68 , y :16)
            
            Text(price)
                .font(
                    Font.custom("SF Arabic", size: 10)
                        .weight(.bold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.64, green: 0.63, blue: 0.63))
                .frame(width: 51, height: 19, alignment: .top)
                .offset(x: -40 , y :20)

            HStack {
                // Display dynamic star ratings with a randomly chosen count (3, 4, or 5) in reverse order

                
                ForEach((0..<5).reversed(), id: \.self) { index in
                    Image(systemName: "star.fill")
                        .foregroundColor(index >= (5 - stars) ? .yellow : .gray)
                        .font(.caption)
                        .frame(width: 15, height: 15)
                        .padding(.leading, -10)
                }
            }
                .offset(x: 131 , y :-25)
            
            
        }
    }
}

#Preview {
    PlaceCardView(name: "", price: "", img: "Quiet", category: "")
}
