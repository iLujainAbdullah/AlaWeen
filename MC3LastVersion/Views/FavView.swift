//
//  FavView.swift
//  MC3Project
//
//  Created by Hasna Ahmad on 16/07/1445 AH.
//

import SwiftUI


struct FavView: View {
    
    //Replace the array with feteched data from the places table
    @State private var favoritePlaces = ["نمق كافية | Namq Cafe", "فوم كافيه ", "شارك كافيه"]
    
    var body: some View {
        
        NavigationView {
            List(favoritePlaces, id: \.self) { place in
                FavRow(placeName: place)
            
                
            }.listStyle(PlainListStyle())
                .navigationBarTitle("مفضلاتي", displayMode: .inline )
            
        }  .environment(\.layoutDirection,.leftToRight)
    }
        
}


struct FavView_Previews: PreviewProvider {
    static var previews: some View {
        FavView()
    }
}

