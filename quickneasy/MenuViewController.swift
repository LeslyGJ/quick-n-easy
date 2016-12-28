//
//  MenuViewController.swift
//  quickneasy
//
//  Created by bear on 12/28/16.
//  Copyright © 2016 LEA. All rights reserved.
//

import Foundation
//
//  MenuViewController.swift
//  quickneasy
//
//  Created by bear on 12/27/16.
//  Copyright © 2016 LEA. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController : UIViewController {
    
    //var interactor:Interactor? = nil
    
    @IBAction func handleGesture(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(view)
        
        let progress = MenuHelper.calculateProgress(translation, viewBounds: view.bounds, direction: .Left)
        
       /* MenuHelper.mapGestureStateToInteractor(
            sender.state,
            progress: progress,
            interactor: interactor){
                self.dismissViewControllerAnimated(true, completion: nil)
        }
 */
    }
    
    @IBAction func closeMenu(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func didTapSignOut(sender: AnyObject) {GIDSignIn.sharedInstance().signOut()
        
        print("Signout")
        
    }
    
}