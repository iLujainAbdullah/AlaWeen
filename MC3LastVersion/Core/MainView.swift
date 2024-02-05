//
//  ContentView.swift
//  MC3LastVersion
//
//  Created by Abrar Ghandurah on 23/07/1445 AH.
//

import SwiftUI

struct MainView: View {
    @State private var selectedIndex = 0
    //Variables for the custom tab bar
    @State var tab0_image = "CustomTabClicked"
    
    var body: some View {
        
        VStack{
            TabView{
                
                HomeView()
                    .tabItem{
                        Image(tab0_image)
                        Text("اكتشف")
                    }.tag(0)
                    .onAppear{self.tab0_image = "CustomTabClicked"}
                    .onDisappear{self.tab0_image = "CustomTabNotClicked"}

                FavView()
                    .tabItem{
                        Label("مفضلاتي", systemImage: "heart.fill")
                    }.tag(1)
                

                
                UserProfileView()
                    .tabItem{
                        Label("حسابي", systemImage: "person.crop.circle.fill")
                            
                    }.tag(2)


            }//tabView
        }//VStack
        .environment(\.layoutDirection,.rightToLeft)
    }//Body
        
}//MainView

#Preview {
    MainView()
}
