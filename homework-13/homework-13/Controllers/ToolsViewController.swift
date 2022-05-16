//
//  ToolsViewController.swift
//  homework-13
//
//  Created by Bauyrzhan Abdi on 16.05.2022.
//

import UIKit

class ToolsViewController: UIViewController {
    
    @IBOutlet weak var fillSwitch: UISwitch!
    public weak var delegate : PaintViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func shapePressed(_ sender: UIButton) {
        guard let tool = DrawingTools(rawValue: sender.tag) else {return}
        delegate?.set(tool: tool)
    }
    
    @IBAction func colorPressed(_ sender: UIButton) {
        guard let color = Colors(rawValue: sender.tag) else {return}
        delegate?.set(color: color)
    }
    
    @IBAction func undoPressed(_ sender: UIButton) {
        delegate?.undo()
    }
    
    @IBAction func switchTriggered(_ sender: UISwitch) {
        if fillSwitch.isOn {
            delegate?.set(mode: .on)
        } else {
            delegate?.set(mode: .off)
        }
    }
    
    
}
