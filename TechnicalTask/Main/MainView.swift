//
//  ViewController.swift
//  TechnicalTask
//
//  Created by Daniil on 28.11.2022.
//

import UIKit

class MainView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setAppearance()
        view.backgroundColor = .white
        
    }
}

// MARK: - Funcs for setting UI
private extension MainView {
    func setAppearance(){
        setNavigationBar()
        
    }
    
    func setNavigationBar(){
        navigationController?.navigationBar.tintColor = .black
        
        let leftButton = UIBarButtonItem(title: "Главный экран", image: nil, primaryAction: nil, menu: nil)
        leftButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        leftButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .disabled)
        leftButton.isEnabled = false
        navigationItem.leftBarButtonItem = leftButton
        
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "gearshape"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(rightBarButtonAction(_:)))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func rightBarButtonAction(_ sender: UIBarButtonItem){
        navigationController?.pushViewController(SettingsView(), animated: true)
    }
}
