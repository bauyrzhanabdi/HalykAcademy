//
//  PaintViewController.swift
//  homework-13
//
//  Created by Bauyrzhan Abdi on 16.05.2022.
//

import UIKit

class PaintViewController: UIViewController, ToolsViewControllerDelegate {

    @IBOutlet var paintView: PaintView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func changeShape(_ tool: DrawingTools) {
        paintView.tool = tool
        print("shape changed")
    }
    
    func changeColor(_ color: Colors) {
        paintView.color = color
        print("color changed")
    }
    
    func changeMode(_ mode: SwitchModes) {
        paintView.mode = mode
        print("mode changed")
    }
    
    func performUndo() {
        paintView.undo()
        print("undo performed")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
