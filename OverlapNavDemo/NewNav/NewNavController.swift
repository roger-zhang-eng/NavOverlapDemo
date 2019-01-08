//
//  NewNavController.swift
//  OverlapNavDemo
//
//  Created by Roger Zhang on 8/1/19.
//  Copyright © 2019 Roger Zhang. All rights reserved.
//

import UIKit

class NewNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNewFormTableViewController()
        self.modalPresentationCapturesStatusBarAppearance = true
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    func setupNewFormTableViewController() {
        let proxyApperance = self.navigationBar
        proxyApperance.tintColor = UIColor.black
        proxyApperance.barTintColor = .white
        proxyApperance.backgroundColor = .white
        //proxyApperance.setBackgroundImage(LPUtilities.image(with: .white), for: .default)
        proxyApperance.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        proxyApperance.barStyle = .default
        proxyApperance.setBackgroundImage(UIColor.white.as1ptImage(), for: .default)
        proxyApperance.shadowImage = UIColor.white.as1ptImage()
    }
}

extension UIColor {
    func as1ptImage() -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        setFill()
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()
        return image
    }
}
