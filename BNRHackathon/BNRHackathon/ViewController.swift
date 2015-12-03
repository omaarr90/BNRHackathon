//
//  ViewController.swift
//  BNRHackathon
//
//  Created by Omar Alshammari on 12/3/15.
//  Copyright © 2015 Omar Alshammari. All rights reserved.
//

import UIKit



extension UIView {
    
    func rotate360Degrees(duration: CFTimeInterval = 120.0, completionDelegate: AnyObject? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(M_PI * 500.0)
        rotateAnimation.duration = duration
        
        if let delegate: AnyObject = completionDelegate {
            rotateAnimation.delegate = delegate
        }
        self.layer.addAnimation(rotateAnimation, forKey: nil)
    }
    
    func positionMove(duration: CFTimeInterval = 10.0, completionDelegate: AnyObject? = nil) {
        let positionAnimation = CABasicAnimation(keyPath: "position")
        positionAnimation.toValue = NSValue(CGPoint: CGPointMake(layer.position.x, 0.0))
        positionAnimation.duration = duration
        
        if let delegate: AnyObject = completionDelegate {
            positionAnimation.delegate = delegate
        }
        self.layer.addAnimation(positionAnimation, forKey: nil)
    }

    
}

class ViewController: UIViewController {

    var omarView: OmarView!
    
    @IBOutlet weak var redView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let smartPinView = SmartPinView()
        
        
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
        
        redView.rotate360Degrees()
        redView.positionMove()
        

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
    
//    override func viewDidAppear(animated: Bool) {
//        let omarAnimations = OmarAnimations()
//        omarAnimations.animatedView = self.greenView
//        omarAnimations.animationDuration = 2.0
//        omarAnimations.animationDelay = 0.0
//        omarAnimations.animationInitialSpringVelocity = 7.0
//        omarAnimations.animationSpringDamping = 5.0
//        omarAnimations.animationCompletion = nil
//        omarAnimations.animationOptions = UIViewAnimationOptions.CurveEaseIn
//        omarAnimations.theAnimations = {
//            self.greenView.center.x += 50
//        }
//        
//        omarAnimations.animateTheView()
//    }


}

