//
//  UserProfileViewController.swift
//  Oslo
//
//  Created by Ziyi Zhang on 3/13/16.
//  Copyright © 2016 hippo_san. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController, UICollectionViewDataSource {
  
  @IBOutlet var userProfileView: DesignableView!
  @IBOutlet var avatarImageView: UIImageView!
  @IBOutlet var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    avatarImageView.layer.cornerRadius = avatarImageView.layer.frame.size.width / 2
    avatarImageView.layer.borderWidth = 1
    avatarImageView.layer.borderColor = UIColor(hex: "979797").CGColor
    avatarImageView.clipsToBounds = true
    
    collectionView.backgroundColor = UIColor.clearColor()
  }
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 2
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ProjectListCell", forIndexPath: indexPath) as! ProjectListCollectionViewCell
    cell.projectCoverImageView.image = UIImage(named: "voyage")
    cell.projectCoverImageView.layer.cornerRadius = 3
    print("touched")
    
    return cell
  }
  
  @IBAction func closeButtonDidPressed(sender: AnyObject) {
    userProfileView.animation = "fall"
    userProfileView.animate()
    self.dismissViewControllerAnimated(true, completion: nil)
  }
}
