//
//  ProjectsTableViewController.swift
//  Oslo
//
//  Created by hippo_san on 3/11/16.
//  Copyright © 2016 hippo_san. All rights reserved.
//

import UIKit

class ProjectsTableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = "Projects"
    
    tableView.estimatedRowHeight = 100
    tableView.rowHeight = UITableViewAutomaticDimension
  }
  
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return .LightContent
  }

  @IBAction func MenuButtonDidPressed(sender: AnyObject) {
    performSegueWithIdentifier("MenuSegue", sender: self)
  }
  
  @IBAction func LoginButtonDidPressed(sender: AnyObject) {
    performSegueWithIdentifier("LoginSegue", sender: self)
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCell") as! ProjectTableViewCell
    cell.projectImageView.image = UIImage(named: "voyage")
    cell.projectNameLabel.text = "Voyage"
    cell.upvoteButton.setTitle("2321", forState: UIControlState.Normal)
    cell.commentButton.setTitle("115", forState: UIControlState.Normal)
    cell.avatarImageView.image = UIImage(named: "avatar")
    cell.avatarImageView.layer.cornerRadius = cell.avatarImageView.frame.size.width / 2
    cell.avatarImageView.clipsToBounds = true
    cell.avatarImageView.layer.borderWidth = 1
    cell.avatarImageView.layer.borderColor = UIColor(hex: "979797").CGColor
    
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ProjectsTableViewController.imageTapped))
    cell.avatarImageView.addGestureRecognizer(tapGestureRecognizer)
    
    cell.layoutMargins = UIEdgeInsetsZero
    
    return cell
  }
  
  func imageTapped(image: UIImage) {
    performSegueWithIdentifier("ProfileSegue", sender: image)
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    performSegueWithIdentifier("DetailSegue", sender: self)
    
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
  
  @IBAction func unwindToMenu(segue: UIStoryboardSegue) {
    let sourceController = segue.sourceViewController as! MenuTableViewController
    self.title = sourceController.currentItem
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let menuTableViewController = segue.destinationViewController as! MenuTableViewController
    menuTableViewController.currentItem = self.title!
  }
  
}
