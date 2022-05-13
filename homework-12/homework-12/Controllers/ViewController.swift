//
//  ViewController.swift
//  homework-12
//
//  Created by Bauyrzhan Abdi on 12.05.2022.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var customView: CustomView!
    
    private let colors : [UIColor] = [.yellow, .green, .blue, .brown, .cyan, .magenta]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveNextController(_ sender: UIButton) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "StarViewController")
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func penPressed(_ sender: UIButton) {
        customView.option = .pen
    }
    
    @IBAction func rectanglePressed(_ sender: UIButton) {
        customView.option = .rectangle
    }
    
    @IBAction func trianglePressed(_ sender: UIButton) {
        customView.option = .triangle
    }
    
    @IBAction func circlePressed(_ sender: UIButton) {
        customView.option = .circle
    }
}


