//
//  ViewController.swift
//  homework-13
//
//  Created by Bauyrzhan Abdi on 15.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var paintView: PaintView!
    @IBOutlet weak var fillSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func shapePressed(_ sender: UIButton) {
        guard let tool = DrawingTools(rawValue: sender.tag) else {return}
        paintView.tool = tool
    }
    
    
    @IBAction func colorPressed(_ sender: UIButton) {
        guard let color = Colors(rawValue: sender.tag) else {return}
        paintView.color = color
    }
    
    
    @IBAction func undoPressed(_ sender: UIButton) {
        paintView.undo()
    }
    
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        if fillSwitch.isOn {
            paintView.mode = .on
        } else {
            paintView.mode = .off
        }
    }
    
}

