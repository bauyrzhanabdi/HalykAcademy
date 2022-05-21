//
//  LandingViewController.swift
//  homework-15
//
//  Created by Bauyrzhan Abdi on 20.05.2022.
//

import Foundation
import UIKit

protocol CustomViewCellDelegate {
    func add(cell : CustomViewCell)
    func delete(cell : CustomViewCell)
}

class MenuViewController : UIViewController, UITextFieldDelegate, CustomViewCellDelegate {
    // MARK: - Properties
    
    private var todos : [String] = []
    public weak var delegate : FavoritesViewController?
    
    private lazy var textVC: UIViewController = {
        let controller = TextViewController()
        controller.delegate = self
        return controller
    }()
    private lazy var favoritesVC: FavoritesViewController = {
        let controller = FavoritesViewController()
        return controller
    }()

    private lazy var insertBarButton : UIBarButtonItem = createBarButton(title: "plus")
    private lazy var favoritesBarButton : UIBarButtonItem = createBarButton(title: "suit.heart")
    
    private lazy var tableView : UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.dataSource = self
        view.delegate = self
        view.register(CustomViewCell.self, forCellReuseIdentifier: CustomViewCell.cellID)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "To Do List"
        self.delegate = favoritesVC

    }
    
    
    // MARK: - Methods
    private func setup() {
        navigationItem.rightBarButtonItem = insertBarButton
        navigationItem.leftBarButtonItem = favoritesBarButton
        
        [tableView].forEach {
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])

    }
    
    private func createBarButton(title : String) -> UIBarButtonItem {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: title)
        button.style = .plain
        button.tintColor = .blue
        button.target = self
        button.action = #selector(barButtonPressed)
        return button
    }
    
    
    @objc private func barButtonPressed(_ sender : UIBarButtonItem) {
        var nextPage : UIViewController = self
        
        switch sender {
        case insertBarButton:
            nextPage = textVC
        case favoritesBarButton:
            nextPage = favoritesVC
        default:
            break
        }
        
        self.navigationController?.pushViewController(nextPage, animated: true)
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {return}
        todos.append(text)
        tableView.reloadData()
        textField.text = ""
    }
    
    func add(cell: CustomViewCell) {
        guard let text = cell.textLabel?.text else {return}
        delegate?.addToFavorites(text: text)
    }
    
    func delete(cell: CustomViewCell) {
        delegate?.deleteFromFavorites(tag: cell.tag)
    }
    
}

// MARK: - Extensions

extension MenuViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomViewCell.cellID, for: indexPath)
        cell.textLabel?.text = todos[indexPath.row]
        guard let cell = cell as? CustomViewCell else {fatalError("Problem")}
        cell.delegate = self
        return cell
    }
    
}

extension MenuViewController : UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

}





