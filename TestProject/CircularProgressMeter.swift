//
//  CircularProgressMeter.swift
//  TestProject
//
//  Created by itribdev5 on 24/11/20.
//  Copyright © 2020 itribdev5. All rights reserved.
//

import Foundation
import UIKit

class CircularProgressMeter: UIView {
    
    private let circleShape1         = CAShapeLayer()
    private let circleShape2         = CAShapeLayer()
    private let circleShape3         = CAShapeLayer()
    private let circleShape4         = CAShapeLayer()
    private let circleShape5         = CAShapeLayer()
    
    private let progressValueLabel1  = UILabel()
    private let progressValueLabel2  = UILabel()
    private let progressValueLabel3  = UILabel()
    private let progressValueLabel4  = UILabel()
    private let progressValueLabel5  = UILabel()
    
    private let backFillCircle      = CAShapeLayer()
    
    var availableRadians: Double = Double.pi*2
    var spaceBetweenLine: Double = Double.pi*15/180
    var numberOfItems: Int = 0
    
    var startAngle1 = CGFloat.pi*3/2
    var endAngle1 = CGFloat.pi*3/2
    var startAngle2 = CGFloat.pi*3/2
    var endAngle2 = CGFloat.pi*3/2
    var startAngle3 = CGFloat.pi*3/2
    var endAngle3 = CGFloat.pi*3/2
    var startAngle4 = CGFloat.pi*3/2
    var endAngle4 = CGFloat.pi*3/2
    var startAngle5 = CGFloat.pi*3/2
    var endAngle5 = CGFloat.pi*3/2
    
    var progressArray: [Double] = [] {
        didSet {
            numberOfItems = progressArray.count
            availableRadians = availableRadians - spaceBetweenLine*Double(numberOfItems)
            
            progress1 = progressArray.count > 0 ? progressArray[0] : 0.0
            progress2 = progressArray.count > 1 ? progressArray[1] : 0.0
            progress3 = progressArray.count > 2 ? progressArray[2] : 0.0
            progress4 = progressArray.count > 3 ? progressArray[3] : 0.0
            progress5 = progressArray.count > 4 ? progressArray[4] : 0.0
        }
    }
    
    var progress1: Double = 0.0 {
        didSet{
            progressValueLabel1.text = "red: \(Int(progress1*100))%"
            self.redraw1()
        }
    }
    
    var progress2: Double = 0.0 {
        didSet{
            progressValueLabel2.text = "green: \(Int(progress2*100))%"
            self.redraw2()
        }
    }
    
    var progress3: Double = 0.0 {
        didSet{
            progressValueLabel3.text = "blue: \(Int(progress3*100))%"
            self.redraw3()
        }
    }
    
    var progress4: Double = 0.0 {
        didSet{
            progressValueLabel4.text = "orange: \(Int(progress4*100))%"
            self.redraw4()
        }
    }
    
    var progress5: Double = 0.0 {
        didSet{
            progressValueLabel5.text = "yellow: \(Int(progress5*100))%"
            self.redraw5()
        }
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
        self.initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }
    
    func initView(){
        addSubview(progressValueLabel1)
        addSubview(progressValueLabel2)
        addSubview(progressValueLabel3)
        addSubview(progressValueLabel4)
        addSubview(progressValueLabel5)
        
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        let radius: CGFloat = min(bounds.width, bounds.height) * 0.45
        let path = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: CGFloat.pi*3/2,
            endAngle: CGFloat.pi*3/2 + CGFloat(Double.pi*2),
            clockwise: true)
        
        self.layer.addSublayer(backFillCircle)
        backFillCircle.strokeColor     = UIColor.lightGray.cgColor
        backFillCircle.lineWidth       = 10
        backFillCircle.lineCap         = CAShapeLayerLineCap.round
        backFillCircle.fillColor       = nil
        backFillCircle.path            = nil
        backFillCircle.bounds = path.cgPath.boundingBox
        backFillCircle.position = CGPoint(x: self.layer.bounds.midX, y: self.layer.bounds.midY)
        
        self.layer.addSublayer(circleShape1)
        circleShape1.strokeColor     = UIColor.red.cgColor
        circleShape1.lineWidth       = 10
        circleShape1.lineCap         = CAShapeLayerLineCap.round
        circleShape1.fillColor       = nil
        circleShape1.path            = nil
        circleShape1.bounds = path.cgPath.boundingBox
        circleShape1.position = CGPoint(x: self.layer.bounds.midX, y: self.layer.bounds.midY)
        
