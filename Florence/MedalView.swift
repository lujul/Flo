//
//  MedalView.swift
//  Florence
//
//  Created by Lujul on 24/03/2017.
//  Copyright © 2017 lujul. All rights reserved.
//

import UIKit

class MedalView: UIImageView {
    
    lazy var medalImage:UIImage = self.createMedalImage()

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func showMedal(show:Bool) {
        if show {
            image = medalImage
        } else {
            image = nil
        }
    }
    func createMedalImage() -> UIImage {
        
        let size = CGSize(width: 120, height: 200)
        
        func CGPointMake(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
            return CGPoint(x: x, y: y)
        }
        func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
            return CGRect(x: x, y: y, width: width, height: height)
        }
        func CGSizeMake(_ x: CGFloat, _ y: CGFloat) -> CGSize {
            return CGSize(width: x, height: y)
        }
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        
        //Add Shadow
        let shadow:UIColor = UIColor.black.withAlphaComponent(0.80)
        let shadowOffset = CGSizeMake(2.0, 2.0)
        let shadowBlurRadius: CGFloat = 5
        
        context!.setShadow(offset: shadowOffset,
                           blur: shadowBlurRadius,
                           color: shadow.cgColor)
        context!.beginTransparencyLayer(auxiliaryInfo: nil)
        
        //Gold colors
        let darkGoldColor = UIColor(red: 0.6, green: 0.5, blue: 0.15, alpha: 1.0)
        let midGoldColor = UIColor(red: 0.86, green: 0.73, blue: 0.3, alpha: 1.0)
        let lightGoldColor = UIColor(red: 1.0, green: 0.98, blue: 0.9, alpha: 1.0)
        
        //Lower Ribbon
        var lowerRibbonPath = UIBezierPath()
        lowerRibbonPath.move(to: CGPointMake(0,0))
        lowerRibbonPath.addLine(to: CGPointMake(40,0))
        lowerRibbonPath.addLine(to: CGPointMake(78, 70))
        lowerRibbonPath.addLine(to: CGPointMake(38, 70))
        lowerRibbonPath.close()
        UIColor.red.setFill()
        lowerRibbonPath.fill()
        
        //Clasp
        
        var claspPath = UIBezierPath(roundedRect:
            CGRectMake(36, 62, 43, 20),
                                     cornerRadius: 5)
        claspPath.lineWidth = 5
        darkGoldColor.setStroke()
        claspPath.stroke()
        
        //Medallion
        
        var medallionPath = UIBezierPath(ovalIn:
            CGRect(origin: CGPointMake(8, 72),
                   size: CGSizeMake(100, 100)))
        context!.saveGState()
        medallionPath.addClip()
        
        let colours = [darkGoldColor.cgColor, midGoldColor.cgColor, lightGoldColor.cgColor] as CFArray
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colours , locations: [0, 0.51, 1])
        
        context!.drawLinearGradient(gradient!,
                                    start: CGPointMake(40, 40),
                                    end: CGPointMake(100,160),
                                    options: CGGradientDrawingOptions(rawValue: 0))
        
        context!.restoreGState()
        
        //Create a transform
        //Scale it, and translate it right and down
        var transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        transform = transform.translatedBy(x: 15, y: 30)
        
        medallionPath.lineWidth = 2.0
        
        //apply the transform to the path
        medallionPath.apply(transform)
        medallionPath.stroke()
        
        //Upper Ribbon
        
        var upperRibbonPath = UIBezierPath()
        upperRibbonPath.move(to: CGPointMake(68, 0))
        upperRibbonPath.addLine(to: CGPointMake(108, 0))
        upperRibbonPath.addLine(to: CGPointMake(78, 70))
        upperRibbonPath.addLine(to: CGPointMake(38, 70))
        upperRibbonPath.close()
        
        UIColor.blue.setFill()
        upperRibbonPath.fill()
        
        //Number One
        
        //Must be NSString to be able to use drawInRect()
        let numberOne = "1"
        let numberOneRect = CGRectMake(47, 100, 50, 50)
        let font = UIFont(name: "Academy Engraved LET", size: 60)
        let textStyle = NSMutableParagraphStyle.default
        let numberOneAttributes = [
            NSFontAttributeName: font!,
            NSForegroundColorAttributeName: darkGoldColor]
        numberOne.draw(in: numberOneRect,
                       withAttributes:numberOneAttributes)
        
        context!.endTransparencyLayer()
        
        
        //This code must always be at the end of the playground
        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image!
    }

}
