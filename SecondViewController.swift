//
//  SecondViewController.swift
//  
//
//  Created by bear on 12/22/16.
//
//

import UIKit

class SecondViewController: NSObject {
    
    
    
    @IBAction func didTapSignOut(sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
    }

}
