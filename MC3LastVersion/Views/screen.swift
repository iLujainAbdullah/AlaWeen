////
////  screen.swift
////  t
////
////  Created by Lujain Abdullah Halabi Almeri on 15/07/1445 AH.
////
//
//import SwiftUI
//
//struct screen: View {
//    @StateObject private var model = Model()
//    
//    @State private var name: String = ""
//    //    @State private var minPrice: Int = 0
//    //    @State private var maxPrice: Int = ""
//    @State private var price: String = ""
//    @State private var rushHour: String = ""
//    @State private var accessability: Bool = false
//    @State private var music: Bool = false
//    @State private var overview: String = ""
//    @State private var link: String = ""
//    @State private var img: String = ""
//    @State private var category: String = ""
//    
//    var body: some View {
//        VStack{
//            List {
//                Section(title: Text("place Information")) {
//                    TextField("Name", text: $name)
//                    TextField("Overview", text: $overview)
//                    TextField("Link", text: $link)
//                    TextField("Image", text: $img)
//                    TextField("Category", text: $category)
//                    TextField("Rush hour", text: $rushHour)
//                }
//                Section(header: Text("Options")) {
//                    Toggle("Music", isOn: $music)
//                    Toggle("Accessibility", isOn: $accessability)
//                }
//                Section(header: Text("Price Range")) {
//                    //                        TextField("Min Price", text: $minPrice)
//                    //                            .keyboardType(.numberPad)
//                    
//                    TextField("Price", text: $price)
//                }
//                
//                Section {
//                    Button("Submit") {
//                        // Handle form submission
//                        
//                        if areAllFieldsFilled() {
//                            submit()
//                        } else {
//                            // Show an alert or provide feedback to the user about missing fields
//                            print("Please fill in all fields.")
//                        }
//                    }
//                }
//            }.padding(.top, 50).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//
////                 List(model.places, id: \.recordID) { item in
////                            Text("\(item.name), \(item.overview), \(item.price), \(item.category)")
////                        }
//                        .task {
//                            do{
//                                try await model.fetchItems(category: "مقاهي")
//                            }catch {
//                                print(error.localizedDescription)
//                            }
//                        }
//            
//            
//            
//            
//            //                .onSubmit {
//            //                    let element = place(name: name, minPrice: minPrice, maxPrice: maxPrice, rushHour: rushHour, accessability: accessability, music: music, overview: overview, link: link)
//            //                    print("done1")
//            //                    Task{
//            //                        print("in")
//            //                        try await model.addItem(element: element)
//            //                        print("done")
//            //                    }
//            //                    Spacer()
//            //                }
//            
//            
//                        List(model.places, id: \.recordID) { item in
//                            Text(item.name)
//                            Text(item.overview)
//                        }
//                        .task {
//                            do{
//                                try await model.fetchItems(category: "تمشية")
//                            }catch {
//                                print(error.localizedDescription)
//                            }
//                        }
//            
//        }
//        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//        
//    }
//    
//    func areAllFieldsFilled() -> Bool {
//            // Check if all required fields are filled
//            return !name.isEmpty && !overview.isEmpty && !link.isEmpty && !img.isEmpty && !category.isEmpty && !rushHour.isEmpty && !price.isEmpty
//        }
//
//    
//    
//    func submit(){
//        //    let min = Int(minPrice)
//        //    let max = Int(maxPrice)
//        //
//        let element = place(name: name, price: price, rushHour: rushHour, accessability: accessability, music: music, overview: overview, link: link, img: img, category: category)
//        print("done1")
//        Task {
//            print("in")
//            do {
//                try await model.addItem(element: element)
//                print("done")
//            } catch {
//                print("Error: \(error.localizedDescription)")
//            }
//            
//            name = ""
//            price = ""
//            rushHour = ""
//            accessability = false
//            music = false
//            overview = ""
//            link = ""
//            img = ""
//            category = ""
//            print("done")
//        }
//    }
//}
//
//
//
//#Preview {
//    screen()
//}
