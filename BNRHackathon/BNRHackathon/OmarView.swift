//
//  OmarView.swift
//  BNRHackathon
//
//  Created by Omar Alshammari on 12/3/15.
//  Copyright © 2015 Omar Alshammari. All rights reserved.
//

import UIKit

struct Sqaured {
    var x: CGFloat
    var y: CGFloat
    var side: CGFloat
}

enum CurrentShape {
    case Circle
    case Sqaure
}

class OmarView: UIView {
    
    var animator:UIDynamicAnimator? = nil;
    let gravity = UIGravityBehavior()
    let collider = UICollisionBehavior()
    
    
    var currentShape = CurrentShape.Circle

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
//    override func drawRect(rect: CGRect) {
//        // Drawing code
//        
//    }
    
    init(squared: Sqaured) {
        super.init(frame: CGRectMake(squared.x, squared.y, squared.side, squared.side))
        self.layer.cornerRadius = self.frame.size.height / 2.0
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func layoutIfNeeded() {
//        self.layer.cornerRadius = self.frame.size.height / 2.0
//    }
    
    func addViewDynamics() {
        animator = UIDynamicAnimator(referenceView:self);
        
        animator?.addBehavior(collider)
        animator?.addBehavior(gravity)
        
        gravity.addItem(self)
        collider.addItem(self)
        gravity.gravityDirection = CGVectorMake(0, 1.0)
        collider.translatesReferenceBoundsIntoBoundary = true


    }
    
    
    func changeMe() {
        
        switch currentShape {
        case CurrentShape.Circle:
            self.makeMeSquare()
            currentShape = .Sqaure
            
        case CurrentShape.Sqaure:
            self.makeMeCircle()
            currentShape = .Circle
        }
    }
    
    func makeMeSquare() {
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.fromValue = self.layer.cornerRadius
        animation.toValue = 10.0
        animation.duration = 0.5
        layer.addAnimation(animation, forKey: "toSquare")
        layer.cornerRadius = 10.0
        }
    
    func makeMeCircle() {
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.fromValue = self.layer.cornerRadius
        animation.toValue = self.frame.size.width / 2.0
        animation.duration = 0.5
        layer.addAnimation(animation, forKey: "toCircle")
        layer.cornerRadius = self.frame.size.width / 2.0
    }
    
    func reduceMeBy(factor: CGFloat) {
        self.layer.transform = CATransform3DMakeScale(factor, factor, 1.0)
        
    }

    func moveMe(center: CGPoint) {
//        self.layer.frame = CGRectMake(center.x, center.y, self.layer.frame.size.width, self.layer.frame.size.height)
        
        self.layer.position = center
//        self.layer.position.y += center.y
    }

    

}
