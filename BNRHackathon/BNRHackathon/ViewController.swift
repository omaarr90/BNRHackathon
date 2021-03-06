//
//  ViewController.swift
//  BNRHackathon
//
//  Created by Omar Alshammari on 12/3/15.
//  Copyright © 2015 Omar Alshammari. All rights reserved.
//

import UIKit

extension UIView{
    
    func rotate360Degrees(duration: CFTimeInterval = 2.0, completionDelegate: AnyObject? = nil) {
        
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(M_PI * -4.6)
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount = Float.infinity
        
        if let delegate: AnyObject = completionDelegate {
            rotateAnimation.delegate = delegate
        }
        self.layer.addAnimation(rotateAnimation, forKey: nil)
    }
}

class ViewController: UIViewController {
    
    var omarView: OmarView!
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var fanBldesIMG: UIImageView!
    
    let fanImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fanBldesIMG.rotate360Degrees()
        
        _ = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "createView", userInfo: nil, repeats: true)
        
        let sqaure = Sqaured(x: 100, y: 100, side: 100)
        
        omarView = OmarView(squared: sqaure)
        
        omarView.backgroundColor = UIColor.greenColor()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "changeMe")
        omarView.addGestureRecognizer(tapGesture)
        
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: "pinched:")
        omarView.addGestureRecognizer(pinchRecognizer)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: "moveMe:")
        omarView.addGestureRecognizer(panGesture)
        
        self.view.addSubview(omarView)
        
        
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
        
        self.view .addSubview(smartView)
    }
    
    func handleSingleTap(sender: UIGestureRecognizer)
    {
        sender.view?.superview?.backgroundColor = UIColor.yellowColor()
        
    }
    
    
    func changeMe() {
        omarView.changeMe()
    }
    
    func pinched(recognizer: UIPinchGestureRecognizer) {
        //get the factor
        let scale = recognizer.scale
        omarView.reduceMeBy(scale)
    }
    
    func moveMe(recognizer: UIPanGestureRecognizer) {
        //        let center = recognizer.translationInView(recognizer.view)
        let center = recognizer.locationInView(self.view)
        if recognizer.state == UIGestureRecognizerState.Began {
            return
        } else if recognizer.state == .Changed {
            self.omarView.moveMe(center)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

