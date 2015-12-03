//
//  OmarAnimations.swift
//  BNRHackathon
//
//  Created by Omar Alshammari on 12/3/15.
//  Copyright © 2015 Omar Alshammari. All rights reserved.
//

import UIKit
import QuartzCore

class OmarAnimations: NSObject {
    var animatedView: UIView!
    var animationDuration: NSTimeInterval!
    var animationDelay: NSTimeInterval!
    var animationSpringDamping: CGFloat!
    var animationInitialSpringVelocity: CGFloat!
    var animationOptions: UIViewAnimationOptions!
    var theAnimations: (() -> Void)!
    var animationCompletion: ((Bool) -> Void)?
    
    
    func animateTheView() {
        UIView.animateWithDuration(animationDuration, delay: animationDelay, usingSpringWithDamping: animationSpringDamping, initialSpringVelocity: animationInitialSpringVelocity, options: animationOptions, animations: theAnimations, completion: animationCompletion)
    }
    
}
