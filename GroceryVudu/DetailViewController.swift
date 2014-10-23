//
//  DetailViewController.swift
//  GroceryVudu
//
//  Created by Cade on 10/9/14.
//  Copyright (c) 2014 Cade Ward. All rights reserved.
//

import UIKit
import QuartzCore

class DetailViewController: UIViewController {
    
    @IBOutlet weak var viewTimeAndPrep: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        viewTimeAndPrep.layer.borderColor = (UIColor.grayColor()).CGColor
//        viewTimeAndPrep.layer.borderWidth = CGFloat(1.0)
        
//        var bounds: CGRect = UIScreen.mainScreen().bounds
//        var screenWidth: CGFloat = bounds.size.width
//        
//        scroller.scrollEnabled = true
//        scroller.contentSize = CGSizeMake(10, 1200)
//        println(screenWidth)
        
        // Do any additional setup after loading the view.
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
