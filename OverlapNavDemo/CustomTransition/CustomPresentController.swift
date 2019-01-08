//
//  CustomPresentController.swift
//  OverlapNavDemo
//
//  Created by Roger Zhang on 8/1/19.
//  Copyright © 2019 Roger Zhang. All rights reserved.
//

import UIKit

class CustomPresentController: NSObject, UIViewControllerAnimatedTransitioning {
    internal func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    internal func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let finalViewYOffset: CGFloat = 65
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        let finalFrameForVC = transitionContext.finalFrame(for: toViewController)
        let finalModFrame = CGRect(x: finalFrameForVC.origin.x, y: finalFrameForVC.origin.y + finalViewYOffset, width: finalFrameForVC.width, height: finalFrameForVC.height - finalViewYOffset)
        let containerView = transitionContext.containerView
        let bounds = UIScreen.main.bounds
        
        toViewController.view.frame = finalModFrame.offsetBy(dx: 0, dy: bounds.size.height)
        
        containerView.addSubview(toViewController.view)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .curveLinear, animations: {
            fromViewController.view.alpha = 0.5
            fromViewController.view.transform = CGAffineTransform.identity.scaledBy(x: 0.91, y: 0.90)
            toViewController.view.frame = finalModFrame
        }, completion: {
            finished in
            transitionContext.completeTransition(true)
        })
    }
    
}
