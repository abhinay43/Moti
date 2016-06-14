//
//  CollectionRecordHelper.swift
//  Motivational
//
//  Created by Abhinay Maurya on 14/06/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit
import CoreData

class CollectionRecordHelper
{
    
    enum Response : String{
        case RecordAdded, CollectionNameExist, SomethingWrong
    }
    
    static let entityName = Collection.entityName
    
    
    static func saveCollectionRecord (title rTitle:String) -> (Response, Collection?)
    {
        
        if CollectionRecordHelper.collectionTitleExistOrNot(rTitle) == true {
            return (Response.CollectionNameExist, nil)
        }
        
        
        let enitity = NSEntityDescription.insertNewObjectForEntityForName(CollectionRecordHelper.entityName, inManagedObjectContext: CoreDataHelper.sharedInstance.managedObjectContex) as! Collection
        enitity.title = rTitle
        enitity.id = Utility.udid()
        
        if CoreDataHelper.sharedInstance.syncContext() == CoreDataHelper.successKey {
            return  (Response.RecordAdded, enitity)
        }else{
            return (Response.SomethingWrong, nil)
        }
    }
    
    static func collectionTitleExistOrNot (title:String) -> Bool
    {
        let fetchRequest = NSFetchRequest(entityName:CollectionRecordHelper.entityName)
        let predicate = NSPredicate(format: "title == %@", title)
        fetchRequest.predicate = predicate
        
        guard let records = CoreDataHelper.sharedInstance.performFetch(fetchRequest) else {
            return false
        }
        
        if records.count > 0 {
            return true
        }
        return false
    }

    
}
