//
//  MainView.swift
//  PizzaApp
//
//  Created by Abishan Parameswaran on 2023-03-03.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var dataStore: DataStore = DataStore()
    @State private var foodType = 0
    @State private var isSheetShowing:Bool = false
    @State private var isModalOpen: Bool = false
    //@ObservedObject var pizzaViewModel: PizzaViewModel = PizzaViewModel()

    @State private var newPizza = PizzaModel(name: "", ingredients: "", imageName: "", thumbnailName: "", type: "")
    
    var body: some View {
        VStack{
            NavigationStack{
                VStack{
                    Picker("", selection: $foodType)
                    {
                        Text("All").tag(0)
                        Text("Meat").tag(1)
                        Text("Veggie").tag(2)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    .cornerRadius(50)
                    .padding()
                    
                    switch foodType{
                    case 1:
                        MeatPage()

                    case 2:
                        VeggiePage()

                    default:
                        AllPage()
                    }
                }
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button {
                            isSheetShowing.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }

                    }
                }
                .sheet(isPresented: $isSheetShowing){
                    AddNewPizzaView(pizzaModel: $newPizza)
                        .environmentObject(DataStore())
                    }
            }
           // .foregroundColor(Color.orange)
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
//            .environmentObject(DataStore())
    }
}


struct AllPage: View{
    @State var foodType = 0
   // @ObservedObject var pizzaViewModel: PizzaViewModel = PizzaViewModel()
    @ObservedObject var dataStore: DataStore = DataStore()


    var body: some View{
        NavigationView{
            VStack {
                List() {
                    ForEach(dataStore.pizzas){ pizza in
                        HStack(alignment: .center){
                            Image("\(pizza.imageName)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150)
                                .frame(height: 150)
                            
                            VStack(alignment: .leading){
                                Text("\(pizza.name)")
                                    .font(.system(size: 18))
                                    .bold()
                                    .foregroundColor(Constants.newPrimaryColor)
                                    .multilineTextAlignment(.leading)
                                
                                Text("\(pizza.ingredients)")
                                    .multilineTextAlignment(.leading)
                            }
                            .frame(width: 150)
                            
                            
                            
                        }
                        
                        
                        
                        

                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct MeatPage: View{
    @State var foodType = 0
    @ObservedObject var dataStore: DataStore = DataStore()
    init() {
        UITableView.appearance().backgroundColor = .red
        
    }
    var body: some View{
        NavigationView{
            ZStack {
                List() {
                    ForEach(dataStore.pizzas){ pizza in

      //                  Text("\(pizza.name)")
                        if(pizza.type == PizzaType.meat.rawValue){
                            HStack(alignment: .center){
                                Image("\(pizza.imageName)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150)
                                    .frame(height: 150)
                                
                                VStack(alignment: .leading){
                                    Text("\(pizza.name)")
                                        .font(.system(size: 18))
                                        .bold()
                                        .foregroundColor(Constants.newPrimaryColor)
                                        .multilineTextAlignment(.leading)
                                    
                                    Text("\(pizza.ingredients)")
                                        .multilineTextAlignment(.leading)
                                }
                                .frame(width: 150)
                                
                                
                                
                            }
                        }


                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct VeggiePage: View{
    @State var foodType = 0
    @ObservedObject var dataStore: DataStore = DataStore()


    var body: some View{
        NavigationView{
            ZStack {
                List() {
                    ForEach(dataStore.pizzas){ pizza in

      //                  Text("\(pizza.name)")
                        if(pizza.type == PizzaType.vegetarian.rawValue){
                            HStack(alignment: .center){
                                Image("\(pizza.imageName)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150)
                                    .frame(height: 150)
                                
                                VStack(alignment: .leading){
                                    Text("\(pizza.name)")
                                        .font(.system(size: 18))
                                        .bold()
                                        .foregroundColor(Constants.newPrimaryColor)
                                        .multilineTextAlignment(.leading)
                                    
                                    Text("\(pizza.ingredients)")
                                        .multilineTextAlignment(.leading)
                                }
                                .frame(width: 150)
                                
                                
                                
                            }
                        }


                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
        }
        .navigationViewStyle(.stack)
    }
}
