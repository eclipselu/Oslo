//
//  MenuTransitionManager.swift
//  Oslo
//
//  Created by Ziyi Zhang on 3/13/16.
//  Copyright © 2016 hippo_san. All rights reserved.
//

import UIKit

@objc protocol MenuTransitionManagerDelegate: class {
  func dismiss()
}

class MenuTransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
  
  let duration = 0.5
  var isPresenting = false
  
  weak var delegate: MenuTransitionManagerDelegate?
  
  var snapshot: UIView? {
    didSet {
      if let delegate = delegate {
        let tapGestureRecognizer = UITapGestureRecognizer(target: delegate, action: #selector(MenuTransitionManagerDelegate.dismiss))
        snapshot?.addGestureRecognizer(tapGestureRecognizer)
      }
    }
  }
  
  func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
    return duration
  }
  
  func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    let projectView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
    let menuView = transitionContext.viewForKey(UITransitionContextToViewKey)!
    
    guard let container = transitionContext.containerView() else { return }
    
    let moveDown = CGAffineTransformMakeTranslation(0, container.frame.height - 231)
    let moveUp = CGAffineTransformMakeTranslation(0, -50)
    
    if isPresenting {
      menuView.transform = moveUp
      snapshot = projectView.snapshotViewAfterScreenUpdates(true)
      container.addSubview(menuView)
      container.addSubview(snapshot!)
    }
    
    UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: [], animations: {
      if self.isPresenting {
        self.snapshot?.transform = moveDown
        menuView.transform = CGAffineTransformIdentity
      } else {
        self.snapshot?.transform = CGAffineTransformIdentity
        projectView.transform = moveUp
      }
      }, completion: { finished in
        transitionContext.completeTransition(true)
        
        if !self.isPresenting {
          self.snapshot?.removeFromSuperview()
        }
    })
  }
  
  func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    isPresenting = true
    return self
  }
  
  func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    isPresenting = false
    return self
  }
  
}