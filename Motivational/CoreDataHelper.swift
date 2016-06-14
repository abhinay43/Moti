//
//  CoreDataHelper.swift
//  Alex
//
//  Created by Abhinay Maurya on 10/06/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit
import CoreData

class  CoreDataHelper
{
    
    static let sharedInstance = CoreDataHelper()
    static let successKey = "Success"
    
    lazy var managedObjectContex:NSManagedObjectContext = {
        let managedObjectContex = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        return managedObjectContex
        
    }()
    
    func syncContext () -> String {
        do {
            try self.managedObjectContex.save()
        }
        catch let error as NSError {
            return error.description
        }
        return CoreDataHelper.successKey
    }
    
    func performFetch (fetch:NSFetchRequest) -> [AnyObject]?
    {
        do{
            let records = try self.managedObjectContex.executeFetchRequest(fetch)
            return records
        }catch {
            return nil
        }
        
    }
}