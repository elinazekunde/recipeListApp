//
//  RecipeModel.swift
//  recipeListApp
//
//  Created by Elīna Zekunde on 08/03/2021.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        //create instance of data service and get the data
        self.recipes = DataService.getLocalData()
    }
}
