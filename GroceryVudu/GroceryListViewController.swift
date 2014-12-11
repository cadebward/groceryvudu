//
//  GroceryListViewController.swift
//  GroceryVudu
//
//  Created by Cade Ward on 11/15/14.
//  Copyright (c) 2014 Cade Ward. All rights reserved.
//

import UIKit
import CoreData

class GroceryListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var items = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchCoreData(entity: String) {
        var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        
        var request = NSFetchRequest(entityName: entity)
        request.returnsObjectsAsFaults = false
        
        var error: NSError?
        var fetchedResults = context.executeFetchRequest(request, error: &error) as [NSManagedObject]?
        if let results = fetchedResults {
            // remove duplictes from results and set items to newly formed list
            for item in results {
                if contains(items, item) {
                    // we could remove it, if we were nice
                    println("got here!!!")
                } else {
                    items.append(item)
                }
            }
//            
//            println(results);
//            items = results
        } else {
            println("Could not fetch: \(error)")
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var index = tableView.indexPathForSelectedRow()
        var cell = tableView.cellForRowAtIndexPath(index!) as IngredientCell
        var label = cell.ingredient
        
        // set a variable to keep track if we have strikethrough or not
        var hasStrikethough: Bool = false
        
        // check if label has strike through and then set our BOOL above
        label.attributedText.enumerateAttributesInRange(NSMakeRange(0, label.attributedText.length), options: NSAttributedStringEnumerationOptions.LongestEffectiveRangeNotRequired) {
            (Dictionary attrs, NSRange range, Bool safe) -> Void in
            for item in attrs {
                if item.0 == "NSStrikethrough" {
                    hasStrikethough = true
                } else {
                    hasStrikethough = false
                    
                }
            }
        }
        
        
        // based on the BOOL we either add or remove the attr from the label
        if hasStrikethough {
            // remove strikethrough
            var attr = NSMutableAttributedString(string:"\(label.text!) ")
            attr.removeAttribute(NSStrikethroughStyleAttributeName, range: NSMakeRange(0, attr.length))
            label.attributedText = attr
        } else {
            // add strikethrough
            var attr = NSMutableAttributedString(string:"\(label.text!) ")
            attr.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, attr.length))
            label.attributedText = attr
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : IngredientCell = tableView.dequeueReusableCellWithIdentifier("IngredientCell") as IngredientCell
        
        // get index of current row
        var currentIngredient = items[indexPath.row] as NSManagedObject
        
        // set recipe name label
        let item = currentIngredient.valueForKey("item") as String
        cell.ingredient.text = "\(item)"
        
        return cell
    }
    
    override func viewWillAppear(animated: Bool) {
        fetchCoreData("GroceryList")
    }
    
    func saveItem(item: String) {
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        //2
        let entity =  NSEntityDescription.entityForName("GroceryList",
            inManagedObjectContext:
            managedContext)
        
        let groceryList = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext:managedContext)
        
        //3
        groceryList.setValue(item, forKey: "item")
        
        //4
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }  
        //5
        items.append(groceryList)
    }
    
    @IBAction func manualAddToList(sender: AnyObject) {
        var alert = UIAlertController(title: "New Item", message: "Add a new item", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default) { (action: UIAlertAction!) -> Void in
            // add new item to list
            let textField = alert.textFields![0] as UITextField
            let text = textField.text
            
            self.saveItem(text)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default) {
            (action: UIAlertAction!) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    // ability to swipe to delete
    
    func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            removeItem(indexPath, object: items[indexPath.row])
        }
    }
    
    func removeItem(index: NSIndexPath, object: NSManagedObject) {
        var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        // remove from core data
        context.deleteObject(object)
        // remove from array
        items.removeAtIndex(index.row)
        // and remove from tableview, with nice animation
        tableView.deleteRowsAtIndexPaths([index], withRowAnimation: UITableViewRowAnimation.Automatic)
        
        var error: NSError?
        if !context.save(&error) {
            abort()
        }
    }
    
    func removeAllItems() {
        var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context: NSManagedObjectContext = appDel.managedObjectContext!

        for object in self.items {
            // remove from core data
            context.deleteObject(object)
            
        }
        
        // create blank array
        items = [NSManagedObject]()
        
        tableView.reloadData()
        
        var error: NSError?
        if !context.save(&error) {
            abort()
        }
    }
    
    @IBAction func clearList(sender: AnyObject) {
        var alert = UIAlertController(title: "Alert", message: "Are you sure you want to clear your grocery list?", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
            switch action.style{
            case .Default:
                println("default")
                // clear core data
                self.removeAllItems()
                
            case .Cancel:
                println("cancel")
                
            case .Destructive:
                println("destructive")
            }
        }))
    }
    
}

class IngredientCell: UITableViewCell {
    
    @IBOutlet weak var ingredient: UILabel!
    
}
