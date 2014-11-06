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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // this sets the height
        println()
        
        /*
         *    THIS CRAP IS DYNAMIC / test data
         *
         */
        // ideally, this comes from some other SOURCE
        let item1Ingredient1 = Ingredient(amount: 12, unit: Unit.Cup, name: "Granulated Sugar")
        let item1Ingredient2 = Ingredient(amount: 6, unit: Unit.Cup, name: "Egg Substitute")
        let item1Ingredient3 = Ingredient(amount: 3, unit: Unit.Cup, name: "Canola Oil")
        let item1Ingredients = [item1Ingredient1, item1Ingredient2, item1Ingredient3]
        
        let author = "Robin The Hood"
        let title = "Robbin Cakes"
        // pass in a string with the image name here 
        let image = UIImage(named: "cupcake.jpg")
        let prepTime = 15
        let cookTime = 25
        let totalTime = prepTime + cookTime
        
        let directions = "First cook some frog eyes in the cauldren.\n\nThis would be a new line and stuff would happen here as well\n\nFirst cook some frog eyes in the cauldren.\n\nThis would be a new line and stuff would happen here as wellFirst cook some frog eyes in the cauldren.\n\nThis would be a new line and stuff would happen here as wellFirst cook some frog eyes in the cauldren.\n\nThis would be a new line and stuff would happen here as wellFirst cook some frog eyes in the cauldren.\n\nThis would be a new line and stuff would happen here as wellFirst cook some frog eyes in the cauldren.\n\nThis would be a new line and stuff would happen here as wellFirst cook some frog eyes in the cauldren.\n\nThis would be a new line and stuff would happen here as wellFirst cook some frog eyes in the cauldren.\n\nThis would be a new line and stuff would happen here as wellFirst cook some frog eyes in the cauldren.\n\nThis would be a new line and stuff would happen here as wellFirst cook some frog eyes in the cauldren.\n\nThis would be a new line and stuff would happen here as wellFirst cook some frog eyes in the cauldren.\n\nThis would be a new line and stuff would happen here as wellFirst cook some frog eyes in the cauldren.\n\nThis would be a new line and stuff would happen here as wellFirst cook some frog eyes in the cauldren.\n\nThis would be a new line and stuff would happen here as well\n\nFirst cook some frog eyes in the cauldren.\n\nThis would be a new line and stuff would happen here as wellFirst cook some frog eyes in the cauldren.\n\nThis would be a new line and stuff would happen here as wellFirst cook some frog eyes in the cauldren.\n\nThis would be a new line and stuff would happen here as wellFirst cook some frog eyes in the cauldren.\n\nThis would be a new line and stuff would happen here as wellFirst cook some frog eyes in the cauldren.\n\nThis would be a new line and stuff would happen here as wellFirst cook some frog eyes in the cauldren.\n\nThis would be a new line and stuff would happen here as wellFirst cook some frog eyes in the cauldren.\n\nThis would be a new line and stuff would happen here as wellFirst cook some frog eyes in the cauldren.\n\nThis would be a new line and stuff would happen here as wellFirst cook some frog eyes in the cauldren.\n\nThis would be a new line and stuff would happen here as wellFirst cook some frog eyes in the cauldren.\n\nThis would be a new line and stuff would happen here as wellFirst cook some frog eyes in the cauldren.\n\nThis would be a new line and stuff would happen here as well"
        
        
        ////// END CRAP ////////
        
        
        // CHANGE ITEM1INGREDIENTS TO W/E COMES FROM SOURCE
        testlabel.attributedText = getLblContents(item1Ingredients)
        lblTitle.text = title
        lblAuthor.text = "By \(author)"
        imgPreview.image = image
        lblTotalTime.text = "\(totalTime)"
        lblPrepTime.text = "\(prepTime) mins"
        lblCookTime.text = "\(cookTime) mins"
        lblDirections.text = directions
        
        testlabel.sizeToFit()
        lblDirections.sizeToFit()
        
        var scrollHeight = 565 + 20 + 60 + lblDirections.bounds.height + testlabel.bounds.height
        
        var newFrame = viewScrollingView.frame;
        newFrame.size.height = scrollHeight;
        
        viewScrollingView.frame = newFrame
        
        // viewScrollingView.frame.size = CGSize(width: CGFloat(scrollview.bounds.width), height: CGFloat(scrollHeight))
        
        // viewScrollingView.sizeThatFits(CGSize(width: CGFloat(scrollview.bounds.width), height: CGFloat(scrollHeight)))
        println(viewScrollingView.bounds.height)


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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}



// ideally, this is data from some other source
//        var measurements = "1 Cup"
//        var details = "granulated sugar"

// create an attr string with attrs (awesome)
//        var attrMeasurements = NSMutableAttributedString(string:"\(measurements) ", attributes:[NSFontAttributeName : UIFont(name: "HelveticaNeue-Bold", size: 19)!])

//        var attrDetails = NSMutableAttributedString(string:"\(details)\n", attributes:[NSFontAttributeName : UIFont(name: "HelveticaNeue", size: 19)!])

// MAKE A NEW FING line for EVERYHTING
// first make the attr string with the attr crap
//        var attrString = NSMutableAttributedString(attributedString: attrMeasurements)

// then and ONLY THEN append on to it --- on a new line---------- k?
//        attrString.appendAttributedString(attrDetails)
//        attrString.appendAttributedString(attrMeasurements)
//        attrString.appendAttributedString(attrDetails)
//        attrString.appendAttributedString(attrMeasurements)
//        attrString.appendAttributedString(attrDetails)
//        attrString.appendAttributedString(attrMeasurements)
//        attrString.appendAttributedString(attrDetails)
//        attrString.appendAttributedString(attrMeasurements)
//        attrString.appendAttributedString(attrDetails)
//        attrString.appendAttributedString(attrMeasurements)
//        attrString.appendAttributedString(attrDetails)

// then use attributedText instead of .text woot!
//        textBoxTest.attributedText = attrString
//        testlabel.attributedText = attrString
