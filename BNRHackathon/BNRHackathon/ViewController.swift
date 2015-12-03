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

    @IBOutlet weak var redView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        redView.rotate360Degrees()
        redView.positionMove()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

