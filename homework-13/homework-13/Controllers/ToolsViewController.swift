//
//  ToolsViewController.swift
//  homework-13
//
//  Created by Bauyrzhan Abdi on 16.05.2022.
//

import UIKit

protocol ToolsViewControllerDelegate : AnyObject {
    func changeShape(_ tool : DrawingTools)
    func changeColor(_ color : Colors)
    func changeMode(_ mode : SwitchModes)
    func performUndo()
}

class ToolsViewController: UIViewController {
    
    @IBOutlet weak var fillSwitch: UISwitch!
    weak var delegate : ToolsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func shapePressed(_ sender: UIButton) {
        guard let tool = DrawingTools(rawValue: sender.tag) else {return}
        delegate?.changeShape(tool)
        print("shape pressed")
        
    }
    
    @IBAction func colorPressed(_ sender: UIButton) {
        guard let color = Colors(rawValue: sender.tag) else {return}
        delegate?.changeColor(color)
        print("color pressed")
    }
    
    @IBAction func undoPressed(_ sender: UIButton) {
        delegate?.performUndo()
        print("undo pressed")
    }
    
    @IBAction func switchTriggered(_ sender: UISwitch) {
        if fillSwitch.isOn {
            delegate?.changeMode(.on)
        } else {
            delegate?.changeMode(.off)
        }
        
        print("switch triggered")
    }
    
    
}
