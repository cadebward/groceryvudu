//
//  DetailViewController.swift
//  GroceryVudu
//
//  Created by Cade on 10/9/14.
//  Copyright (c) 2014 Cade Ward. All rights reserved.
//



/* 

        RULES OF SWIFT ---
        1. new lines are your BFF - if you don't use them then you will die a horrible, terrible, painful death of wondering why the -F- nothing works.




*/



import UIKit
import QuartzCore

class DetailViewController: UIViewController {
    
    @IBOutlet weak var viewTimeAndPrep: UIView!
    
    @IBOutlet weak var textBoxTest: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ideally, this is data from some other source
        var measurements = "1 Cup"
        var details = "granulated sugar"
        
        // create an attr string with attrs (awesome)
        var attrMeasurements = NSMutableAttributedString(string:"\(measurements) ", attributes:[NSFontAttributeName : UIFont(name: "HelveticaNeue-Bold", size: 19)!])
        
        var attrDetails = NSMutableAttributedString(string:"\(details)\n", attributes:[NSFontAttributeName : UIFont(name: "HelveticaNeue", size: 19)!])
        
        // MAKE A NEW FING line for EVERYHTING
        // first make the attr string with the attr crap
        var attrString = NSMutableAttributedString(attributedString: attrMeasurements)

        // then and ONLY THEN append on to it --- on a new line---------- k?
        attrString.appendAttributedString(attrDetails)
        
        // then use attributedText instead of .text woot!
        textBoxTest.attributedText = attrString

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
