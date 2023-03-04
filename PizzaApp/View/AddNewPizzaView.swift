//
//  AddNewPizzaView.swift
//  PizzaApp
//
//  Created by Abishan Parameswaran on 2023-03-03.
//

import SwiftUI

struct AddNewPizzaView: View {
    
    @State var pizzaName: String = ""

    var body: some View {
        VStack{
            HStack(spacing: 80){
                Button {
                    //
                } label: {
                    Text("Cancel")
                }
                
                Text("New Pizza")
                    .font(.system(size: 24))
                
                Button {
                    //
                } label: {
                    Text("Save")
                }
                
            }
            
            VStack{
             Form {
                 Section {
                         TextField("Please Entyer Pizza Name", text: $pizzaName)
                         .foregroundColor(Color.orange)
                     }
                 Section {
                     
                     TextField("Please Entyer Pizza Name", text: $pizzaName)
                         .foregroundColor(Color.orange)
                         .lineLimit(5)
                     }
                 Section {
                         TextField("Please Enter Image Name", text: $pizzaName)
                     }
                 Section {
                         TextField("PLease Enter Image Thunail Name", text: $pizzaName)
                     }
                 Section {
                         TextField("PLease Enter Pizza Type", text: $pizzaName)
                     
                     
                     }
             }
            }
            .padding()
        }
    }
}

struct AddNewPizzaView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewPizzaView()
    }
}
