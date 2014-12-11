//
//  DetailViewController.swift
//  GroceryVudu
//
//  Created by Cade on 10/9/14.
//  Copyright (c) 2014 Cade Ward. All rights reserved.
//



/* 

        RULES OF SWIFT ---

        1. new lines are your BFF - if you don't use them then you will die a horrible, terrible, painful death while wondering why the -F- nothing works.

        2. when all else fails, delete the offending control and replace it with the exact same control, new of course. Works wonders.




*/



import UIKit
import QuartzCore
import CoreData

class DetailViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var imgPreview: UIImageView!
    @IBOutlet weak var lblTotalTime: UILabel!
    @IBOutlet weak var lblPrepTime: UILabel! // concat mins
    @IBOutlet weak var lblCookTime: UILabel! // concat mins
    @IBOutlet weak var txtViewIngredients: UITextView!
    @IBOutlet weak var lblDirections: UILabel!
    
    // this is the view whos height determines if you can scroll to the bottom of the content or not.
    @IBOutlet weak var viewScrollingView: UIView!
    @IBOutlet weak var scrollview: UIScrollView!
    
    // uhh.. this worked so we're just keepin' it. 
    // testlabel == lblIngredients    TRUE
    @IBOutlet weak var testlabel: UILabel!
    
    // prob should leave this alone... here there be dragons...
    @IBOutlet weak var viewTimeAndPrep: UIView!
    
    var currentRecipe: RecipeModel = RecipeModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         *    THIS CRAP IS DYNAMIC / test data
         *
         */
        
        // ideally, this comes from some other SOURCE
        //// change this out when imge is working /////
        let image = currentRecipe.image
        
        ////// END CRAP ////////
        
        
        // CHANGE ITEM1INGREDIENTS TO W/E COMES FROM SOURCE
        testlabel.attributedText = getLblContents(currentRecipe.ingredients)
        lblTitle.text = currentRecipe.name
        lblAuthor.text = "By \(currentRecipe.author)"
        imgPreview.image = image
        lblTotalTime.text = "\(currentRecipe.totalTime)"
        lblPrepTime.text = "\(currentRecipe.prepTime) mins"
        lblCookTime.text = "\(currentRecipe.cookTime) mins"
        lblDirections.text = currentRecipe.directions
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getLblContents(ingredients: Array<Ingredient>) -> NSMutableAttributedString {
        // create an attr string with attrs (awesome)
        var attrString = NSMutableAttributedString(string:"")
        
        // loop over each ingredient
        
        for item in ingredients {
            
            // unit and amount combined
            var measurement = getMeasurement(item.unit, amount: item.amount)
            
            // meh
            var detail = item.name
            
            // create the measurement bolded
            var attrMeasurements = NSMutableAttributedString(string:"\(measurement) ", attributes:[NSFontAttributeName : UIFont(name: "HelveticaNeue-Bold", size: 19)!])
            
            // normal font w/ new line
            var attrDetails = NSMutableAttributedString(string:"\(detail)\n", attributes:[NSFontAttributeName : UIFont(name: "HelveticaNeue", size: 19)!])
            
            // add them to our label
            attrString.appendAttributedString(attrMeasurements)
            attrString.appendAttributedString(attrDetails)
        }

        
        return attrString
    }
    
    func getMeasurement(unit: Unit, amount: Int) -> String {
        // convert into fraction and append unit
        // if 1 (one) is passed in, return 1/12
        // if 12 (twelve) is passed in, return 1 whole
        
        var convertedAmount:String
        
        if (amount % 12 == 0) {
            convertedAmount = String( amount / 12 )
        } else if (amount % 6 == 0) {
            // halves
            convertedAmount = String("\(amount / 6)/2")
        } else if (amount % 4 == 0) {
            // thirds
            convertedAmount = String("\(amount / 4)/3")
        } else if (amount % 3 == 0) {
            // fourths
            convertedAmount = String("\(amount / 3)/4")
        } else {
            // weird fractions, always by 12
            convertedAmount = String("\(amount)/12")
        }
        
        // put units on the end of converted amount WALAHHHH
        return "\(convertedAmount) \(unit.rawValue)"
    }
    
    @IBAction func addToShoppingList(sender: AnyObject) {
        // save each ingredient to database
        saveEachItem(currentRecipe.ingredients)
        var alert = UIAlertController(title: "Alert", message: "The ingredients have been added to the shopping list.", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func saveEachItem(ingredients: [Ingredient]) {
        // setup some random iOS stuff so we can access the db
        let appDel: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        let context: NSManagedObjectContext = appDel.managedObjectContext!
        
        // equiv of: FROM GroceryList
        let entity = NSEntityDescription.entityForName("GroceryList", inManagedObjectContext: context)
        
        for ingredient in ingredients {
            var record = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: context)
            
            // set each value as a single item
            record.setValue("\(ingredient.name)", forKey: "item")

            // finally, save the item
            var error: NSError?
            if !context.save(&error) {
                println("Error saving: \(error) - \(error?.userInfo)")
            }
        }
    }
    @IBAction func favoriteBtnPress(sender: AnyObject) {
        addToFavorites(currentRecipe)
        var alert = UIAlertController(title: "Alert", message: "The recipe has been added to your favorites", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func addToFavorites(recipe: RecipeModel) {
        // setup some random iOS stuff so we can access the db
        let appDel: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        let context: NSManagedObjectContext = appDel.managedObjectContext!
        
        // equiv of: FROM Favorites
        let entity = NSEntityDescription.entityForName("Favorites", inManagedObjectContext: context)
        let record = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: context)
        
        record.setValue("\(recipe.name)", forKey: "name")
        
        // finally, save the item
        var error: NSError?
        if !context.save(&error) {
            println("Error saving: \(error) - \(error?.userInfo)")
        }
    }
}