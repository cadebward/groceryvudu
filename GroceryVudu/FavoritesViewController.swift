//
//  FavoritesViewController.swift
//  GroceryVudu
//
//  Created by Cade Ward on 11/15/14.
//  Copyright (c) 2014 Cade Ward. All rights reserved.
//

import UIKit
import CoreData

class FavoritesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var favorites = [NSManagedObject]()
    
    func fetchCoreData(entity: String) {
        var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        
        var request = NSFetchRequest(entityName: entity)
        request.returnsObjectsAsFaults = false
        
        var error: NSError?
        var fetchedResults = context.executeFetchRequest(request, error: &error) as [NSManagedObject]?
        if let results = fetchedResults {
            favorites = results
        } else {
            println("Could not fetch: \(error)")
        }
        println("Fetching favs")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : FavoriteCell = tableView.dequeueReusableCellWithIdentifier("FavoriteCell") as FavoriteCell
        
        // get index of current row
        var currentFavorite = favorites[indexPath.row] as NSManagedObject
        
        // set recipe name label
        let item = currentFavorite.valueForKey("name") as String
        cell.name.text = "\(item)"
        
        return cell
    }
    
    override func viewWillAppear(animated: Bool) {
        fetchCoreData("Favorites")
    }
    
    // ability to swipe to delete
    
    func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            removeItem(indexPath, object: favorites[indexPath.row])
        }
    }
    
    func removeItem(index: NSIndexPath, object: NSManagedObject) {
        var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        // remove from core data
        context.deleteObject(object)
        // remove from array
        favorites.removeAtIndex(index.row)
        // and remove from tableview, with nice animation
        tableView.deleteRowsAtIndexPaths([index], withRowAnimation: UITableViewRowAnimation.Automatic)
        
        var error: NSError?
        if !context.save(&error) {
            abort()
        }
    }
}

class FavoriteCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    
}
