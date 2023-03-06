//
//  AddNewPizzaView.swift
//  PizzaApp
//
//  Created by Abishan Parameswaran on 2023-03-03.
//

import SwiftUI

struct AddNewPizzaView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var dataStore: DataStore
    @ObservedObject var pizzaviewModel: PizzaViewModel = PizzaViewModel()
    @Binding var pizzaModel: PizzaModel


    //@EnvironmentObject var realManager: RealmManager

    var body: some View {
        NavigationView{
             Form {
                 VStack{
                     Section(header: Text("Pizza Name")) {
                         TextField("Please Enter Pizza Name", text: $pizzaModel.name)
                             .foregroundColor(Color.orange)
                         }
                     
                     Spacer()
                     Section(header: Text("Ingredients")) {
                         
                         TextField("Please Enter Ingredient Name", text: $pizzaModel.ingredients)
                             .foregroundColor(Color.orange)
                             .lineLimit(5)
                         }
                     Section(header: Text("Image Name")) {
                         TextField("Please Enter Image Name", text: $pizzaModel.imageName)
                         }
                     Section(header: Text("Thumbnail Name")) {
                         TextField("PLease Enter Image Thunail Name", text: $pizzaModel.thumbnailName)
                         }
                     
                     Section(header: Text("Type")) {
                         Picker(selection: $pizzaModel.type, label: Text("Type")) {
                             Text("Meat").tag("meat")
                             Text("Vegetarian").tag("vegetarian")
                         }
                         .pickerStyle(SegmentedPickerStyle())
                     }
                     
                     Section {
                         Button(action: {
                             dataStore.pizzas.append(pizzaModel)
                             presentationMode.wrappedValue.dismiss()
                             dataStore.addPizzas(pizzaModel)
          // save each time new one is added as alternative to didSet in class
                         }) {
                             Text("Add Pizza")
                         }
                         .disabled(pizzaModel.name.isEmpty || pizzaModel.ingredients.isEmpty || pizzaModel.imageName.isEmpty || pizzaModel.thumbnailName.isEmpty)
                     }
                 }
                
             }
             .navigationTitle("Pizzas")
             .navigationBarItems(leading: cancelButton, trailing: saveButton)
        }
        
    }
}

extension AddNewPizzaView {
    func addPizza()
    {
        let pizza  = PizzaModel(name:  pizzaviewModel.name, ingredients: pizzaviewModel.ingredients, imageName: pizzaviewModel.imageName, thumbnailName: pizzaviewModel.thumbnailName, type: pizzaviewModel.type)
    
        dataStore.addPizzas(pizza)
       // dataStore. (pizza)
        presentationMode.wrappedValue.dismiss()
    }
    
    var cancelButton: some View{
        Button("Cancel"){
            presentationMode.wrappedValue.dismiss()
        }
    }

//    var saveButton: some View{
//        Button("Save", action: presentationMode.wrappedValue.dismiss)
//            .disabled(pizzaviewModel.isDisabled)
//
//    }
    
    var saveButton: some View{
        Button("Save", action: addPizza)
            .disabled(pizzaviewModel.isDisabled)

    }

}

//struct AddNewPizzaView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddNewPizzaView(pizzaModel: PizzaModel)
//    }
//}
