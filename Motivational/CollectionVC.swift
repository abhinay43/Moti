//
//  CollectionVC.swift
//  Motivational
//
//  Created by Abhinay Maurya on 14/06/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit
import CoreData

class CollectionVC: UIViewController,UITableViewDelegate,UITableViewDataSource,NSFetchedResultsControllerDelegate
{

    static let controllerID = "CollectionVC"
    static let segueID = "CollectionSegue"
    static let cellID = "CollectionCell"
    
    //MARK:- Stored Properties
    
    //Step 1 :
    //instance of managedObjectContext/Scratch Pad
    lazy var managedObjectContext:NSManagedObjectContext = {
        
        let managedObjectContext = CoreDataHelper.sharedInstance.managedObjectContex
        return managedObjectContext
    }()
    
    //instance of fetchedResultsController
    lazy var fetchedResultsController: NSFetchedResultsController = {
        
        
        let fetchRequest = NSFetchRequest(entityName: Collection.entityName)
        
        // Add Sort Descriptors
        let sortDescriptor = NSSortDescriptor(key: Collection.Keys.title, ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        return fetchedResultsController
        
    }()

    
    
    
    //MARK:- IBOutlet
    @IBOutlet weak var tblCollection:UITableView!
    
    //MARK:- View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblCollection.delegate = self
        self.tblCollection.dataSource = self
        
        //Step 2:
        do {
            try self.fetchedResultsController.performFetch()
        } catch {
            let fetchError = error as NSError
            print("\(fetchError), \(fetchError.userInfo)")
            abort()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:- IBAction
    
    @IBAction func editAction(sender: AnyObject) {
    }
    
    @IBAction func addAction(sender: AnyObject) {
    }
    
    
    //MARK:- TableView DataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let sections = fetchedResultsController.sections {
            return sections.count
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultsController.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(CollectionVC.cellID, forIndexPath: indexPath)
        
        // Configure Table View Cell
        configureCell(cell, atIndexPath: indexPath)
        
        return cell
    }
    
    func configureCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath)
    {
        // Fetch Record
        let collectionRecord = fetchedResultsController.objectAtIndexPath(indexPath) as! Collection
        
        // Update Cell
        if let title = collectionRecord.valueForKey(Collection.Keys.title) as? String{
            cell.textLabel!.text = title
        }
    }
    
    
    
    //MARK:- TableView Delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.tblCollection.deselectRowAtIndexPath(indexPath, animated:true)
        self.performSegueWithIdentifier(CollectionListVC.segueID, sender: indexPath)
    }
    
    //MARK:- NSFetchedResultsController Delegate
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        dispatch_async(dispatch_get_main_queue(),{
            self.tblCollection.beginUpdates()
        })
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        dispatch_async(dispatch_get_main_queue(),{
            self.tblCollection.endUpdates()
        })
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?)
    {
        dispatch_async(dispatch_get_main_queue(),{
            switch (type) {
            case .Insert:
                if let indexPath = newIndexPath {
                    self.tblCollection.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                }
                break;
            case .Delete:
                if let indexPath = indexPath {
                    self.tblCollection.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                }
                break;
            case .Update:
                if let indexPath = indexPath {
                    let cell = self.tblCollection.cellForRowAtIndexPath(indexPath)!
                    self.configureCell(cell, atIndexPath: indexPath)
                }
                break;
            case .Move:
                if let indexPath = indexPath {
                    self.tblCollection.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                }
                
                if let newIndexPath = newIndexPath {
                    self.tblCollection.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Fade)
                }
                break;
            }
        })
    }
    
   
    
    //MARK:- Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == CollectionListVC.segueID{
            let vc = segue.destinationViewController as! CollectionListVC
            print(vc)
        }
    }

}
