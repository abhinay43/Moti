//
//  Config.swift
//  Motivational
//
//  Created by Abhinay Maurya on 14/06/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import Foundation

class Config
{
    static let sharedInstance = Config()
    
    
    func getAdmobID () -> String {
        return "YOUR_ADMOB_ID"
    }
    
    func inAppPurchaseIdentifier_Ads () -> String {
        return "IAP_Identifier"
    }
}