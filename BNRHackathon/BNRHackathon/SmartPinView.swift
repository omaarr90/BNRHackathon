//
//  SmartPinView.swift
//  BNRHackathon
//
//  Created by abdullah almalki on 12/3/15.
//  Copyright © 2015 Omar Alshammari. All rights reserved.
//

import UIKit

class SmartPinView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        drawCircle()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawCircle()
    {
        let squareView = UIView.init(frame: CGRectMake(200, 300, 70, 70))
        squareView.backgroundColor = UIColor.greenColor()
        
//        let maskPath = UIBezierPath(roundedRect: squareView.bounds,
//            byRoundingCorners: UIRectCorner.TopLeft,
//            cornerRadii: CGSize(width: 10.0, height: 10.0))
//        
//        maskPath.fill()
//        maskPath.stroke()
        
        self.layer .addSublayer(squareView.layer)
        
    }
    
    /*
     Only override drawRect: if you perform custom drawing.
     An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
         Drawing code
    }
    */

}
