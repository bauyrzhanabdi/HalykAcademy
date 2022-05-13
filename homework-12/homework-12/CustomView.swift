//
//  CustomView.swift
//  homework-12
//
//  Created by Bauyrzhan Abdi on 12.05.2022.
//

import UIKit

enum DrawingOptions {
    case pen, rectangle, circle, triangle
}

class CustomView: UIView {

    var lineColor : UIColor! = .black
    var lineThickness : CGFloat! = 1
    var touchPoint: CGPoint!
    var startingPoint: CGPoint!
    var path: UIBezierPath!
    var option: DrawingOptions!
    
    @IBOutlet var contentView : UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        startingPoint = touch?.location(in: self)

    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        touchPoint = touch?.location(in: self)
        
        switch option {
        case .pen:
            drawWithPen()
        case .rectangle:
            drawWithRectangle()
        case .triangle:
            drawWithTriangle()
        case .circle:
            drawWithCircle()
        default:
            break
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        switch option {
        case .rectangle, .triangle, .circle:
            drawShapeLayer()
        default:
            break
        }
    }

    func drawWithPen() {
        path = UIBezierPath()
        path.move(to: startingPoint)
        
        path.addLine(to: touchPoint)
        startingPoint = touchPoint
        
        drawShapeLayer()
    }
    
    func drawWithRectangle() {
        path = UIBezierPath()
        path.move(to: startingPoint)

        path.addLine(to: CGPoint(
            x: touchPoint.x,
            y: startingPoint.y
        ))

        path.addLine(to: CGPoint(
            x: touchPoint.x,
            y: touchPoint.y
        ))

        path.addLine(to: CGPoint(
            x: startingPoint.x,
            y: touchPoint.y
        ))

        path.addLine(to: startingPoint)
    }
    
    func drawWithTriangle() {
        path = UIBezierPath()
        path.move(to: startingPoint)
        path.addLine(to: CGPoint(
            x: touchPoint.x,
            y: touchPoint.y
        ))

        path.addLine(to: CGPoint(
            x: startingPoint.x,
            y: touchPoint.y
        ))

        path.addLine(to: startingPoint)
    }
    
    func drawWithCircle() {
        path = UIBezierPath()
        path.addArc(
            withCenter: CGPoint(
                x: (touchPoint.x + startingPoint.x) / 2,
                y: (touchPoint.y + startingPoint.y) / 2
            ),
            radius: radius(startingPoint, touchPoint),
            startAngle: CGFloat(0),
            endAngle: CGFloat(Double.pi * 2),
            clockwise: true
        )
    }
    
    func radius(_ from: CGPoint, _ to: CGPoint) -> CGFloat {
        let diameter = sqrt((from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y))
        return diameter/2
    }
    
    func drawShapeLayer() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = lineThickness
        shapeLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(shapeLayer)
        self.setNeedsDisplay()
    }

}
