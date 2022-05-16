//
//  StarView.swift
//  homework-12
//
//  Created by Bauyrzhan Abdi on 13.05.2022.
//

import UIKit

class StarView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("StarView", owner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    override public func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(
            x: rect.minX,
            y: rect.midY
        ))
        
        path.addLine(to: CGPoint(
            x: rect.midX / 2,
            y: rect.midY
        ))
        
        path.addLine(to: CGPoint(
            x: rect.midX,
            y: rect.minY
        ))
        
        path.addLine(to: CGPoint(
            x: 3 * rect.midX / 2,
            y: rect.midY / 2
        ))
        
        path.addLine(to: CGPoint(
            x: rect.maxX,
            y: rect.midY / 2
        ))
        
        path.addLine(to: CGPoint(
            x: 3 * rect.midX / 2,
            y: 3 * rect.midY / 2
        ))
        
        path.addLine(to: CGPoint(
            x: rect.maxX,
            y: rect.maxY
        ))
        
        path.addLine(to: CGPoint(
            x: rect.midX,
            y: 3 * rect.midY / 2
        ))
        
        path.addLine(to: CGPoint(
            x: rect.minX,
            y: rect.maxY
        ))
        
        path.addLine(to: CGPoint(
            x: rect.midX / 2,
            y: 3 * rect.midY / 2
        ))
        
        path.addLine(to: CGPoint(
            x: rect.minX,
            y: rect.midY
        ))
        
        UIColor.blue.setFill()
        path.fill()

    }

}
