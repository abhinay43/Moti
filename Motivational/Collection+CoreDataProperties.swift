//
//  Collection+CoreDataProperties.swift
//  Motivational
//
//  Created by Abhinay Maurya on 14/06/16.
//  Copyright © 2016 ONS. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Collection {

    @NSManaged var title: String?
    @NSManaged var id: String?
    @NSManaged var list: NSSet?

}
