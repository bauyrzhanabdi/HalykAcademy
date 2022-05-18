//
//  ViewController.swift
//  homework-14
//
//  Created by Bauyrzhan Abdi on 17.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var stackViews : [(stack: UIStackView, tag : Int)] = []
    private var textFields : [(field : UITextField, tag : Int)] = []
    
    
    override func loadView() {
        super.loadView()
        setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc
    private func keyboardWillShow(notification : NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return}
        
        if view.frame.origin.y == 0 {view.frame.origin.y -= keyboardSize.height}
    }
    
    @objc
    private func keyboardWillHide(notification : NSNotification) {
        if view.frame.origin.y != 0 {view.frame.origin.y = 0}
    }
    

    private func setupView() {
        view.backgroundColor = bordeaux
        
        let topStackView = createStackView(axis: .horizontal)
        let bottomStackView = createStackView(axis: .vertical)
        let forgotStackView = createStackView(axis: .horizontal)
        let mediaStackView = createStackView(axis: .horizontal)
        
        ButtonType.allCases.forEach { type in
            let button = createButton(type: type)
            topStackView.addArrangedSubview(button)
        }
        
        
        TextFieldType.allCases.forEach { type in
            let textField = createTextField(type: type)
            bottomStackView.addArrangedSubview(textField)
        }
        
        let button = createButton(title: "Forgot password?", titleColor: .white, backgroundColor: bordeaux)
        button.tag = 0
        forgotStackView.addArrangedSubview(button)
        
        MediaType.allCases.forEach { type in
            let button = createButton(title: type.rawValue, titleColor: type.titleColor, backgroundColor: type.backgrounColor)
            mediaStackView.addArrangedSubview(button)
        }
        
        view.addSubview(topStackView)
        view.addSubview(bottomStackView)
        view.addSubview(forgotStackView)
        view.addSubview(mediaStackView)
        
        
        NSLayoutConstraint.activate([
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            topStackView.bottomAnchor.constraint(equalTo: bottomStackView.topAnchor, constant: -15),
            topStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            bottomStackView.bottomAnchor.constraint(equalTo: forgotStackView.topAnchor, constant: -15),
            bottomStackView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            forgotStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            forgotStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            forgotStackView.bottomAnchor.constraint(equalTo: mediaStackView.topAnchor, constant: -15),
            forgotStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            mediaStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            mediaStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            mediaStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150),
            mediaStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        stackViews.append((stack: topStackView, tag: 0))
        stackViews.append((stack: bottomStackView, tag: 1))
        stackViews.append((stack: forgotStackView, tag: 2))
        stackViews.append((stack: mediaStackView, tag: 3))
    }
    
    
    private func createStackView(axis : NSLayoutConstraint.Axis) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.borderWidth = 1.0
        stackView.layer.borderColor = UIColor.white.cgColor
        return stackView
    }
    
    private func createTextField(type : TextFieldType) -> UITextField {
        let textField = UITextField()
        textField.placeholder = type.placeholder
        textField.tag = type.rawValue
        textField.backgroundColor = .white
        textField.textColor = bordeaux
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.isHidden = textField.tag % 2 != 0 ? true : false
        textFields.append((field : textField, tag : textField.tag))
        return textField
    }
    
    private func createButton(type : ButtonType) -> UIButton {
        let button = UIButton()
        button.setTitle(type.title, for: .normal)
        button.setTitleColor(type.titleColor, for: .normal)
        
        button.backgroundColor = type.backgroundColor
        button.tag = type.rawValue
        
        button.addTarget(self, action: #selector(modeButtonPressed), for: .touchUpInside)
        return button
    }
    
    private func createButton(title : String, titleColor : UIColor, backgroundColor : UIColor) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        
        button.backgroundColor = backgroundColor
        //button.tag = type.rawValue
        
        button.addTarget(self, action: title == "Forgot password?" ? #selector(forgotButtonPressed) : #selector(mediaButtonPressed), for: .touchUpInside)
        return button
    }

    @objc
    private func modeButtonPressed(_ sender : UIButton) {
        guard let buttonType = ButtonType(rawValue: sender.tag) else {return}
        
        displayTextFields(tag: buttonType.rawValue)
        
        switch buttonType {
        case .authorize:
            displayStackViews(tag: 0, hide: false)
        case .register:
            displayStackViews(tag: 2, hide: true)
        }
    }
    
    @objc
    private func forgotButtonPressed(_ sender : UIButton) {
        displayTextFields(tag: sender.tag)
        displayStackViews(tag: 3, hide: true)
    }
    
    @objc
    private func mediaButtonPressed(_ sender : UIButton) {}
    
    private func displayTextFields(tag : Int) {
        textFields.forEach { type in
            type.field.isHidden = type.tag % 2 == tag ? false : true
        }
    }
    
    private func displayStackViews(tag : Int, hide : Bool) {
        stackViews.forEach { type in
            if type.tag >= tag {type.stack.isHidden = hide}
        }
    }
    
}



