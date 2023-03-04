//
//  MainView.swift
//  PizzaApp
//
//  Created by Abishan Parameswaran on 2023-03-03.
//

import SwiftUI

struct MainView: View {
    
    @State private var foodType = 0
    @State private var isSheetShowing:Bool = false
    @ObservedObject var pizzaViewModel: PizzaViewModel = PizzaViewModel()


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
                            //Insert New Fruit
    //                            pizzaViewModel.addPizzas()
    //                            print("New Fruit Add Dev test")
                            
                            isSheetShowing.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }

                    }
                }
                .sheet(isPresented: $isSheetShowing){
                        AddNewPizzaView()
                    }
            }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


struct AllPage: View{
    @State var foodType = 0
    @ObservedObject var pizzaViewModel: PizzaViewModel = PizzaViewModel()


    var body: some View{
        NavigationView{
            List(PizzaModel.allPizzaModel){ pizza in
                Text("\(pizza.name)")
                
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct MeatPage: View{
    @State var foodType = 0

    var body: some View{
        NavigationView{
            List(PizzaModel.allPizzaModel){ pizza in
                
                if(pizza.type == PizzaType.meat){
                    Text("\(pizza.name)")
                }
                
                
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct VeggiePage: View{
    @State var foodType = 0

    var body: some View{
        NavigationView{
            List(PizzaModel.allPizzaModel){ pizza in
                
                if(pizza.type == PizzaType.vegetarian){
                    Text("\(pizza.name)")
                }
                
                
            }
        }
        .navigationViewStyle(.stack)
    }
}
