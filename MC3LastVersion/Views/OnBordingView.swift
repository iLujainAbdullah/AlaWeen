import SwiftUI
import CoreML


struct OnBordingView: View {
    @State var current = 0
    @State private var isActive: Bool = false
    
    @State private var category: String?
    @State private var subCategory1: String?
    @State private var subCategory2: String?
    @State private var userSelection: String?
    @State private var isNavigationActive = false
    

    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            self.current = 1
                        }) {
                            NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)) {
                                Text("تخطي")
                                    .padding()
                                    .foregroundColor(Color("OurPurple"))
                            }
                        }
                    }
                    
                    TabView(selection: $current) {
                        
                        VStack {
                            Image("ala") // logo
                            
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 250)
                                
                            Text(" هلا فيك، في تطبيق على وين؟\n تجربتك معنا على مزاجك! ")
                                .font(.system(size: 22))
                                .foregroundColor(Color("OurPurple"))
                             
                                .padding()
                           // Spacer()
                        }
                        .tag(0)
                        
                        
                        VStack {
                            ZStack {
                                VStack {
                                    Text("خلينا نعرف اختياراتك ونخصص لك تجربة تناسبك")
                                        .font(.system(size: 25))
                                        .bold()
                                        .foregroundColor(Color("OurPurple"))
                                    .padding()
                                    
                                    Spacer()
                                    
                                    if category == nil {
                                        OptionsView(options: ["ترفيه", "إنجاز"]) { selectedOption in
                                            category = selectedOption
                                        }
                                    }
                                    
                                    if category == "ترفيه" {
                                        if subCategory1 == nil {
                                            OptionsView(options: ["تمشية", "مأكولات"]) { selectedOption in
                                                subCategory1 = selectedOption
                                            }
                                        }
                                        
                                        if subCategory1 == "تمشية" {
                                            if subCategory2 == nil {
                                                OptionsView(options: ["ميزانية أول الشهر", "ميزانية آخر الشهر"]) { selectedOption in
                                                    subCategory2 = selectedOption
                                                    updateUserSelection()
                                                }
                                            }
                                        }
                                        
                                        if subCategory1 == "مأكولات" {
                                            if subCategory2 == nil {
                                                OptionsView(options: ["مقهى", "مطعم"]) { selectedOption in
                                                    subCategory2 = selectedOption
                                                    updateUserSelection()
                                                }
                                            }
                                        }
                                    }
                                    
                                    if category == "إنجاز" {
                                        if subCategory1 == nil {
                                            OptionsView(options: ["أداء المهام", "الاجتماعات"]) { selectedOption in
                                                subCategory1 = selectedOption
                                            }
                                        }
                                        
                                        if subCategory1 == "أداء المهام" {
                                            if subCategory2 == nil {
                                                OptionsView(options: ["مهيأ", "مخصصص"]) { selectedOption in
                                                    subCategory2 = selectedOption
                                                    updateUserSelection()
                                                }
                                            }
                                        }
                                        
                                        if subCategory1 == "الاجتماعات" {
                                            if subCategory2 == nil {
                                                OptionsView(options: ["رسمي", "غير رسمي"]) { selectedOption in
                                                    subCategory2 = selectedOption
                                                    updateUserSelection()
                                                }
                                            }
                                        }
                                    }
                                    
                                    // Display user selection
                                    if let _ = userSelection {
                                        Button("عرض التحديد") {
                                            isNavigationActive = true
                                        }
                                        .padding()
                                        .background(NavigationLink("", destination: ResultView(userSelection: userSelection ?? ""), isActive: $isNavigationActive).hidden())
                                    }
                                    
                                    Spacer()
                                }
                            }
                        }
                        .tag(1)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    
                    HStack {
                        ForEach(0..<2, id: \.self) { item in
                            if (item == current) {
                                Rectangle().frame(width: 20, height: 10).cornerRadius(10).foregroundColor(Color("OurPurple"))
                            } else {
                                Circle().frame(width: 10, height: 10).foregroundColor(.gray)
                            }
                        }
                    }
                    .padding()
                    
                    Button(action: {
                        if (self.current < 1) {
                            self.current += 1
                        } else if (self.current == 1) {
                            isActive.toggle()
                        }
                    }) {
                        Text(current < 1 ? "التالي" : "ابدأ")
                            .padding(16)
                            .frame(width: 250)
                            .background(Color("OurPurple"))
                            .cornerRadius(16)
                            .padding(.horizontal, 16)
                            .foregroundColor(.white)
                            .padding(.bottom, 30)
                    }
                    .background(NavigationLink("", destination: Text("").navigationBarBackButtonHidden(true), isActive: $isActive))
                }
            }
        }
        .environment(\.layoutDirection, .rightToLeft)
    }
    
    private func updateUserSelection() {
        userSelection = "\(localized(category ?? "")), \(localized(subCategory1 ?? "")), \(localized(subCategory2 ?? ""))"
        
        
    }
    
    private func localized(_ word: String) -> String {
        // Replace Arabic words with English translations
        switch word {
        case "ترفيه":
            return "entertainment"
        case "إنجاز":
            return "productivity"
        case "تمشية":
            return "going out"
        case "مأكولات":
            return "food"
        case "ميزانية أول الشهر":
            return "fbudget"
        case "ميزانية آخر الشهر":
            return "lbudget"
        case "مقهى":
            return "cafe"
        case "مطعم":
            return "restaurant"
        case "أداء المهام":
            return "tasks"
        case "الاجتماعات":
            return "meeting"
        case "مهيأ":
            return "prepared"
        case "مخصص":
            return "equipped"
        case "رسمي":
            return "formal"
        case "غير رسمي":
            return "informal"
        default:
            return word
        }
    }
}

struct OptionsView: View {
    var options: [String]
    var onSelection: (String) -> Void
    
    var body: some View {
        HStack {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    onSelection(option)
                }) {
                    Text(option)
                        .font(.system(size: 26))
                        .foregroundColor(Color("OurPurple"))
                        .padding()
                        .frame(width: 160, height: 170.0)
                        .background(Color.white)
                        .cornerRadius(25)
                        .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 2)
                }
                .padding(.horizontal, 10)
                
            }
        }
    }
}

struct ResultView: View {
    var userSelection: String
    @StateObject var model = Model()
    
    var body: some View {
        VStack {
           // let cat = classify(input: userSelection)
            Text(classify(input: userSelection))
            
                .padding()
//            //Test
//                .onAppear(){
//                    Task {
//                        do{
//                            try await model.fetchItems(category: cat )
//                        }catch {
//                            print(error.localizedDescription)
//                        }
//                    }
//                }
//            ForEach(model.places.prefix(1), id: \.recordID) { item in
//                NavigationLink(destination: DetailsView( name: item.name, img: item.img,acceessability: item.accessability, music:item.music, price: item.price, overview: item.overview, rashHour: item.rushHour)) {
//                    TrendCardView(name: item.name, img: item.img)
//                }
//            }
            
            
            NavigationLink("إبدا", destination: MainView())
        }
        .padding()
        .navigationBarBackButtonHidden(true) // This line hides the back button
    }

}

//MARK: Text Classifier Model function

private func classify(input: String) -> String {
        guard let model = try? TextClassifer(configuration: .init()),
              let prediction = try? model.prediction(text: input) else {
            return "Something went wrong"
        }
        
        return prediction.label
    }







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnBordingView()
    }
}
