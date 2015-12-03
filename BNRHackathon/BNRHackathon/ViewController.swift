//
//  ViewController.swift
//  BNRHackathon
//
//  Created by Omar Alshammari on 12/3/15.
//  Copyright © 2015 Omar Alshammari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var omarView: OmarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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

