//
//  ProjectTableViewCell.swift
//  Oslo
//
//  Created by hippo_san on 3/11/16.
//  Copyright © 2016 hippo_san. All rights reserved.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {

  @IBOutlet weak var projectImageView: UIImageView!
  @IBOutlet weak var projectNameLabel: UILabel!
  @IBOutlet weak var upvoteButton: SpringButton!
  @IBOutlet weak var commentButton: SpringButton!
  @IBOutlet weak var projectDescriptionTextView: AutoTextView!
  @IBOutlet weak var avatarImageView: UIImageView!
  @IBOutlet weak var usernameLabel: UILabel!
  
  @IBAction func upvoteButtonDidPressed(sender: AnyObject) {
    upvoteButton.animation = "pop"
    upvoteButton.force = 2
    upvoteButton.animate()
  }
  
  
}
