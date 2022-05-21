//
//  ViewController.swift
//  homework-15
//
//  Created by Bauyrzhan Abdi on 19.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var scrollView : UIScrollView = {
        let view = UIScrollView()
        view.delegate = self
        view.minimumZoomScale = 0.5
        view.maximumZoomScale = 1.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageView : UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleToFill
        view.image = UIImage(named: "mac")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageViewSecond : UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleToFill
        view.image = UIImage(named: "mas")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var button : UIButton = {
        let button = UIButton()
        button.setTitle("Scroll", for: .normal)
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        button.backgroundColor = .blue
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
    @objc private func buttonDidTap() {
        scrollView.scrollRectToVisible(.init(x: 100, y: 100, width: 500, height: 500), animated: true)
        scrollView.setContentOffset(.init(x: 100, y: 100), animated: true)
    }
    
    private func setup() {
        view.addSubview(scrollView)
        view.addSubview(button)
        
        scrollView.addSubview(imageView)
        scrollView.addSubview(imageViewSecond)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50),
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),

            imageViewSecond.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            imageViewSecond.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 100),
            imageViewSecond.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            imageViewSecond.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            
            imageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            imageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            imageViewSecond.heightAnchor.constraint(equalTo: imageView.heightAnchor),
            imageViewSecond.widthAnchor.constraint(equalTo: imageView.widthAnchor),
        ])
    }
    
}

extension ViewController : UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("X: \(scrollView.contentOffset.x) Y: \(scrollView.contentOffset.y)")
    }
}

