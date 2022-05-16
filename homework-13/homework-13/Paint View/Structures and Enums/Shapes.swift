//
//  Shapes.swift
//  homework-13
//
//  Created by Bauyrzhan Abdi on 15.05.2022.
//

import Foundation
import UIKit

struct Shapes {
    let path : UIBezierPath
    let strokeColor : UIColor
    let fillColor : UIColor
    
    init(_ path : UIBezierPath, _ strokeColor : UIColor, _ fillColor : UIColor ) {
        self.path = path
        self.strokeColor = strokeColor
        self.fillColor = fillColor
    }
}
