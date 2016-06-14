//
//  CollectionListHelper.swift
//  Motivational
//
//  Created by Abhinay Maurya on 14/06/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import Foundation
import CoreData

class CollectionListHelper
{
    enum Response : String
    {
        case RecordAdded, SomethingWrong
    }
    
    static let entityName = Collection.entityName
    
    
//    static func saveCollectionListRecord (quote rQuote:String, photo rPhoto:NSData, writer) -> (Response, Collection?)
//    {
//        
//        if CollectionRecordHelper.collectionTitleExistOrNot(rTitle) == true {
//            return (Response.CollectionNameExist, nil)
//        }
//        
//        
//        let enitity = NSEntityDescription.insertNewObjectForEntityForName(CollectionRecordHelper.entityName, inManagedObjectContext: CoreDataHelper.sharedInstance.managedObjectContex) as! Collection
//        enitity.title = rTitle
//        enitity.id = Utility.udid()
//        
//        if CoreDataHelper.sharedInstance.syncContext() == CoreDataHelper.successKey {
//            return  (Response.RecordAdded, enitity)
//        }else{
//            return (Response.SomethingWrong, nil)
//        }
//    }

}