//
//  ContentView.swift
//  PizzaApp
//
//  Created by Abishan Parameswaran on 2023-03-03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainView().tabItem {
                Label("Home", systemImage: "house")
            }
            
            FavouriteView().tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
