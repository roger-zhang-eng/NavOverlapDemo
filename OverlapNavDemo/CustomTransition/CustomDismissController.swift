//
//  CustomDismissController.swift
//  OverlapNavDemo
//
//  Created by Roger Zhang on 8/1/19.
//  Copyright © 2019 Roger Zhang. All rights reserved.
//

import UIKit

class CustomDismissController: NSObject, UIViewControllerAnimatedTransitioning {
    internal func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    internal func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        
        let fromViewHeight = fromView.frame.height
        let currentFrameForVC = fromView.frame
        let finalModFrame = CGRect(x: currentFrameForVC.origin.x, y: currentFrameForVC.origin.y + fromViewHeight, width: currentFrameForVC.width, height: fromViewHeight)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            fromView.frame = finalModFrame
            toViewController.view.alpha = 1.0
            toViewController.view.transform = CGAffineTransform.identity
        }, completion: {
            finished in
            transitionContext.completeTransition(true)
            fromView.removeFromSuperview()
            toViewController.viewWillAppear(true)
        })
        
    }
}
