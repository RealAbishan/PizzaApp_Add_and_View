//
//  PizzaAppApp.swift
//  PizzaApp
//
//  Created by Abishan Parameswaran on 2023-03-03.
//

import SwiftUI

@main
struct PizzaAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(PizzaViewModel())
        }
    }
}
