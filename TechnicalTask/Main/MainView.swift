//
//  ViewController.swift
//  TechnicalTask
//
//  Created by Daniil on 28.11.2022.
//

import UIKit
import TinyConstraints


class MainView: UIViewController {
    // MARK: - Properties
    private var scrollView = UIScrollView()
    private let views = [UIView(), UIView(), UIView()]
    private var labels = [UILabel(), UILabel(), UILabel()]
    private let presenter = MainPresenter()
    
    // MARK: - UIViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppearance()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let titles = presenter.getTitles()
        for i in 0...labels.count - 1{
            labels[i].text = titles[i]
        }
        
    }
    
    
}

// MARK: - Funcs for setting UI
private extension MainView {
    func setAppearance(){
        setNavigationBar()
        setScrollView()
    }
    
    func setNavigationBar(){
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = false
        let leftButton = UIBarButtonItem(title: "Главный экран", image: nil, primaryAction: nil, menu: nil)
        leftButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        leftButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .disabled)
        leftButton.isEnabled = false
        navigationItem.leftBarButtonItem = leftButton
        
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "gearshape"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(rightBarButtonAction(_:)))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    func setScrollView(){
        view.addSubview(scrollView)
        scrollView.backgroundColor = .white
        scrollView.edgesToSuperview(usingSafeArea: true)
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 0.35 * 3.3)
        views.forEach { item in
            scrollView.addSubview(item)
        }
        
        
        for i in 0...views.count-1{
            
            views[i].backgroundColor = .blue
            if i > 0{
                views[i].topToBottom(of: views[i-1], offset: view.frame.height * 0.03)
                
            } else{
                views[i].top(to: scrollView)
            }
            
            views[i].addSubview(labels[i])
            
            
            
            views[i].height(view.frame.height * 0.35)
            views[i].width(view.frame.width * 0.9)
            labels[i].top(to: views[i], offset: view.frame.height * 0.03)
            labels[i].left(to: views[i], offset: view.frame.width * 0.06)
            views[i].centerX(to: scrollView)
            views[i].layer.cornerRadius = 10
        }
        
        
        
        
        
        
        
    }
    
    @objc func rightBarButtonAction(_ sender: UIBarButtonItem){
        navigationController?.pushViewController(SettingsView(), animated: true)
    }
}
