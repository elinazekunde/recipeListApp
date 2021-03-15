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
    
    static func getPortion(ingredient: Ingredient, recipeServings: Int, targetServings: Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denum ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            //get a single serving size by multiplying denominator by the recipe servings
            denominator *= recipeServings
            
            //get target portion by multiplying numerator by target servings
            numerator *= targetServings
            
            //reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            //get the whole portion if numerator > denominator
            if numerator >= denominator {
                
                //calculate whole portions
                wholePortions = numerator / denominator
                
                //calculate the remainder
                numerator = numerator % denominator
                
                //assign to portion string
                portion += String(wholePortions)
            }
            //express the remainder as fraction
            if numerator > 0 {
                
                //assign remainder as fraction to portion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        if var unit = ingredient.unit {
            
            if wholePortions > 1 {
                                
                //calculate appropriate suffix
                if unit.suffix(2) == "ch" {
                    unit += "es"
                } else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                } else {
                    unit += "s"
                }
            }
            
            
            portion += ingredient.num == nil && ingredient.denum == nil ? "" : " "
            
            return portion + unit
        }
        return portion
    }
}
