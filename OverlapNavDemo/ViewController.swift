//
//  ViewController.swift
//  OverlapNavDemo
//
//  Created by Roger Zhang on 8/1/19.
//  Copyright © 2019 Roger Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func nextAction(_ sender: UIBarButtonItem) {
        debugPrint("Click Next")
        
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "nextView") as! NewViewController
        

        let nextNav = NewNavController(rootViewController: nextVC)
        nextNav.transitioningDelegate = self
        nextNav.modalPresentationStyle = .custom
        
        
        
        present(nextNav, animated: true, completion: nil)
    }
}

//Mark: - UIViewControllerTransitioningDelegate
extension ViewController: UIViewControllerTransitioningDelegate {
     func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomPresentController()
    }
    
     func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomDismissController()
    }
}

