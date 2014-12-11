//
//  TabBarController.swift
//  GroceryVudu
//
//  Created by Cade Ward on 12/2/14.
//  Copyright (c) 2014 Cade Ward. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    @IBOutlet weak var myTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTabBar.tintColor = UIColor.whiteColor();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
