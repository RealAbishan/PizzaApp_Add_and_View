//
//  PizzaModel.swift
//  PizzaApp
//
//  Created by Abishan Parameswaran on 2023-03-04.
//

import Foundation
import SwiftUI


struct PizzaModel: Identifiable {
    let id = UUID()
    var name: String
    var ingredients: String
    var imageName: String
    var thumbnailName: String
    var type: PizzaType
}

enum PizzaType: String, Decodable {
    case vegetarian = "vegetarian"
    case meat = "meat"
}

extension PizzaModel {
    static let allPizzaModel: [PizzaModel] = [
        PizzaModel(
        
            name: "Chicken Sizzler",
            ingredients: "Green Chillies, Jalapeños, Red Onions, Chicken",
            imageName: "chicken_sizzler.jpg",
            thumbnailName: "thumbnail_chicken_sizzler.jpg",
            type: PizzaType.meat
        ),
        
        PizzaModel(
        
            name: "Beef Sizzler",
            ingredients: "Green Chillies, Jalapeños, Red Onions, Seasoned Minced Beef",
            imageName: "beef_sizzler.jpg",
            thumbnailName: "thumbnail_beef_sizzler.jpg",
            type: PizzaType.meat
        ),
        
        
        PizzaModel(
        
            name: "Meat Feast",
            ingredients: "Green Chillies, Jalapeños, Red Onions, Chicken, Seasoned Minced Beef",
            imageName: "meat_feast.jpg",
            thumbnailName: "thumbnail_meat_feast.jpg",
            type: PizzaType.meat
        ),
        
        
        PizzaModel(
        
            name: "Vegetable Supreme",
            ingredients: "Mushrooms, Mixed Peppers, Red Onions, Tomato",
            imageName: "veg_supreme.jpg",
            thumbnailName: "thumbnail_veg_supreme.jpg",
            type: PizzaType.vegetarian
        ),
        
        PizzaModel(
        
            name: "Veggie Sizzler",
            ingredients: "Green Chillies, Jalapeños, Mixed Peppers, Red Onions",
            imageName: "veg_sizzler.jpg",
            thumbnailName: "thumbnail_veg_sizzler.jpg",
            type: PizzaType.vegetarian
        ),
        
    ]
}
