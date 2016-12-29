//
//  RecipeSearchViewController.swift
//  quickneasy
//
//  Created by Eliasar Gandara on 12/28/16.
//  Copyright © 2016 LEA. All rights reserved.
//

import UIKit

class RecipeSearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var menuBar: UIToolbar!
    //var menuBar: UIToolbar!

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet var tableView: UITableView!
    
    var names = ["Salmon", "Pizza", "Steak", "Stew", "Orange Chicken"]
    var images = [UIImage(named: "Salmon"), UIImage(named: "Pizza"), UIImage(named: "Steak"), UIImage(named: "Stew"), UIImage(named: "Orange Chicken")]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        
        cell.photo.image = images[indexPath.row]
        cell.name.text = names[indexPath.row]
        
        return cell
    }
    
    func toolBarChange(){
        let load = RecipeSearchViewController()
            load.viewDidLoad()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
               let state = SignInViewController.themeOne
        print("------->:\(state)")
        
        if(SignInViewController.themeOne == true){
            
            self.view.backgroundColor = UIColorFromHex(0xF1FAE8, alpha: 0.9)
            if(menuBar != nil){
                menuBar.barTintColor = UIColor.blackColor()
            }
        }
        else if(SignInViewController.themeOne == false){
            
            self.view.backgroundColor = UIColor.whiteColor()
            if(menuBar != nil){
                menuBar.barTintColor = UIColor.redColor()
            }
        }
        
    }
    
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }

}
