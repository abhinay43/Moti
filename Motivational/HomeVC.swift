//
//  HomeVC.swift
//  Motivational
//
//  Created by Abhinay Maurya on 14/06/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class HomeVC: UIViewController
{
    static let controllerID = "HomeVC"
    static let segueID = "HomeSegue"
    
    
    //MARK:- View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   //MARK:- IBAction
    @IBAction func showMyCollections(sender: AnyObject) {
        self.performSegueWithIdentifier(CollectionVC.segueID, sender: nil)
    }
    
    @IBAction func openSettingPage(sender: AnyObject) {
         self.performSegueWithIdentifier(SettingVC.segueID, sender: nil)
    }
    
    //MARK:- Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == CollectionVC.segueID{
            
        }else if segue.identifier == CollectionVC.segueID{
        
        }

    }
    
}
