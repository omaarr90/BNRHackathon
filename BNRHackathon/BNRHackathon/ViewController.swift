//
//  ViewController.swift
//  BNRHackathon
//
//  Created by Omar Alshammari on 12/3/15.
//  Copyright © 2015 Omar Alshammari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let smartPinView = SmartPinView()
        
        
        _ = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "createView", userInfo: nil, repeats: true)
        
    }
        
    func createView()
    {

        let smartView: UIView
        smartView = UIView.init(frame: CGRectMake(0, 0, 50, 50))
        smartView.backgroundColor = UIColor.greenColor()

        
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 0,y:0))
        
        path.addCurveToPoint(CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.maxY), controlPoint1: CGPoint(x: 400, y: 100), controlPoint2: CGPoint(x: 300, y: 300))
        
        // create a new CAKeyframeAnimation that animates the objects position
        let anim = CAKeyframeAnimation(keyPath: "position")
        
        // set the animations path to our bezier curve
        anim.path = path.CGPath
        
        // set some more parameters for the animation
        // this rotation mode means that our object will rotate so that it's parallel to whatever point it is currently on the curve
        anim.rotationMode = kCAAnimationRotateAuto
        anim.repeatCount = Float.infinity
        anim.duration = 5.0
        
        // we add the animation to the squares 'layer' property
        smartView.layer.addAnimation(anim, forKey: "animate position along path")
        
//        var single = UITapGestureRecognizer.init(target: self, action:Selector("handleSingleTap:"))
//        smartView.userInteractionEnabled = true
//        smartView.addGestureRecognizer(single)
        
//        UITapGestureRecognizer *singleFingerTap =
//            [[UITapGestureRecognizer alloc] initWithTarget:self
//                action:@selector(handleSingleTap:)];
//        [self.view addGestureRecognizer:singleFingerTap];
        
//        [smartView addTarget:self action:@selector(myEvent:) forControlEvents:UIControlEventTouchDown];

        self.view .addSubview(smartView)
    }
//        smartPin.view = self.view
        
        // Do any additional setup after loading the view, typically from a nib.

    func handleSingleTap(sender: UIGestureRecognizer)
    {
    sender.view?.superview?.backgroundColor = UIColor.yellowColor()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

