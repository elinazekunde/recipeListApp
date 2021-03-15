//
//  RecipeDetailView.swift
//  recipeListApp
//
//  Created by Elīna Zekunde on 09/03/2021.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    @State var selectedServingSize = 2
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                Text(recipe.name)
                    .bold()
                    .padding(.top, 40)
                    .padding(.leading)
                    .font(Font.custom("Avenir Heavy", size: 24))
                VStack (alignment: .leading) {
                    Text("Select your serving size:")
                        .font(Font.custom("Avenir", size: 15))
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .font(Font.custom("Avenir", size: 15))
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 170)
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding(5)
                    ForEach (recipe.ingredients) { item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                            .font(Font.custom("Avenir", size: 15))
                    }
                }
                .padding(.horizontal)
                Divider()
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding(5)
                    ForEach (0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index + 1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                            .font(Font.custom("Avenir", size: 15))
                    }
                }
                .padding(.horizontal)
                
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
