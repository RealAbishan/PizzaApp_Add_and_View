//
//  PizzaViewModel.swift
//  PizzaApp
//
//  Created by Abishan Parameswaran on 2023-03-04.
//

import Foundation
import SwiftUI


class PizzaViewModel: ObservableObject{
    
    @Published var pizzas: [PizzaModel] = []
    @StateObject var pizzaModel = PizzaViewModel()
    
    init() {
        getPizzas()
    }
    
    func getPizzas(){
//        let pizzaOne = PizzaModel("Chicken Sizzler","Green Chillies, Jalapeños, Red Onions, Chicken",
//                                  "chicken_sizzler.jpg","thumbnail_chicken_sizzler.jpg", PizzaType.meat)
//
        let pizzaOne = PizzaModel(name:"Chicken Sizzler", ingredients: "Green Chillies, Jalapeños, Red Onions, Chicken", imageName: "chicken_sizzler.jpg", thumbnailName: "thumbnail_chicken_sizzler.jpg", type: PizzaType.meat)
    }
    
    func deletePizzas(index: IndexSet){
        pizzas.remove(atOffsets: index)
    }
    
//    func addPizzas(){
//        let pizzaDummy = FruitModel(name: "Watermelon", price: 120)
//        fruits.append(fruitSix)
//    }
    
}
