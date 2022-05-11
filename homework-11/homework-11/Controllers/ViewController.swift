//
//  ViewController.swift
//  homework-11
//
//  Created by Bauyrzhan Abdi on 11.05.2022.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var viewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func changeView(_ sender: UIButton) {
        if let senderView = sender.currentTitle {
            viewLabel.text = senderView
        }
    }
    
}

