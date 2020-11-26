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
    
    private let circleShape1 = CAShapeLayer()
    private let circleShape2 = CAShapeLayer()
    private let circleShape3 = CAShapeLayer()
    private let circleShape4 = CAShapeLayer()
    private let circleShape5 = CAShapeLayer()
    
    private let backFillCircle = CAShapeLayer()
    
    private let progressValueLabel1 = UILabel()
    private let progressValueLabel2 = UILabel()
    private let progressValueLabel3 = UILabel()
    private let progressValueLabel4 = UILabel()
    private let progressValueLabel5 = UILabel()
    
    var startAngle1_1 = CGFloat.pi*3/2
    var endAngle1_1 = CGFloat.pi*3/2
    var startAngle1_2 = CGFloat.pi*3/2
    var endAngle1_2 = CGFloat.pi*3/2
    var startAngle1_3 = CGFloat.pi*3/2
    var endAngle1_3 = CGFloat.pi*3/2
    var startAngle1_4 = CGFloat.pi*3/2
    var endAngle1_4 = CGFloat.pi*3/2
    
    var startAngle2_1 = CGFloat.pi*3/2
    var endAngle2_1 = CGFloat.pi*3/2
    var startAngle2_2 = CGFloat.pi*3/2
    var endAngle2_2 = CGFloat.pi*3/2
    var startAngle2_3 = CGFloat.pi*3/2
    var endAngle2_3 = CGFloat.pi*3/2
    var startAngle2_4 = CGFloat.pi*3/2
    var endAngle2_4 = CGFloat.pi*3/2
    
    var startAngle3_1 = CGFloat.pi*3/2
    var endAngle3_1 = CGFloat.pi*3/2
    var startAngle3_2 = CGFloat.pi*3/2
    var endAngle3_2 = CGFloat.pi*3/2
    var startAngle3_3 = CGFloat.pi*3/2
    var endAngle3_3 = CGFloat.pi*3/2
    var startAngle3_4 = CGFloat.pi*3/2
    var endAngle3_4 = CGFloat.pi*3/2
    
    var startAngle4_1 = CGFloat.pi*3/2
    var endAngle4_1 = CGFloat.pi*3/2
    var startAngle4_2 = CGFloat.pi*3/2
    var endAngle4_2 = CGFloat.pi*3/2
    var startAngle4_3 = CGFloat.pi*3/2
    var endAngle4_3 = CGFloat.pi*3/2
    var startAngle4_4 = CGFloat.pi*3/2
    var endAngle4_4 = CGFloat.pi*3/2
    
    var startAngle5_1 = CGFloat.pi*3/2
    var endAngle5_1 = CGFloat.pi*3/2
    var startAngle5_2 = CGFloat.pi*3/2
    var endAngle5_2 = CGFloat.pi*3/2
    var startAngle5_3 = CGFloat.pi*3/2
    var endAngle5_3 = CGFloat.pi*3/2
    var startAngle5_4 = CGFloat.pi*3/2
    var endAngle5_4 = CGFloat.pi*3/2
    
    var availableRadians: Double = Double.pi*2
    var spaceBetweenLine: Double = Double.pi*15/180
    var numberOfItems: Int = 0
    
    var animationDuration: CFTimeInterval = 1
    var progressArray: [Double] = [] {
        didSet {
            numberOfItems = progressArray.count
            
            if numberOfItems > 1 {
                availableRadians = availableRadians - spaceBetweenLine*Double(numberOfItems)
            }
            
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
    
    func initView() {
        addSubview(progressValueLabel1)
        addSubview(progressValueLabel2)
        addSubview(progressValueLabel3)
        addSubview(progressValueLabel4)
        addSubview(progressValueLabel5)
        
        addSublayer(caShapeLayer: backFillCircle, uiColor: UIColor.lightGray)
        addSublayer(caShapeLayer: circleShape1, uiColor: UIColor.red)
        addSublayer(caShapeLayer: circleShape2, uiColor: UIColor.green)
        addSublayer(caShapeLayer: circleShape3, uiColor: UIColor.blue)
        addSublayer(caShapeLayer: circleShape4, uiColor: UIColor.orange)
        addSublayer(caShapeLayer: circleShape5, uiColor: UIColor.yellow)
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
        
        addPath(to: backFillCircle, availableRadians: Double.pi*2, progress: 1)
    }
    
    func redraw1() {
        let rotateAngle = CGFloat(0)
        rotateAndDraw(caShapeLayer: circleShape1, rotateAngle: rotateAngle)
        
        addPath(to: circleShape1, availableRadians: availableRadians, progress: progress1)
        
        startAngle1_1 = CGFloat.pi*3/2
        endAngle1_1 = startAngle1_1 + CGFloat(availableRadians*progress1)
    }
    
    func redraw2() {
        let rotateAngle = CGFloat(availableRadians*progress1+spaceBetweenLine)
        rotateAndDraw(caShapeLayer: circleShape2, rotateAngle: rotateAngle)
        
        addPath(to: circleShape2, availableRadians: availableRadians, progress: progress2)
        
        startAngle2_1 = CGFloat.pi*3/2 + CGFloat(availableRadians*progress1+spaceBetweenLine)
        endAngle2_1 = startAngle2_1 + CGFloat(availableRadians*progress2)
    }
    
    func redraw3() {
        let rotateAngle = CGFloat((availableRadians*progress1+spaceBetweenLine) +
            (availableRadians*progress2+spaceBetweenLine)
        )
        rotateAndDraw(caShapeLayer: circleShape3, rotateAngle: rotateAngle)
        
        addPath(to: circleShape3, availableRadians: availableRadians, progress: progress3)
        
        startAngle3_1 = CGFloat.pi*3/2 + CGFloat(
            (availableRadians*progress1+spaceBetweenLine) +
                (availableRadians*progress2+spaceBetweenLine)
        )
        endAngle3_1 = startAngle3_1 + CGFloat(availableRadians*progress3)
    }
    
    func redraw4() {
        let rotateAngle = CGFloat((availableRadians*progress1+spaceBetweenLine) +
            (availableRadians*progress2+spaceBetweenLine) +
            (availableRadians*progress3+spaceBetweenLine)
        )
        rotateAndDraw(caShapeLayer: circleShape4, rotateAngle: rotateAngle)
        
        addPath(to: circleShape4, availableRadians: availableRadians, progress: progress4)
        
        startAngle4_1 = CGFloat.pi*3/2 + CGFloat(
            (availableRadians*progress1+spaceBetweenLine) +
                (availableRadians*progress2+spaceBetweenLine) +
                (availableRadians*progress3+spaceBetweenLine)
        )
        endAngle4_1 = startAngle4_1 + CGFloat(availableRadians*progress4)
    }
    
    func redraw5() {
        let rotateAngle = CGFloat((availableRadians*progress1+spaceBetweenLine) +
            (availableRadians*progress2+spaceBetweenLine) +
            (availableRadians*progress3+spaceBetweenLine) +
            (availableRadians*progress4+spaceBetweenLine)
        )
        rotateAndDraw(caShapeLayer: circleShape5, rotateAngle: rotateAngle)
        
        addPath(to: circleShape5, availableRadians: availableRadians, progress: progress5)
        
        startAngle5_1 = CGFloat.pi*3/2 + CGFloat(
            (availableRadians*progress1+spaceBetweenLine) +
                (availableRadians*progress2+spaceBetweenLine) +
                (availableRadians*progress3+spaceBetweenLine) +
                (availableRadians*progress4+spaceBetweenLine)
        )
        endAngle5_1 = startAngle5_1 + CGFloat(availableRadians*progress5)
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
            let pointAngle = getAngle(x: point.x, y: point.y, centerX: circleCenterX, centerY: circleCenterY)
            
            startAngle1_1 = startAngle1_1 > CGFloat.pi*2 ? startAngle1_1 - CGFloat.pi*2 : startAngle1_1
            endAngle1_1 = endAngle1_1 > CGFloat.pi*2 ? endAngle1_1 - CGFloat.pi*2 : endAngle1_1
            
            startAngle2_1 = startAngle2_1 > CGFloat.pi*2 ? startAngle2_1 - CGFloat.pi*2 : startAngle2_1
            endAngle2_1 = endAngle2_1 > CGFloat.pi*2 ? endAngle2_1 - CGFloat.pi*2 : endAngle2_1
            
            startAngle3_1 = startAngle3_1 > CGFloat.pi*2 ? startAngle3_1 - CGFloat.pi*2 : startAngle3_1
            endAngle3_1 = endAngle3_1 > CGFloat.pi*2 ? endAngle3_1 - CGFloat.pi*2 : endAngle3_1
            
            startAngle4_1 = startAngle4_1 > CGFloat.pi*2 ? startAngle4_1 - CGFloat.pi*2 : startAngle4_1
            endAngle4_1 = endAngle4_1 > CGFloat.pi*2 ? endAngle4_1 - CGFloat.pi*2 : endAngle4_1
            
            startAngle5_1 = startAngle5_1 > CGFloat.pi*2 ? startAngle5_1 - CGFloat.pi*2 : startAngle5_1
            endAngle5_1 = endAngle5_1 > CGFloat.pi*2 ? endAngle5_1 - CGFloat.pi*2 : endAngle5_1
            
            print("startAngle1: \(startAngle1_1)")
            print("endAngle1: \(endAngle1_1)")
            print("pointAngle: \(pointAngle)")
            
            if pointAngle >= startAngle1_1 && pointAngle <= endAngle1_1 {
                print("1")
            } else if pointAngle >= startAngle2_1 && pointAngle <= endAngle2_1 {
                print("2")
            } else if pointAngle >= startAngle3_1 && pointAngle <= endAngle3_1 {
                print("3")
            } else if pointAngle >= startAngle4_1 && pointAngle <= endAngle4_1 {
                print("4")
            } else if pointAngle >= startAngle5_1 && pointAngle <= endAngle5_1 {
                print("5")
            }
        }
    }
    
    private func addSublayer(caShapeLayer: CAShapeLayer, uiColor: UIColor, lineWidth: CGFloat = 10) {
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        let radius: CGFloat = min(bounds.width, bounds.height) * 0.45
        let path = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: CGFloat.pi*3/2,
            endAngle: CGFloat.pi*3/2 + CGFloat(Double.pi*2),
            clockwise: true)
        
        self.layer.addSublayer(caShapeLayer)
        caShapeLayer.strokeColor = uiColor.cgColor
        caShapeLayer.lineWidth = 10
        caShapeLayer.lineCap = CAShapeLayerLineCap.round
        caShapeLayer.fillColor = nil
        caShapeLayer.path = nil
        caShapeLayer.bounds = path.cgPath.boundingBox
        caShapeLayer.position = CGPoint(x: self.layer.bounds.midX, y: self.layer.bounds.midY)
    }
    
    private func addPath(to caShapeLayer: CAShapeLayer, availableRadians: Double, progress: Double ) {
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        let radius: CGFloat = min(bounds.width, bounds.height) * 0.45
        let path = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: CGFloat.pi*3/2,
            endAngle: CGFloat.pi*3/2 + CGFloat(availableRadians*progress),
            clockwise: true)
        caShapeLayer.path = path.cgPath
    }
    
    private func getRotateAnimation(from fromCaTransform3D: CATransform3D,to toCaTransform3D: CATransform3D, beginTime: CFTimeInterval = 0, duration: CFTimeInterval) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "transform")
        animation.fromValue = fromCaTransform3D
        animation.toValue = toCaTransform3D
        animation.beginTime = beginTime
        animation.duration = duration
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        
        return animation
    }
    
    private func getGroupAnimation(duration: CFTimeInterval, caBasicAnimationList: [CABasicAnimation]) -> CAAnimationGroup {
        let groupAnimation = CAAnimationGroup()
        groupAnimation.beginTime = 0
        groupAnimation.duration = duration
        groupAnimation.fillMode = CAMediaTimingFillMode.forwards
        groupAnimation.isRemovedOnCompletion = false
        groupAnimation.animations = caBasicAnimationList
        
        return groupAnimation
    }
    
    private func getDrawAnimation(duration: CFTimeInterval) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = duration
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        
        return animation
    }
    
    private func rotateAndDraw(caShapeLayer: CAShapeLayer, rotateAngle: CGFloat) {
        let drawAnimation = getDrawAnimation(duration: animationDuration)
        var startAngle = CATransform3DMakeRotation(0, 0, 0, 1)
        var endAngle = CATransform3DMakeRotation(rotateAngle, 0, 0, 1)
        var caBasicAnimationList: [CABasicAnimation] = []
        
        if rotateAngle > CGFloat.pi/2 {
            let rotateTimes = Int((rotateAngle/(CGFloat.pi/2)).rounded(.down))
            let duration = animationDuration/Double(rotateTimes+1)
            
            for time in 0..<rotateTimes+1 {
                let additionalAngle = (CGFloat.pi/2)*CGFloat(time)
                let beginTime = duration*Double(time)
                
                if time < rotateTimes {
                    endAngle = CATransform3DMakeRotation(CGFloat.pi/2 + additionalAngle, 0, 0, 1)
                } else {
                    endAngle = CATransform3DMakeRotation(rotateAngle, 0, 0, 1)
                }
                
                let rotateAnimation = getRotateAnimation(from: startAngle, to: endAngle, beginTime: beginTime, duration: duration)
                caBasicAnimationList.append(rotateAnimation)
                startAngle = endAngle
            }
            
            let groupAnimation = getGroupAnimation(duration: animationDuration, caBasicAnimationList: caBasicAnimationList)
            
            caShapeLayer.add(anim: groupAnimation, forKey: nil) {
                caShapeLayer.add(anim: drawAnimation, forKey: nil)
            }
        } else {
            let rotateAnimation = getRotateAnimation(from: startAngle, to: endAngle, duration: animationDuration)
            
            caShapeLayer.add(anim: rotateAnimation, forKey: nil) {
                caShapeLayer.add(anim: drawAnimation, forKey: nil)
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
    
    func add(anim: CAAnimation, forKey: String?, completion: @escaping () -> () = {}) {
        UIView.animate(withDuration: 0, animations: { self.add(anim, forKey: forKey) }) { _ in
            completion()
        }
    }
    
}
