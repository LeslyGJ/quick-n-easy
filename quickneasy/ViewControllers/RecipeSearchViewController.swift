//
//  RecipeSearchViewController.swift
//  quickneasy
//
//  Created by Eliasar Gandara on 12/28/16.
//  Copyright © 2016 LEA. All rights reserved.
//

import UIKit

class RecipeSearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
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

}
