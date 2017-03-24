//
//  BackgroungView.swift
//  Florence
//
//  Created by Lujul on 23/03/2017.
//  Copyright © 2017 lujul. All rights reserved.
//

import UIKit

@IBDesignable

class BackgroundView: UIView {
    
    //1
    @IBInspectable var lightColor: UIColor = UIColor.orange
    @IBInspectable var darkColor: UIColor = UIColor.yellow
    @IBInspectable var patternSize:CGFloat = 200
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    override func draw(_ rect: CGRect) {
        //2
        let context = UIGraphicsGetCurrentContext()
        
        //3
        context!.setFillColor(darkColor.cgColor)
        
        //4
        context!.fill(rect)
    
        let drawSize = CGSize(width: patternSize, height: patternSize)
        
        UIGraphicsBeginImageContextWithOptions(drawSize, true, 0.0)
        let drawingContext = UIGraphicsGetCurrentContext()
        
        //set the fill color for the new context
        darkColor.setFill()
        drawingContext!.fill(CGRectMake(0, 0, drawSize.width, drawSize.height))
        
        let trianglePath = UIBezierPath()
        //1
        trianglePath.move(to: CGPoint(x:drawSize.width/2,
                                         y:0))
        //2
        trianglePath.addLine(to: CGPoint(x:0,
                                            y:drawSize.height/2))
        //3
        trianglePath.addLine(to: CGPoint(x:drawSize.width,
                                            y:drawSize.height/2))
        
        //4
        trianglePath.move(to: CGPoint(x: 0,
                                         y: drawSize.height/2))
        //5
        trianglePath.addLine(to: CGPoint(x: drawSize.width/2,
                                            y: drawSize.height))
        //6
        trianglePath.addLine(to: CGPoint(x: 0,
                                            y: drawSize.height))
        
        //7
        trianglePath.move(to: CGPoint(x: drawSize.width,
                                         y: drawSize.height/2))
        //8
        trianglePath.addLine(to: CGPoint(x:drawSize.width/2,
                                            y:drawSize.height)) 
        //9
        trianglePath.addLine(to: CGPoint(x: drawSize.width, 
                                            y: drawSize.height))
        
        lightColor.setFill()
        trianglePath.fill()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        UIColor(patternImage: image!).setFill()
        context!.fill(rect)
        
        
    }
}
