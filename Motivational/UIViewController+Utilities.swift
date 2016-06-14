//
//  UIViewController+Utilities.swift
//  Alex
//
//  Created by Abhinay Maurya on 27/05/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title alertTitle:String, message alertMessage:String)
    {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .Alert)
        let alertAction = UIAlertAction(title: "Ok", style: .Cancel, handler: nil)
        alert.addAction(alertAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
}