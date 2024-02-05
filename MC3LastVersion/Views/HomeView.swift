//
//  HomeView.swift
//  MC3LastVersion
//
//  Created by Abrar Ghandurah on 23/07/1445 AH.
//

import SwiftUI

struct HomeView: View {
    //Creating an array for categories
    let CategoriesArray = ["الكل","تمشية","إنجاز مهام","مطاعم","مقاهي","ترفيه"]
    @State var searchText = ""
    @State var selectedCategoryIndex: Int?
    @StateObject var model = Model()
    @State var selectedPlace: place?
    @State var tappedCategory = ""
    @AppStorage("stars") var stars: Int = Int.random(in: 3...5)

    
    var body: some View {
        
        NavigationView{
            VStack{
                HStack{
                    
                    Text("")
                    Text("وين ودّك تروح اليوم؟")
                        .font(
                            Font.custom("SF Arabic", size: 25)
                                .weight(.bold)
                        )
                        .foregroundColor(.customBackground)
                        .padding(.trailing,140)
                        .padding()
                    
                }
                //HStack
                
                
                //Replace with Searchable
                TextField(" مقاهي، مطاعم ، جلسات خارجية", text: $searchText)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .frame(width:350)
                    .padding(.bottom, 150)
                
                
                
                
                //MARK: First Section
                Text("الهبّة")
                    .font(
                        Font.custom("SF Arabic", size: 25)
                            .weight(.semibold)
                    )
                    .offset(x: -140 , y: -130)
                    .onAppear{
                        Task {
                            do{
                                try await model.fetchAllItems()
                                // try await model.fetchAllCafes()
                                try await model.fetchItems(category: "مقاهي" )
                                try await model.fetchItems(category: "تمشية" )
                                try await model.fetchItems(category: "مطاعم" )
                                try await model.fetchItems(category: "إنجاز مهام" )
                                try await model.fetchItems(category: "ترفيه" )
                            }catch {
                                print(error.localizedDescription)
                            }
                        }
                    }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: -5){
                        
                        ForEach(model.places.prefix(5), id: \.recordID) { item in
                            NavigationLink(destination: DetailsView( name: item.name, img: item.img,acceessability: item.accessability, music:item.music, price: item.price, overview: item.overview, rashHour: item.rushHour)) {
                                TrendCardView(name: item.name, img: item.img)
                            }
                        }
                        
                        
                    }
                }.padding(.top, -140)
                //ScrollView
                //}forEach
                
                
                
                
                //MARK: Second Section
                
                Text("التصنيفات")
                    .font(
                        Font.custom("SF Arabic", size: 25)
                            .weight(.semibold)
                    )
                    .offset(x: -125 , y: 10)
                    .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(0..<CategoriesArray.count) { index in
                            Text(CategoriesArray[index])
                                .font(Font.custom("SF Arabic", size: 12))
                                .multilineTextAlignment(.center)
                                .foregroundColor((index == selectedCategoryIndex || (index == 0 && selectedCategoryIndex == nil)) ? .white : .black)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 10)
                                .background(
                                    RoundedRectangle(cornerRadius: 14)
                                        .fill((index == 0 && selectedCategoryIndex == nil) ? Color.customBackground : (index == selectedCategoryIndex ? Color.customBackground : Color.white))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 14)
                                                .stroke(index == selectedCategoryIndex ? Color.accentColor : Color.customBackground, lineWidth: 1)
                                        )
                                        .cornerRadius(14)
                                )
                            
                            
                                .onTapGesture {
                                    selectedCategoryIndex = index
                                    print(selectedCategoryIndex!)
                                }
                        }
                        
                    }.padding(.leading)
                    
                }//ScrollView
                
                
                ScrollView(.vertical, showsIndicators: false)
                {
                    VStack{
                        if (selectedCategoryIndex == 1){
                            ForEach(model.goingOut, id: \.recordID) { item in
                                NavigationLink(destination: DetailsView(name: item.name, img: item.img, acceessability: item.accessability, music: item.music, price: item.price, overview: item.overview, rashHour: item.rushHour)){
                                    PlaceCardView(name: item.name, price: item.price, img: item.img, category: item.category)
                                    
                                }
                            }
                        }
                        else if (selectedCategoryIndex == 2){
                            ForEach(model.tasks, id: \.recordID) { item in
                                NavigationLink(destination: DetailsView(name: item.name, img: item.img, acceessability: item.accessability, music: item.music, price: item.price, overview: item.overview, rashHour: item.rushHour)){
                                    PlaceCardView(name: item.name, price: item.price, img: item.img, category: item.category)
                                    
                                }
                            }
                        }  else if (selectedCategoryIndex == 3){
                            ForEach(model.restaurants, id: \.recordID) { item in
                                NavigationLink(destination: DetailsView(name: item.name, img: item.img, acceessability: item.accessability, music: item.music, price: item.price, overview: item.overview, rashHour: item.rushHour)){
                                    PlaceCardView(name: item.name, price: item.price, img: item.img, category: item.category)
                                    
                                }
                            }
                        }  else if (selectedCategoryIndex == 4){
                            ForEach(model.cafes, id: \.recordID) { item in
                                NavigationLink(destination: DetailsView(name: item.name, img: item.img, acceessability: item.accessability, music: item.music, price: item.price, overview: item.overview, rashHour: item.rushHour)){
                                    PlaceCardView(name: item.name, price: item.price, img: item.img, category: item.category)
                                    
                                }
                            }
                        }   else if (selectedCategoryIndex == 5){
                            ForEach(model.entertainment, id: \.recordID) { item in
                                NavigationLink(destination: DetailsView(name: item.name, img: item.img, acceessability: item.accessability, music: item.music, price: item.price, overview: item.overview, rashHour: item.rushHour)){
                                    PlaceCardView(name: item.name, price: item.price, img: item.img, category: item.category)
                                    
                                }
                            }
                        }
                        else{
                            //model.fetchItems(category: CategoriesArray[index])
                            ForEach(model.places, id: \.recordID) { item in
                                //Text("\(item.name), \(item.overview), \(item.price), \(item.category)")
                                NavigationLink(destination: DetailsView(name: item.name, img: item.img, acceessability: item.accessability, music: item.music, price: item.price, overview: item.overview, rashHour: item.rushHour)){
                                    PlaceCardView(name: item.name, price: item.price, img: item.img, category: item.category)
                                    
                                }
                            }
                        }
                    }.padding()
                }
            }
            
        }//vstack
        .environment(\.layoutDirection,.rightToLeft)
    }//body
    
}//HomeView


#Preview {
    HomeView()
    
}

