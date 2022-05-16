//
//  MainViewController.swift
//  homework-13
//
//  Created by Bauyrzhan Abdi on 16.05.2022.
//

//// MARK: - Properties
//private let paintVC = PaintViewController()
//private let toolsVC = ToolsViewController()
//
//var penButton : UIButton?
//var rectangleButton : UIButton?
//var triangleButton : UIButton?
//var circleButton : UIButton?
//
//let redButton = UIButton()
//let blueButton = UIButton()
//let greenButton = UIButton()
//let undoButton = UIButton()
//let fillSwitch = UISwitch()
//
//// MARK: - Lifecycle
//override func viewDidLoad() {
//    super.viewDidLoad()
//    addPaintVC()
//    addToolsVC()
//    addToolsStackView(toolsVC)
//}
//
//private func addPaintVC() {
//    addChild(paintVC)
//    view.addSubview(paintVC.view)
//
//    paintVC.view.translatesAutoresizingMaskIntoConstraints = false
//
//    NSLayoutConstraint.activate([
//        paintVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//        paintVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//        paintVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
//    ])
//
//    paintVC.didMove(toParent: self)
//}
//
//private func addToolsVC() {
//    addChild(toolsVC)
//    view.addSubview(toolsVC.view)
//
//    toolsVC.view.translatesAutoresizingMaskIntoConstraints = false
//
//    NSLayoutConstraint.activate([
//        toolsVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//        toolsVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//        toolsVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//        toolsVC.view.topAnchor.constraint(equalTo: paintVC.view.bottomAnchor),
//        toolsVC.view.heightAnchor.constraint(equalToConstant: 100)
//    ])
//
//    toolsVC.didMove(toParent: self)
//}
//
//private func createToolButtons() {
//    penButton = UIButton()
//    penButton?.setTitle("Pen", for: .normal)
//    penButton?.addTarget(self, action: #selector(shapePressed), for: .touchUpInside)
//    penButton?.tag = 0
//    penButton?.translatesAutoresizingMaskIntoConstraints = false
//
//    rectangleButton = UIButton()
//    rectangleButton?.setTitle("Pen", for: .normal)
//    rectangleButton?.addTarget(self, action: #selector(shapePressed), for: .touchUpInside)
//    rectangleButton?.tag = 1
//    rectangleButton?.translatesAutoresizingMaskIntoConstraints = false
//
//    triangleButton = UIButton()
//    triangleButton?.setTitle("Pen", for: .normal)
//    triangleButton?.addTarget(self, action: #selector(shapePressed), for: .touchUpInside)
//    triangleButton?.tag = 2
//    triangleButton?.translatesAutoresizingMaskIntoConstraints = false
//
//    circleButton = UIButton()
//    circleButton?.setTitle("Pen", for: .normal)
//    circleButton?.addTarget(self, action: #selector(shapePressed), for: .touchUpInside)
//    circleButton?.tag = 3
//    circleButton?.translatesAutoresizingMaskIntoConstraints = false
//}
//
//@objc func shapePressed(_ sender : UIButton) {
//    guard let title = sender.currentTitle else {return}
//
//    print("\(title) pressed with tag = \(sender.tag).")
//}
//
//private func addToolsStackView(_ toolsVC : UIViewController) {
//    let toolsStackView = UIStackView()
//    toolsStackView.axis = .horizontal
//    toolsStackView.distribution = .fillEqually
//    toolsStackView.alignment = .fill
//
//    createToolButtons()
//    guard
//        let penButton = penButton,
//        let rectangleButton = rectangleButton,
//        let triangleButton = triangleButton,
//        let circleButton = circleButton
//    else {
//        return
//    }
//
//    toolsStackView.addSubview(penButton)
//    toolsStackView.addSubview(rectangleButton)
//    toolsStackView.addSubview(triangleButton)
//    toolsStackView.addSubview(circleButton)
//
//    toolsVC.view.addSubview(toolsStackView)
//    toolsStackView.translatesAutoresizingMaskIntoConstraints = false
//
//    NSLayoutConstraint.activate([
//        toolsStackView.leadingAnchor.constraint(equalTo: toolsVC.view.leadingAnchor),
//        toolsStackView.trailingAnchor.constraint(equalTo: toolsVC.view.trailingAnchor),
//        toolsStackView.bottomAnchor.constraint(equalTo: toolsVC.view.bottomAnchor)
//    ])
//}

import UIKit

enum SegueType: String {
    case paint = "toPaint"
    case tools = "toTools"
}

class MainViewController: UIViewController {
    
    private var paintVC : PaintViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueType = SegueType(rawValue: segue.identifier ?? "") else { return }
        
        switch segueType {
        case .paint:
            guard let controller = segue.destination as? PaintViewController else { return }
            paintVC = controller
        case .tools:
            guard let controller = segue.destination as? ToolsViewController else { return }
            controller.delegate = paintVC
        }
    }

}
