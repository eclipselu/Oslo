//
//  MenuTableViewController.swift
//  Oslo
//
//  Created by Ziyi Zhang on 3/13/16.
//  Copyright © 2016 hippo_san. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
  
  var menuItems = ["Projects", "Working in Progress"]
  var currentItem = "Projects"
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menuItems.count
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let menuTableViewController = segue.sourceViewController as! MenuTableViewController
    
    if let selectedIndexPath = menuTableViewController.tableView.indexPathForSelectedRow {
      currentItem = menuItems[selectedIndexPath.row]
    }
    
//    let menuTableViewController = segue.sourceViewController as! MenuTableViewController
    
//    if let selectedIndexPath = tableView.indexPathForSelectedRow {
//      currentItem = menuItems[selectedIndexPath.row]
//    }
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("MenuCell") as! MenuTableViewCell
    cell.menuLabel.text = menuItems[indexPath.row]
    cell.menuLabel.textColor = menuItems[indexPath.row] == currentItem ? UIColor(hex: "D7D7D7") : UIColor(hex: "D7D7D7").colorWithAlphaComponent(0.5)
    
    return cell
  }
  
}
