//
//  SettingsView.swift
//  TechnicalTask
//
//  Created by Daniil on 28.11.2022.
//

import UIKit

class SettingsView: UIViewController {
    
    // MARK: - Properties
    private let tableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
    private let presenter = SettingsPresenter()
    
    
    // MARK: - UIViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setAppearance()
        
    }
}

extension SettingsView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.accessToTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .systemGray6
        cell.textLabel?.text = presenter.accessToTitles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.none
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        presenter.changeOrderOfSection(from: sourceIndexPath.row, to: destinationIndexPath.row)
        
    }
}



// MARK: - Funcs for setting UI
private extension SettingsView {
    func setAppearance(){
        setNavigationBar()
        setTableView()
    }
    
    func setNavigationBar(){
        navigationController?.navigationBar.tintColor = .black
        title = "Настройки"
        
        let leftButton = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(leftBarButtonAction(_:)))
        navigationItem.leftBarButtonItem = leftButton
    }
    
    func setTableView(){
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.setEditing(true, animated: false)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
        tableView.backgroundColor = .white
        tableView.layer.shadowRadius = 50
        view.addSubview(tableView)
    }
    
    @objc func leftBarButtonAction(_ sender: UIBarButtonItem){
        navigationController?.popViewController(animated: true)
    }
}


