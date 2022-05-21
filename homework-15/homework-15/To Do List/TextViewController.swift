//
//  TextViewController.swift
//  homework-15
//
//  Created by Bauyrzhan Abdi on 20.05.2022.
//
import UIKit

class TextViewController : UIViewController {
    // MARK: - Properties
    public weak var delegate : MenuViewController?
    
    private lazy var textField : UITextField = {
        let field = UITextField()
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.cornerRadius = 10.0
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var button : UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(insertButtonPressed), for: .touchUpInside)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    
    
    // MARK: - Methods
    private func setup() {
        view.addSubview(textField)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            textField.heightAnchor.constraint(equalToConstant: 300),
            
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            button.leadingAnchor.constraint(equalTo: textField.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: -10),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    @objc private func insertButtonPressed(_ sender : UIButton) {
        delegate?.textFieldDidEndEditing(textField)
        navigationController?.popViewController(animated: true)
    }
}