        self.layer.addSublayer(circleShape2)
        circleShape2.strokeColor     = UIColor.green.cgColor
        circleShape2.lineWidth       = 10
        circleShape2.lineCap         = CAShapeLayerLineCap.round
        circleShape2.fillColor       = nil
        circleShape2.path            = nil
        circleShape2.bounds = path.cgPath.boundingBox
        circleShape2.position = CGPoint(x: self.layer.bounds.midX, y: self.layer.bounds.midY)
        
        self.layer.addSublayer(circleShape3)
        circleShape3.strokeColor     = UIColor.blue.cgColor
        circleShape3.lineWidth       = 10
        circleShape3.lineCap         = CAShapeLayerLineCap.round
        circleShape3.fillColor       = nil
        circleShape3.path            = nil
        circleShape3.bounds = path.cgPath.boundingBox
        circleShape3.position = CGPoint(x: self.layer.bounds.midX, y: self.layer.bounds.midY)
        
        self.layer.addSublayer(circleShape4)
        circleShape4.strokeColor     = UIColor.orange.cgColor
        circleShape4.lineWidth       = 10
        circleShape4.lineCap         = CAShapeLayerLineCap.round
        circleShape4.fillColor       = nil
        circleShape4.path            = nil
        circleShape4.bounds = path.cgPath.boundingBox
        circleShape4.position = CGPoint(x: self.layer.bounds.midX, y: self.layer.bounds.midY)
        
        self.layer.addSublayer(circleShape5)
        circleShape5.strokeColor     = UIColor.yellow.cgColor
        circleShape5.lineWidth       = 10
        circleShape5.lineCap         = CAShapeLayerLineCap.round
        circleShape5.fillColor       = nil
        circleShape5.path            = nil
        circleShape5.bounds = path.cgPath.boundingBox
        circleShape5.position = CGPoint(x: self.layer.bounds.midX, y: self.layer.bounds.midY)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let labelSize = CGSize(width: bounds.width, height: bounds.height*0.25)
        progressValueLabel1.textAlignment = .center
        progressValueLabel1.frame = CGRect(
            x: 0,
            y: bounds.midY + 75,
            width: labelSize.width,
            height: labelSize.height)
        
        progressValueLabel2.textAlignment = .center
        progressValueLabel2.frame = CGRect(
            x: 0,
            y: bounds.midY + 100,
            width: labelSize.width,
            height: labelSize.height)
        
        progressValueLabel3.textAlignment = .center
        progressValueLabel3.frame = CGRect(
            x: 0,
            y: bounds.midY + 125,
            width: labelSize.width,
            height: labelSize.height)
        
        progressValueLabel4.textAlignment = .center
        progressValueLabel4.frame = CGRect(
            x: 0,
            y: bounds.midY + 150,
            width: labelSize.width,
            height: labelSize.height)
        
