//
//  PaintViewController.swift
//  homework-13
//
//  Created by Bauyrzhan Abdi on 16.05.2022.
//

import UIKit

protocol PaintViewControllerDelegate : AnyObject {
    func set(tool : DrawingTools)
    func set(color : Colors)
    func set(mode : SwitchModes)
    func undo()
}

class PaintViewController: UIViewController {

    @IBOutlet var paintView: PaintView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension PaintViewController : PaintViewControllerDelegate {
    func set(tool: DrawingTools) {
        paintView.tool = tool
    }
    
    func set(color: Colors) {
        paintView.color = color
    }
    
    func set(mode: SwitchModes) {
        paintView.mode = mode
    }
    
    func undo() {
        paintView.undo()
    }
}

