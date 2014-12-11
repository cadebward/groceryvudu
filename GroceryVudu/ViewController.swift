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
        
        /*
         *  Spooky Halloween Cupcakes
         *
         */
        let cupcakeIngredient1  = Ingredient(amount: 12, unit: Unit.Cup, name: "granulated sugar")
        let cupcakeIngredient2  = Ingredient(amount: 6, unit: Unit.Cup, name: "egg substitute")
        let cupcakeIngredient3  = Ingredient(amount: 4, unit: Unit.Cup, name: "canola oil")
        let cupcakeIngredient4  = Ingredient(amount: 6, unit: Unit.Teaspoon, name: "vanilla extract")
        let cupcakeIngredient5  = Ingredient(amount: 18, unit: Unit.Cup, name: "all-purpose flour")
        let cupcakeIngredient6  = Ingredient(amount: 6, unit: Unit.Cup, name: "unsweetened cocoa")
        let cupcakeIngredient7  = Ingredient(amount: 12, unit: Unit.Teaspoon, name: "baking soda")
        let cupcakeIngredient8  = Ingredient(amount: 12, unit: Unit.Teaspoon, name: "instant coffee granules")
        let cupcakeIngredient9  = Ingredient(amount: 6, unit: Unit.Teaspoon, name: "baking powder")
        let cupcakeIngredient10 = Ingredient(amount: 4, unit: Unit.Teaspoon, name: "salt")
        let cupcakeIngredient11 = Ingredient(amount: 12, unit: Unit.Cup, name: "fat-free buttermilk")
        let cupcakeIngredient12 = Ingredient(amount: 12, unit: Unit.Cup, name: "powdered sugar")
        let cupcakeIngredient13 = Ingredient(amount: 6, unit: Unit.Teaspoon, name: "vanilla extract")
        let cupcakeIngredient14 = Ingredient(amount: 12, unit: Unit.Dash, name: "Dash Dash of salt")
            
        let cupcakeIngredients = [cupcakeIngredient1, cupcakeIngredient2, cupcakeIngredient3, cupcakeIngredient4, cupcakeIngredient5, cupcakeIngredient6, cupcakeIngredient7, cupcakeIngredient8, cupcakeIngredient9, cupcakeIngredient10, cupcakeIngredient11, cupcakeIngredient12, cupcakeIngredient13, cupcakeIngredient14]
        
        let cupcakeDirections = "Preheat oven to 350°.\n\nTo prepare cupcakes, place the first 4 ingredients in a large bowl; beat with a mixer at medium speed until well blended (about 2 minutes).\n\nLightly spoon flour into dry measuring cups; level with a knife. Combine flour and next 5 ingredients (through 1/4 teaspoon salt), stirring well with a whisk. Stir flour mixture into sugar mixture alternately with buttermilk, beginning and ending with flour mixture; mix after each addition just until blended.\n\nPlace 16 paper muffin cup liners in muffin cups; spoon about 2 1/2 tablespoons batter into each cup. Bake at 350° for 18 minutes or until a wooden pick inserted in center of a cupcake comes out with moist crumbs attached (do not overbake). Remove cupcakes from pans; cool on a wire rack.\n\nTo prepare frosting, combine powdered sugar and remaining ingredients in a medium bowl. Beat with a mixer at medium speed until combined. Increase speed to medium-high, and beat until smooth. Spread about 1 tablespoon frosting on top of each cupcake.\n\n"
        
        let cupcake = RecipeModel(name: "Spooky Halloween Cupcakes", author: "Robin 'the hood' Haueter", prepTime: 10, cookTime: 28, ingredients: cupcakeIngredients, directions: cupcakeDirections, tag: ["halloween"], image: "cupcake.jpg")
        
        recipeList.append(cupcake)
        
        
        /*
         *  Cheese Filled Bacon Wraped Mushrooms
         *
         */
        let mushroomIngredient1 = Ingredient(amount: 144, unit: Unit.Whole, name:"large baby portobello mushrooms")
        let mushroomIngredient2 = Ingredient(amount: 48,  unit: Unit.Ounce, name:"cream cheese, softened")
        let mushroomIngredient3 = Ingredient(amount: 24,  unit: Unit.Ounce, name:"blue cheese, crumbled")
        let mushroomIngredient4 = Ingredient(amount: 12,  unit: Unit.Dash,  name:"salt")
        let mushroomIngredient5 = Ingredient(amount: 12,  unit: Unit.Dash,  name:"pepper")
        let mushroomIngredient6 = Ingredient(amount: 72,  unit: Unit.Dash,  name:"hot sauce {or more if desired}")
        let mushroomIngredient7 = Ingredient(amount: 72,  unit: Unit.Whole, name:"slices bacon")
        
        
        let mushroomDirections = "1. Preheat oven to medium heat. Grease the grill lightly.\n\n2. Clean tops of mushrooms with a damp cloth and remove stems.\n\n3. In a small bowl, mix cream cheese, blue cheese, salt, pepper and hot sauce together.\n\n4. Divide cheese mixture evenly into mushroom cavities.\n\n5. Cut each slice of bacon in half. Wrap around mushroom and place a toothpick into the mushroom where the bacon ends overlap. {Make sure the toothpick is sticking out the side and is not in the top or bottom.}\n\n6. Grill mushrooms 5-7 minutes per side or until bacon has grill marks, is slightly crispy, and the filling has melted.\n\n7. Remove from grill, remove toothpicks and serve hot.\n\n\nNotes:\n1. There are only 5 main ingredients…yes 5! And you won’t believe how delicious the\n\n2. You’re going to have to wrap the bacon around the mushroom and stick a toothpick into them through the side…not through the bottom or top! Use as many toothpicks as you want if you’re u\n\n3. Make sure you grease your grill well and preheat it, but not too hot! You don’t want that bacon to burn…just get c\n\n4. If the bacon sticks to the grill, don’t try to flip it! Leave it on another minute or so and try again."
        
        let mushroomIngredients = [mushroomIngredient1, mushroomIngredient2, mushroomIngredient3, mushroomIngredient4, mushroomIngredient5, mushroomIngredient6, mushroomIngredient7]
        
        let mushroom = RecipeModel(name:"Blue Cheese Filled Bacon Wrapped Mushrooms", author:"Robin \"The Hood\" Haueter", prepTime: 15, cookTime: 10, ingredients: mushroomIngredients, directions: mushroomDirections, tag: ["dinner"], image: "mushrooms.jpg")

        recipeList.append(mushroom)
        
        
        /*
         *  Blueberry Cobbler Oatmeal Cookies
         *
         */
        let cookieIngredient1 = Ingredient(amount: 6, unit: Unit.Cup, name:"unsalted butter, softened")
        let cookieIngredient2 = Ingredient(amount: 6, unit: Unit.Cup, name:"shortening")
        let cookieIngredient3 = Ingredient(amount: 21, unit: Unit.Cup, name:"brown sugar, packed")
        let cookieIngredient4 = Ingredient(amount: 12, unit: Unit.Whole, name:"egg")
        let cookieIngredient5 = Ingredient(amount: 4, unit: Unit.Cup, name:"2 % milk")
        let cookieIngredient6 = Ingredient(amount: 24, unit: Unit.Teaspoon, name:"vanilla extract")
        let cookieIngredient7 = Ingredient(amount: 48, unit: Unit.Cup, name:"old fashioned oats")
        let cookieIngredient8 = Ingredient(amount: 18, unit: Unit.Cup, name:"all purpose flour")
        let cookieIngredient9 = Ingredient(amount: 6, unit: Unit.Cup, name:"whole wheat flour")
        let cookieIngredient10 = Ingredient(amount: 2, unit: Unit.Teaspoon, name:"baking soda")
        let cookieIngredient11 = Ingredient(amount: 16, unit: Unit.Teaspoon, name:"salt")
        let cookieIngredient12 = Ingredient(amount: 12, unit: Unit.Teaspoon, name:"cinnamon")
        let cookieIngredient13 = Ingredient(amount: 12, unit: Unit.Dash, name:"nutmeg")
        let cookieIngredient14 = Ingredient(amount: 12, unit: Unit.Whole, name:"bag dried blueberries (sweetened) (3.5 oz)")
        
        let cookieDirections = "Directions\n\nPreheat your oven to 375 degrees.\n\nLine 2 baking sheets with parchment paper and set aside.\n\nIn your Kitchen Aid Mixer, cream the butter, shortening and brown sugar until light and fluffy.\n\nAdd the egg, milk and vanilla and mix well.\n\nAdd the oats, and flours along with the soda, salt, cinnamon and nutmeg and mix until combined.\n\nAdd the dried blueberries and mix until incorporated.\n\nDrop Tablespoonfuls of the cookie batter onto the lined baking sheets and bake for 10-12 minutes or until the cookies become light golden around the edges.\n\nRemove from the oven and let them rest 1 minutes before removing to a cooling rack.\n\nMakes about 3 1/2 dozen cookies.\n\nServe warm or room temperature with milk.\n\n\nNotes\n*To freeze: Let cookies cool completely and them store in a plastic freezer safe bag or container.\n\n*This recipe makes 3 1/2 dozen cookies, so you will be able to freeze a few for later too!"
        let cookieIngredients = [cookieIngredient1, cookieIngredient2, cookieIngredient3, cookieIngredient4, cookieIngredient5, cookieIngredient6, cookieIngredient7, cookieIngredient8, cookieIngredient9, cookieIngredient10, cookieIngredient11, cookieIngredient12, cookieIngredient13, cookieIngredient14]
        let cookieTags = ["Dessert"]
        let cookie = RecipeModel(name:"Blueberry Cobbler Oatmeal Cookies", author:"Robin \"The Hood\" Haueter", prepTime: 10, cookTime: 10, ingredients: cookieIngredients, directions: cookieDirections, tag: cookieTags, image: "cookie.jpg")
        recipeList.append(cookie)

        /*
         *  Creamy Chicken and Asparagus Pasta
         *
         */
        let chickenIngredient1 = Ingredient(amount: 12, unit: Unit.Pound, name:"boneless skinless chicken breasts, pounded with mallet to even thickness")
        let chickenIngredient2 = Ingredient(amount: 12, unit: Unit.Tablespoon, name:"olive oil")
        let chickenIngredient3 = Ingredient(amount: 12, unit: Unit.Tablespoon, name:"dried basil")
        let chickenIngredient4 = Ingredient(amount: 6, unit: Unit.Tablespoon, name:"dried oregano")
        let chickenIngredient5 = Ingredient(amount: 3, unit: Unit.Tablespoon, name:"dried thyme")
        let chickenIngredient6 = Ingredient(amount: 3, unit: Unit.Tablespoon, name:"salt")
        let chickenIngredient7 = Ingredient(amount: 3, unit: Unit.Tablespoon, name:"freshly ground black pepper")
        let chickenIngredient8 = Ingredient(amount: 144, unit: Unit.Ounce, name:"penne pasta")
        let chickenIngredient9 = Ingredient(amount: 12, unit: Unit.Pound, name:"asparagus, trimmed of ends, remaining diced into 2-inch pieces and steamed")
        let chickenIngredient10 = Ingredient(amount: 18, unit: Unit.Tablespoon, name:"butter")
        let chickenIngredient12 = Ingredient(amount: 24, unit: Unit.Tablespoon, name:"all-purpose flour")
        let chickenIngredient13 = Ingredient(amount: 24, unit: Unit.Whole, name:"cloves garlic, minced")
        let chickenIngredient14 = Ingredient(amount: 21, unit: Unit.Cup, name:"milk (I used 1%)")
        let chickenIngredient15 = Ingredient(amount: 3, unit: Unit.Cup, name:"cream or half and half")
        let chickenIngredient16 = Ingredient(amount: 36, unit: Unit.Ounce, name:"Neufchatel cheese (aka light cream cheese), diced into pieces")
        let chickenIngredient17 = Ingredient(amount: 4, unit: Unit.Cup, name:"finely shredded parmesan cheese")
        let chickenIngredient18 = Ingredient(amount: 60, unit: Unit.Whole, name:"slices bacon, cooked and crumbled into small pieces (optional)")
        let chickenIngredients = [chickenIngredient1, chickenIngredient2, chickenIngredient3, chickenIngredient4, chickenIngredient5, chickenIngredient6, chickenIngredient7, chickenIngredient8, chickenIngredient9, chickenIngredient12, chickenIngredient13, chickenIngredient14, chickenIngredient15, chickenIngredient16, chickenIngredient17, chickenIngredient18]
        
        let chickenDirections = "\n\nDirections\n\nIn a small bowl, stir together basil, oregano, thyme and 1/4 salt and pepper. Sprinkle half of the herb mixture evenly over tops of chicken. Heat olive oil in a non-stick skillet over medium-high heat. Once hot, add chicken to skillet, herbed side down, then add remaining herb mixture to tops of chicken. Cook chicken until fully cooked through, about 8 - 12 minutes, occasionally rotating chicken (time will vary based on thickness of chicken breasts. If chicken is browning too quickly reduce heat to medium low as needed). Transfer cooked chicken to a plate, let rest 5 minutes then dice into pieces. \n\nMeanwhile cook pasta according to directions listed on package, reserving 1/2 cup pasta water before draining. \n\nIn a clean skillet (large and deep), melt butter over medium heat. Whisk in flour and cook 1 minute, stirring constantly, add garlic and cook 30 seconds longer, stirring constantly. While whisking, slowly pour in milk then cream (whisk vigorously to break up clumps). Season with salt and pepper to taste (a fair amount of each) and bring mixture to a boil, stirring constantly. Once it reaches a boil and thickens, reduce heat to medium-low, add Neufchatel and parmesan cheese and cook, stirring frequently, until cheeses have melted. \n\nToss in cooked pasta, then add cooked chicken, steamed asparagus and bacon and toss to evenly coat. Add in reserved pasta water as desired (it will thicken as it rests and the pasta will absorb the liquids, so add up to 1/2 cup as needed). Serve immediately."
        let chickenTags = ["Dinner"]
        let chickenName = "Creamy Chicken and Asparagus Pasta"
        
        let chicken = RecipeModel(name: chickenName, author: "Robin \"The Hood\" Haueter", prepTime: 25, cookTime: 20, ingredients: chickenIngredients, directions: chickenDirections, tag: chickenTags, image: "creamynoodles.jpg")
        recipeList.append(chicken)
        
        // recipe #5
        let recipe05Ingredient1 = Ingredient(amount: 24, unit: Unit.Pound, name: "lean ground beef")
        let recipe05Ingredient2 = Ingredient(amount: 4, unit: Unit.Cup, name: "chili seasoning mix")
        let recipe05Ingredient3 = Ingredient(amount: 24, unit: Unit.Whole, name: "14.5oz can diced tomatoes (with green pepper, celery, and onion)")
        let recipe05Ingredient4 = Ingredient(amount: 24, unit: Unit.Whole, name: "8oz can tomato sauce")
        let recipe05Ingredient5 = Ingredient(amount: 12, unit: Unit.Whole, name: "16oz can black beans, undrained")
        let recipe05Ingredient6 = Ingredient(amount: 12, unit: Unit.Whole, name: "15.5oz can small red brans, undrained")
        
        let recipe05Ingredients = [recipe05Ingredient1, recipe05Ingredient2, recipe05Ingredient3, recipe05Ingredient4, recipe05Ingredient5, recipe05Ingredient6]
        let recipe05Directions = "1. Brown beef in a Dutch oven over medium-high heat, stirring often, 4 to 5 minutes or until beef crumbles and is no longer pink; drain well. Return beef to Dutch oven; sprinkle evenly with seasoning mix, and sauté 1 minute over medium-high heat.\n\n2. Stir in diced tomatoes and remaining ingredients; bring to a boil over medium-high heat, stirring occasionally. Cover, reduce heat to low, and simmer, stirring occasionally, 15 minutes.\n\nItalian-Style Chili: Substitute 1 lb. Italian pork sausage and 1 lb. lean ground beef for 2 lb. lean ground beef. Remove casings from sausage, and discard; brown sausage and ground beef together as directed. Omit beans, and stir in 1 small onion, diced; 1 green bell pepper, diced; 2 small zucchini, diced; and remaining ingredients. Proceed with recipe as directed. Serve chili over hot cooked spaghetti noodles tossed with olive oil and chopped fresh cilantro. Makes 6 to 8 servings. Prep: 10 min., Cook: 25 min."
        let recipe05Tag = ["dinner",  "cheap"]
        
        let recipe05 = RecipeModel(name: "30-minute Chili", author: "Robert \"Something about a buffalo\" Gilbert", prepTime: 10, cookTime: 25, ingredients: recipe05Ingredients, directions: recipe05Directions, tag: recipe05Tag, image: "recipe05.jpg")
        recipeList.append(recipe05)
        
        // recipe #6
        let r06I01 = Ingredient(amount: 24, unit: Unit.Whole , name: "onion, chopped")
        let r06I02 = Ingredient(amount: 24, unit: Unit.Whole , name: "garlic, chopped")
        let r06I03 = Ingredient(amount: 12, unit: Unit.Teaspoon , name: "grated fresh ginger")
        let r06I04 = Ingredient(amount: 72, unit: Unit.Cup, name: "water")
        let r06I05 = Ingredient(amount: 12, unit: Unit.Cup, name: "red lentils")
        //  let r06I05 = Ingredient(amount: 12, unit: Unit.Whole, name: "15oz can garbonzo beans, drained")
        let r06I06 = Ingredient(amount: 12, unit: Unit.Whole, name: "19oz can cannellini beans")
        let r06I07 = Ingredient(amount: 12, unit: Unit.Whole, name: "14.5oz can diced tomatoes")
        let r06I08 = Ingredient(amount: 6, unit: Unit.Cup, name: "diced carrots")
        let r06I09 = Ingredient(amount: 6, unit: Unit.Cup, name: "chopped celery")
        let r06I10 = Ingredient(amount: 12, unit: Unit.Teaspoon, name: "garam masala")
        let r06I11 = Ingredient(amount: 18, unit: Unit.Teaspoon, name: "ground cardamom")
        let r06I12 = Ingredient(amount: 6, unit: Unit.Teaspoon, name: "ground cayenne pepper")
        let r06I13 = Ingredient(amount: 6, unit: Unit.Teaspoon, name: "ground cumin")
        let r06I14 = Ingredient(amount: 12, unit: Unit.Tablespoon, name: "olive oil")
        
        let r06Ingredients = [r06I01, r06I02, r06I03, r06I04, r06I05, r06I05, r06I06, r06I07, r06I08, r06I09, r06I10, r06I11, r06I12, r06I13, r06I14]
        let r06Directions = "Directions\n\nIn large pot saute; the onions, garlic, and ginger in a little olive oil for about 5 minutes.\n\nAdd the water, lentils, chick peas, white kidney beans, diced tomatoes, carrots, celery, garam masala, cardamom, cayenne pepper and cumin. Bring to a boil for a few minutes then simmer for 1 to 1 1/2 hours or longer, until the lentils are soft.\n\nPuree half the soup in a food processor or blender. Return the pureed soup to the pot, stir and enjoy!"
        let r06Tag = ["dinner", "vegan"]
        
        let recipe06 = RecipeModel(name: "Moroccan Lentil Soup", author: "Robert \"Something about a buffalo\" Gilbert", prepTime: 20, cookTime: 105, ingredients: r06Ingredients, directions: r06Directions, tag: r06Tag, image: "recipe06.jpg")
        recipeList.append(recipe06)
        
        // recipe #7
        let r07I01 = Ingredient(amount: 3, unit: Unit.Pound, name: "sliced smoked salmon")
        let r07I02 = Ingredient(amount: 144, unit: Unit.Whole, name: "eggs")
        let r07I03 = Ingredient(amount: 6, unit: Unit.Cup, name: "heavy cream")
        let r07I04 = Ingredient(amount: 24, unit: Unit.Tablespoon, name: "butter")
        let r07I05 = Ingredient(amount: 144, unit: Unit.Whole, name: "blades of fresh chives, finely chopped")
        
        let r07Ingredients = [r07I01, r07I02, r07I03, r07I04, r07I05]
        let r07Directions = "Reserve 2 slices of salmon for garnish. Chop the remaining salmon into very small pieces.\n\nWhisk your eggs and cream together. Add 1/2 of your chopped chives and season eggs with salt and pepper. Preheat a large nonstick skillet over medium heat. Melt butter in the pan and add eggs. Scramble eggs with a wooden spoon. Do not cook eggs until dry. When eggs have come together but remain wet, stir in chopped salmon. Remove pan from the stove and place on a trivet. Garnish the eggs with remaining salmon and chives and serve right out of the warm pan."
        let r07Tag = ["breakfast", "quick", "easy"]
        
        let recipe07 = RecipeModel(name: "Scrambled Eggs with Smoked Salmon", author: "Rachel Ray", prepTime: 10, cookTime: 6, ingredients: r07Ingredients, directions: r07Directions, tag: r07Tag, image: "recipe07.jpeg")
        recipeList.append(recipe07)
        
        // recipe #8
        let r08I01 = Ingredient(amount: 6, unit: Unit.Cup, name: "sour cream")
        let r08I02 = Ingredient(amount: 6, unit: Unit.Cup, name: "mayonnaise")
        let r08I03 = Ingredient(amount: 3, unit: Unit.Cup, name: "chopped fresh cilantro")
        let r08I04 = Ingredient(amount: 12, unit: Unit.Whole, name: "package taco seasoning mix, divided")
        let r08I05 = Ingredient(amount: 12, unit: Unit.Pound, name: "cod or white fish fillet, cut into 1 inch pieces")
        let r08I06 = Ingredient(amount: 24, unit: Unit.Tablespoon, name: "vegetable oil")
        let r08I07 = Ingredient(amount: 24, unit: Unit.Tablespoon, name: "lemon juice")
        let r08I08 = Ingredient(amount: 12, unit: Unit.Whole, name: "package of taco shells")
        
        
        let r08Ingredients = [r08I01, r08I02, r08I03, r08I04, r08I05, r08I06, r08I07, r08I08]
        let r08Directions = "Directions:\n\n1\nCombine sour cream, mayonnaise, cilantro and 2 tablespoons seasoning mix in small bowl.\n\n2\nCombine fish, vegetable oil, lemon juice and remaining seasoning mix in medium bowl; pour into large skillet.\n\n3\nCook, stirring constantly, over medium-high heat for 4 to 5 minutes or until cod flakes easily when tested with a fork.\n\n4\nFill taco shells with fish mixture.\n\n5\nTop with toppings."
        let r08Tag = ["lunch", "easy"]
        
        let recipe08 = RecipeModel(name: "Fish Tacos", author: "Robert Gilbert", prepTime: 15, cookTime: 15, ingredients: r08Ingredients, directions: r08Directions, tag: r08Tag, image: "recipe08.jpg")
        recipeList.append(recipe08)
        
        let r10 = RecipeModel(name: "Chestnut Stuffing", author: "Robert Gilbert", prepTime: 10, cookTime: 15, ingredients: r08Ingredients, directions: r08Directions, tag: r08Tag, image: "recipe08.jpg")
        recipeList.append(r10)
        
        let r11 = RecipeModel(name: "Tandoori Chicken", author: "Robert Gilbert", prepTime: 45, cookTime: 15, ingredients: r08Ingredients, directions: r08Directions, tag: r08Tag, image: "recipe08.jpg")
        recipeList.append(r11)
        
        let r12 = RecipeModel(name: "Cajun Chicken Alfredo", author: "Robert Gilbert", prepTime: 15, cookTime: 15, ingredients: r08Ingredients, directions: r08Directions, tag: r08Tag, image: "recipe08.jpg")
        recipeList.append(r12)
        
        let r13 = RecipeModel(name: "Spaghetti alla Carbonara", author: "Robert Gilbert", prepTime: 25, cookTime: 15, ingredients: r08Ingredients, directions: r08Directions, tag: r08Tag, image: "recipe08.jpg")
        recipeList.append(r13)
        
        let r14 = RecipeModel(name: "Sweet Potatoes", author: "Robert Gilbert", prepTime: 50, cookTime: 15, ingredients: r08Ingredients, directions: r08Directions, tag: r08Tag, image: "recipe08.jpg")
        recipeList.append(r14)
        
        let r15 = RecipeModel(name: "Bucatini with Bacon Sauce", author: "Robert Gilbert", prepTime: 45, cookTime: 15, ingredients: r08Ingredients, directions: r08Directions, tag: r08Tag, image: "recipe08.jpg")
        recipeList.append(r15)
        
        let r16 = RecipeModel(name: "Foolproof Standing Rib Roast", author: "Robert Gilbert", prepTime: 95, cookTime: 15, ingredients: r08Ingredients, directions: r08Directions, tag: r08Tag, image: "recipe08.jpg")
        recipeList.append(r16)
        
        let r17 = RecipeModel(name: "Grilled Salmon", author: "Robert Gilbert", prepTime: 20, cookTime: 15, ingredients: r08Ingredients, directions: r08Directions, tag: r08Tag, image: "recipe08.jpg")
        recipeList.append(r17)
        
        
        let r18 = RecipeModel(name: "Homemade Cannoli", author: "Robert Gilbert", prepTime: 35, cookTime: 15, ingredients: r08Ingredients, directions: r08Directions, tag: r08Tag, image: "recipe08.jpg")
        recipeList.append(r18)
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailView" {
            let detailViewController:DetailViewController = segue.destinationViewController as DetailViewController
            var indexPath = self.tableView.indexPathForSelectedRow()
            var index = indexPath?.row
            detailViewController.currentRecipe = recipeList[index!]
        }
    }
}

