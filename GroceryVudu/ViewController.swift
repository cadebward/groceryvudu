//
//  ViewController.swift
//  GroceryVudu
//
//  Created by Cade on 9/23/14.
//  Copyright (c) 2014 Cade Ward. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var categoryBackdrop: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var recipeList: [RecipeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setup() {
        let item1Ingredient1 = Ingredient(amount: 12, unit: Unit.Cup, name: "Granulated Sugar")
        let item1Ingredient2 = Ingredient(amount: 6, unit: Unit.Cup, name: "Egg Substitute")
        let item1Ingredient3 = Ingredient(amount: 3, unit: Unit.Cup, name: "Canola Oil")
        let item1Ingredients = [item1Ingredient1, item1Ingredient2, item1Ingredient3]
        let item1 = RecipeModel(name: "Spooky Halloween Cupcakes", author: "Robin Haueter", totalTime: 30, prepTime: 10, cookTime: 20, ingredients: item1Ingredients, directions: "Preheat oven to 350.\nCombine ingredients in bowl.\n????\nPROFIT!!!", tag: ["halloween"], image: UIImage(named: ""))
        let item2 = RecipeModel(name: "Banana Split Awesomeness", author: "Robin Haueter", totalTime: 30, prepTime: 10, cookTime: 20, ingredients: item1Ingredients, directions: "Preheat oven to 350.\nCombine ingredients in bowl.\n????\nPROFIT!!!", tag: ["halloween"], image: UIImage(named: ""))
        let item3 = RecipeModel(name: "Crockpot Surprise", author: "Robin Haueter", totalTime: 30, prepTime: 10, cookTime: 20, ingredients: item1Ingredients, directions: "Preheat oven to 350.\nCombine ingredients in bowl.\n????\nPROFIT!!!", tag: ["halloween"], image: UIImage(named: ""))
        let item4 = RecipeModel(name: "Salsa Chicken", author: "Robin Haueter", totalTime: 30, prepTime: 10, cookTime: 20, ingredients: item1Ingredients, directions: "Preheat oven to 350.\nCombine ingredients in bowl.\n????\nPROFIT!!!", tag: ["dinner"], image: UIImage(named: ""))
        recipeList.append(item1)
        recipeList.append(item2)
        recipeList.append(item3)
        recipeList.append(item4)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeList.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : RecipeCell = tableView.dequeueReusableCellWithIdentifier("recipeCell") as RecipeCell
        
        // get index of current row
        var currentRecipe = recipeList[indexPath.row]
        
        // set recipe name label
        cell.lblRecipeName.text = currentRecipe.name
        
        // set total time in minutes label
        var totalTimeString = String(currentRecipe.totalTime)
        cell.lblTotalTime.text = totalTimeString + " minutes"

        // TODO... prob change this to actually grab all of them
        cell.lblCategory.text = currentRecipe.tag[0]
        
        return cell
    }
}

