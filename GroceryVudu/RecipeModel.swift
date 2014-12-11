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
    var image: UIImage
    
    init() {
        name = ""
        author = ""
        totalTime = 0
        prepTime = 0
        cookTime = 0
        ingredients = []
        directions = ""
        tag = []
        image = UIImage(named: "cupcake.jpg")!
    }
    
    init(name: String, author: String, prepTime: Int, cookTime: Int, ingredients: [Ingredient], directions: String, tag: [String], image: String) {
        self.name = name
        self.author = author
        self.totalTime = prepTime + cookTime
        self.prepTime = prepTime
        self.cookTime = cookTime
        self.ingredients = ingredients
        self.directions = directions
        self.tag = tag
        self.image = UIImage(named: image)!
    }
}

struct Ingredient {
    var amount: Int // in 1/12 units
    var unit: Unit
    var name: String
}

enum Unit: String {
    case Cup = "Cup";
    case Tablespoon = "tbsp";
    case Teaspoon = "tsp";
    case Pint = "pint";
    case Whole = "whole";
    case Ounce = "oz.";
    case Dash = "dash";
    case Pound = "pound";
}