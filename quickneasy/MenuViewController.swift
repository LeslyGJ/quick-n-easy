//
//  MenuViewController.swift
//  quickneasy
//
//  Created by bear on 12/28/16.
//  Copyright © 2016 LEA. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController : UIViewController {
    
    //var interactor:Interactor? = nil
    static var themeOne = false
    
    
    @IBAction func defaulTheme(sender: AnyObject) {
        MenuViewController.themeOne = false
        self.view.backgroundColor = UIColor.whiteColor()
        let colors = SignInViewController()
        
        colors.defaultTheme()
        
    }
    
    @IBAction func themeOne(sender: AnyObject) {
        MenuViewController.themeOne = true
        //UIColor.blueColor()
        self.view.backgroundColor = UIColorFromHex(0xF1FAE8, alpha: 0.9)
        
        let colors = SignInViewController()
        colors.changeColor()
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(MenuViewController.themeOne == true){
            
            self.view.backgroundColor = UIColorFromHex(0xF1FAE8, alpha: 0.9)
            UIColor.blueColor()
        }
        else if(MenuViewController.themeOne == false){
            
            self.view.backgroundColor = UIColor.whiteColor()
            UIColor.blueColor()
        }
        
        
        
        
        
    }
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
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
    
    @IBAction func didTapSignOut(sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
        print("Signout")
    }
    
}