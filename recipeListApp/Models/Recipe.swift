//
//  Recipe.swift
//  recipeListApp
//
//  Created by Elīna Zekunde on 08/03/2021.
//

import Foundation

class Recipe: Identifiable, Decodable {
    
    var id: UUID?
    var name: String
    var featured: Bool
    var image: String
    var description: String
    var prepTime: String
    var cookTime: String
    var totalTime: String
    var servings: Int
    var highlights: [String]
    var ingredients: [Ingredient]
    var directions: [String]
}

class Ingredient: Identifiable, Decodable {
    var id: UUID?
    var name: String
    var num: Int?
    var denum: Int?
    var unit: String?
}
