//
//  RecipeModel.swift
//  GroceryVudu
//
//  Created by Cade on 10/7/14.
//  Copyright (c) 2014 Cade Ward. All rights reserved.
//

import Foundation
import UIKit

struct RecipeModel {
    var name: String
    var author: String
    
    // int in minutes
    var totalTime: Int
    var prepTime: Int
    var cookTime: Int
    
    var ingredients: [Ingredient]
    var directions: String
    
    var tag: [String]
    var image: UIImage = UIImage(named: "")
}

struct Ingredient {
    var amount: Int // in 1/12 units
    var unit: Unit
    var name: String
}

enum Unit: String {
    case Cup = "cup";
    case Tablespoon = "tbsp";
    case Teaspoon = "tsp";
    case Pint = "pint"
}