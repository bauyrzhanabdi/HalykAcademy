//
//  PaintView.swift
//  homework-13
//
//  Created by Bauyrzhan Abdi on 15.05.2022.
//

import UIKit

class PaintView: UIView {

    var tool : DrawingTools = .pen
    var color : Colors = .red
    var mode : SwitchModes = .on
    
    private var shapes : [Shapes] = []
    private var startingPoint: CGPoint?
    private var touchPoint: CGPoint?
    
    override func draw(_ rect: CGRect) {
        for shape in shapes {
            let path = shape.path
            shape.strokeColor.setStroke()
            shape.fillColor.setFill()
            path.lineWidth = 1.0
            path.fill()
            path.stroke()
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        startingPoint = touches.first?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: self),
              let startingPoint = startingPoint else {return}
        
        if tool == .pen {
            drawWithPen(startingPoint, touchPoint)
            self.startingPoint = touchPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: self),
              let startingPoint = startingPoint else {return}
        
        switch tool {
        case .pen:
            break
        case .rectangle:
            drawRectangle(startingPoint, touchPoint)
        case .triangle:
            drawTriangle(startingPoint, touchPoint)
        case .circle:
            drawCircle(startingPoint, touchPoint)
        }

    }
    
    func drawWithPen(_ startingPoint : CGPoint, _ touchPoint : CGPoint) {
        let line = UIBezierPath()
        line.move(to: startingPoint)
        line.addLine(to: touchPoint)
        
        let strokeColor = strokeColor()
        shapes.append(Shapes(line, strokeColor, fillColor(strokeColor)))
        
        setNeedsDisplay()
    }
    
    func drawRectangle(_ startingPoint : CGPoint, _ touchPoint : CGPoint) {
        let rectangle = UIBezierPath(rect: CGRect(
            origin: startingPoint,
            size: CGSize(
                width: touchPoint.x - startingPoint.x,
                height: touchPoint.y - startingPoint.y)
        ))
        
        let strokeColor = strokeColor()
        shapes.append(Shapes(rectangle, strokeColor, fillColor(strokeColor)))
        
        setNeedsDisplay()
    }
    
    func drawTriangle(_ startingPoint : CGPoint, _ touchPoint : CGPoint) {
        let triangle = UIBezierPath()
        triangle.move(to: startingPoint)
        triangle.addLine(to: touchPoint)
        triangle.addLine(to: CGPoint(
            x: startingPoint.x,
            y: touchPoint.y))
        triangle.addLine(to: startingPoint)
        
        let strokeColor = strokeColor()
        shapes.append(Shapes(triangle, strokeColor, fillColor(strokeColor)))
        
        setNeedsDisplay()
    }
    
    func drawCircle(_ startingPoint : CGPoint, _ touchPoint : CGPoint) {
        let circle = UIBezierPath(
            arcCenter: CGPoint(
                x: (startingPoint.x + touchPoint.x) / 2,
                y: (startingPoint.y + touchPoint.y) / 2
            ),
            radius: sqrt(
                (touchPoint.x - startingPoint.x) * (touchPoint.x - startingPoint.x) + (touchPoint.y - startingPoint.y) * (touchPoint.y - startingPoint.y)) / 2,
            startAngle: 0,
            endAngle: CGFloat(Double.pi * 2),
            clockwise: false
        )
        
        let strokeColor = strokeColor()
        shapes.append(Shapes(circle, strokeColor, fillColor(strokeColor)))
        
        setNeedsDisplay()
    }
    
    func undo() {
        if shapes.count > 0 {
            shapes.removeLast()
            setNeedsDisplay()
        }
    }
    
    func strokeColor() -> UIColor {
        switch color {
        case .red:
            return UIColor.red
        case .blue:
            return UIColor.blue
        case .green:
            return UIColor.green
        }
    }
    
    func fillColor(_ color : UIColor) -> UIColor {
        switch mode {
        case .on:
            return color
        case .off:
            return UIColor.clear
        }
    }
}