        progressValueLabel5.textAlignment = .center
        progressValueLabel5.frame = CGRect(
            x: 0,
            y: bounds.midY + 175,
            width: labelSize.width,
            height: labelSize.height)
        
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        let radius: CGFloat = min(bounds.width, bounds.height) * 0.45
        let path = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: CGFloat.pi*3/2,
            endAngle: CGFloat.pi*3/2 + CGFloat(Double.pi*2),
            clockwise: true)
        backFillCircle.path = path.cgPath
    }
    
    func redraw1() {
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        let radius: CGFloat = min(bounds.width, bounds.height) * 0.45
        let path = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: CGFloat.pi*3/2,
            endAngle: CGFloat.pi*3/2 + CGFloat(availableRadians*progress1),
            clockwise: true)
        let caTransform3D = CATransform3DMakeRotation(0, 0, 0, 1)
        
        circleShape1.path = path.cgPath
        circleShape1.addRotateAnimation(caTransform3D: caTransform3D, duration: 1.5) {
            self.circleShape1.addDrawAnimation(duration: 3)
        }
        
        startAngle1 = CGFloat.pi*3/2
        endAngle1 = startAngle1 + CGFloat(availableRadians*progress1)
    }
    
    func redraw2() {
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        let radius: CGFloat = min(bounds.width, bounds.height) * 0.45
        let path = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: CGFloat.pi*3/2,
            endAngle: CGFloat.pi*3/2 + CGFloat(availableRadians*progress2),
            clockwise: true)
        let caTransform3D = CATransform3DMakeRotation(CGFloat(self.availableRadians*self.progress1+self.spaceBetweenLine), 0, 0, 1)
        
        circleShape2.path = path.cgPath
        circleShape2.addRotateAnimation(caTransform3D: caTransform3D, duration: 1.5) {
            self.circleShape2.addDrawAnimation(duration: 3)
        }
        
        startAngle2 = CGFloat.pi*3/2 + CGFloat(availableRadians*progress1+spaceBetweenLine)
        endAngle2 = startAngle2 + CGFloat(availableRadians*progress2)
    }
    
    func redraw3() {
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        let radius: CGFloat = min(bounds.width, bounds.height) * 0.45
        let path = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: CGFloat.pi*3/2,
            endAngle: CGFloat.pi*3/2 + CGFloat(availableRadians*progress3),
            clockwise: true)
        let caTransform3D = CATransform3DMakeRotation(CGFloat(
            (availableRadians*progress1+spaceBetweenLine) +
                (availableRadians*progress2+spaceBetweenLine)
        ), 0, 0, 1)
        
        circleShape3.path = path.cgPath
        circleShape3.addRotateAnimation(caTransform3D: caTransform3D, duration: 1.5) {
            self.circleShape3.addDrawAnimation(duration: 3)
        }
        
        startAngle3 = CGFloat.pi*3/2 + CGFloat(
            (availableRadians*progress1+spaceBetweenLine) +
                (availableRadians*progress2+spaceBetweenLine)
        )
        endAngle3 = startAngle3 + CGFloat(availableRadians*progress3)
    }
    
    func redraw4() {
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        let radius: CGFloat = min(bounds.width, bounds.height) * 0.45
        let path = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: CGFloat.pi*3/2,
            endAngle: CGFloat.pi*3/2 + CGFloat(availableRadians*progress4),
            clockwise: true)
        let caTransform3D = CATransform3DMakeRotation(CGFloat(
            (availableRadians*progress1+spaceBetweenLine) +
                (availableRadians*progress2+spaceBetweenLine) +
                (availableRadians*progress3+spaceBetweenLine)
        ), 0, 0, 1)
        
        circleShape4.path = path.cgPath
        circleShape4.addRotateAnimation(caTransform3D: caTransform3D, duration: 1.5) {
            self.circleShape4.addDrawAnimation(duration: 3)
        }
        
        startAngle4 = CGFloat.pi*3/2 + CGFloat(
            (availableRadians*progress1+spaceBetweenLine) +
                (availableRadians*progress2+spaceBetweenLine) +
                (availableRadians*progress3+spaceBetweenLine)
        )
        endAngle4 = startAngle4 + CGFloat(availableRadians*progress4)
    }
    
    func redraw5() {
        circleShape5.isHidden = true
        
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        let radius: CGFloat = min(bounds.width, bounds.height) * 0.45
        let path = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: CGFloat.pi*3/2,
            endAngle: CGFloat.pi*3/2 + CGFloat(availableRadians*progress5),
            clockwise: true)
        let rotateAngle = CGFloat((availableRadians*progress1+spaceBetweenLine) +
            (availableRadians*progress2+spaceBetweenLine) +
            (availableRadians*progress3+spaceBetweenLine) +
            (availableRadians*progress4+spaceBetweenLine)
        )
        let caTransform3D = CATransform3DMakeRotation(rotateAngle, 0, 0, 1)
        
        if rotateAngle > CGFloat.pi {
            let caTransform3DPi_2 = CATransform3DMakeRotation(CGFloat.pi/2, 0, 0, 1)
            circleShape5.addRotateAnimation(caTransform3D: caTransform3DPi_2, duration: 0.75) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.75*3.5/4) {
                    self.circleShape5.addRotateAnimation2(from: caTransform3DPi_2, to: caTransform3D, duration: 0.75) {
                        self.circleShape5.isHidden = false
                        self.circleShape5.addDrawAnimation(duration: 3)
                    }
                }
            }
        }
        
        circleShape5.path = path.cgPath
        
        startAngle5 = CGFloat.pi*3/2 + CGFloat(
            (availableRadians*progress1+spaceBetweenLine) +
                (availableRadians*progress2+spaceBetweenLine) +
                (availableRadians*progress3+spaceBetweenLine) +
                (availableRadians*progress4+spaceBetweenLine)
        )
        endAngle5 = startAngle5 + CGFloat(availableRadians*progress5)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let point = touch!.location(in: self)
        let circleCenterX = self.layer.bounds.midX
        let circleCenterY = self.layer.bounds.midY
        let circleRadius = self.layer.bounds.midY - (self.layer.bounds.midY-115/2)
        
        //how far from the arc should a touch point treated as it's on the arc
        let maxDiff = CGFloat(10)
        //calculate the distance of the touch point from the center of your circle
        var dist = pow((point.x - circleCenterX), 2) +
            pow((point.y - circleCenterY), 2)
        dist = sqrt(dist)
        
        //We also need the bounding rect of the top half of the circle (the visible arc)
        let topBoundingRect = CGRect(x: 0, y: 0, width: circleRadius*2, height: circleRadius*2)
        
        if abs(dist - circleRadius) <= maxDiff && topBoundingRect.contains(CGPoint(x: point.x, y: point.y)) {
            print("it finally works")
            
            let pointAngle = getAngle(x: point.x, y: point.y, centerX: circleCenterX, centerY: circleCenterY)
            
            startAngle1 = startAngle1 > CGFloat.pi*2 ? startAngle1 - CGFloat.pi*2 : startAngle1
            endAngle1 = endAngle1 > CGFloat.pi*2 ? endAngle1 - CGFloat.pi*2 : endAngle1
            
            startAngle2 = startAngle2 > CGFloat.pi*2 ? startAngle2 - CGFloat.pi*2 : startAngle2
            endAngle2 = endAngle2 > CGFloat.pi*2 ? endAngle2 - CGFloat.pi*2 : endAngle2
            
            startAngle3 = startAngle3 > CGFloat.pi*2 ? startAngle3 - CGFloat.pi*2 : startAngle3
            endAngle3 = endAngle3 > CGFloat.pi*2 ? endAngle3 - CGFloat.pi*2 : endAngle3
            
            startAngle4 = startAngle4 > CGFloat.pi*2 ? startAngle4 - CGFloat.pi*2 : startAngle4
            endAngle4 = endAngle4 > CGFloat.pi*2 ? endAngle4 - CGFloat.pi*2 : endAngle4
            
            startAngle5 = startAngle5 > CGFloat.pi*2 ? startAngle5 - CGFloat.pi*2 : startAngle5
            endAngle5 = endAngle5 > CGFloat.pi*2 ? endAngle5 - CGFloat.pi*2 : endAngle5
            
            if pointAngle >= startAngle1 && pointAngle <= endAngle1 {
                print("1")
            } else if pointAngle >= startAngle2 && pointAngle <= endAngle2 {
                print("2")
            } else if pointAngle >= startAngle3 && pointAngle <= endAngle3 {
                print("3")
            } else if pointAngle >= startAngle4 && pointAngle <= endAngle4 {
                print("4")
            } else if pointAngle >= startAngle5 && pointAngle <= endAngle5 {
                print("5")
            }
            
        }
    }
    
    private func getAngle(x: CGFloat, y: CGFloat, centerX: CGFloat, centerY: CGFloat) -> CGFloat {
        let dx = x - centerX
        // Minus to correct for coord re-mapping
        let dy = -(y - centerY)
        var inRads = Double(atan2(dy, dx))
        
        // We need to map to coord system when 0 degree is at 3 O'clock, 270 at 12 O'clock
        inRads = inRads < 0 ? abs(inRads) : 2 * Double.pi - inRads
        return CGFloat(inRads)
    }
    
}

extension CAShapeLayer {
    
    func add(anim: CAAnimation, forKey: String?, completion: @escaping () -> ()) {
        UIView.animate(withDuration: 0, animations: { self.add(anim, forKey: forKey) }) { _ in
            completion()
        }
    }
    
    func addRotateAnimation(caTransform3D: CATransform3D, duration: CFTimeInterval, completion: @escaping () -> () = {}) {
        let animation = CABasicAnimation(keyPath: "transform")
        animation.toValue = caTransform3D
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        animation.duration = duration
        self.add(anim: animation, forKey: "transform") {
            completion()
        }
    }
    
    func addRotateAnimation2(from fromCaTransform3D: CATransform3D,to toCaTransform3D: CATransform3D, duration: CFTimeInterval, completion: @escaping () -> () = {}) {
        let animation = CABasicAnimation(keyPath: "transform")
        animation.fromValue = fromCaTransform3D
        animation.toValue = toCaTransform3D
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        animation.duration = duration
        self.add(anim: animation, forKey: "transform") {
            completion()
        }
    }
    
    func addDrawAnimation(duration: CFTimeInterval) {
        self.strokeEnd = 1
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = duration
        self.add(animation, forKey: "strokeEnd")
    }
    
}
