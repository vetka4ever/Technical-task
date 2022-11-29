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
    private let viewsOfSections = [UIView(), UIView(), UIView()]
    private var viewsInSections: [UIView] = []
    private var labels = [UILabel(), UILabel(), UILabel()]
    private let presenter = MainPresenter()
    private let multipliersForViewsInSections: CGFloat = 0.9
    
    private enum MultipliersForSections: CGFloat{
        case heightOfSection = 0.35
        
    }
    
    
    
    // MARK: - UIViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppearance()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        removeSubviews()
        viewsInSections.removeAll()
        presenter.updateTypeOfCell()
        updateTextOfLabels()
        for i in 0...viewsOfSections.count - 1{
            setSubviewsOfSections(id: i)
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
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * MultipliersForSections.heightOfSection.rawValue * 3.3)
        setSectionsOfScrollView()
    }
    
    func setSectionsOfScrollView(){
        viewsOfSections.forEach { item in
            scrollView.addSubview(item)
        }
        
        for i in 0...viewsOfSections.count-1{
            // set constraints
            if i > 0{
                viewsOfSections[i].topToBottom(of: viewsOfSections[i-1])
                
            } else{
                viewsOfSections[i].top(to: scrollView)
            }
            viewsOfSections[i].height(view.frame.height * MultipliersForSections.heightOfSection.rawValue)
            viewsOfSections[i].width(view.frame.width)
            viewsOfSections[i].centerX(to: scrollView)
            // set appearance
            viewsOfSections[i].backgroundColor = .white
            
            viewsOfSections[i].addSubview(labels[i])
            setLabelsOfSections(id: i)
            
            
        }
    }
    
    func setLabelsOfSections(id: Int){
        labels[id].textColor = .black
        
        labels[id].top(to: viewsOfSections[id])
        labels[id].left(to: viewsOfSections[id], offset: view.frame.width * 0.03)
        
        
    }
    
    func setConstraintsSubViewsOfSections(id: Int){
        viewsInSections[id].bottom(to: viewsOfSections[id])
        viewsInSections[id].width(view.frame.width * multipliersForViewsInSections)
        viewsInSections[id].height(view.frame.height * MultipliersForSections.heightOfSection.rawValue * 0.85)
        viewsInSections[id].centerX(to: viewsOfSections[id])
        
        viewsInSections[id].layer.cornerRadius = 10
        
    }
    
    func setSubviewsOfSections(id: Int){
        switch presenter.getTypeOfCellById(id: id){
        case .emptyCity:
            
            let button = UIButton()
            button.addTarget(self, action: #selector(selectCity(_:)), for: .touchDown)
            button.setTitle("Выбрать", for: .normal)
            let view = UIView()
            view.addSubview(button)
            viewsInSections.append(view)
//            viewsInSections.append(button)
            viewsOfSections[id].addSubview(viewsInSections[id])
            setConstraintsSubViewsOfSections(id: id)
            viewsInSections[id].backgroundColor = UIColor(red: 227/256, green: 242/256, blue: 254/256, alpha: 1)
            
            button.height(self.view.frame.height * MultipliersForSections.heightOfSection.rawValue * 0.85 * 0.3)
            button.width(self.view.frame.width * multipliersForViewsInSections * 0.3)
            
            button.center(in: viewsInSections[id])
            button.backgroundColor = UIColor(red: 17/256, green: 148/256, blue: 246/256, alpha: 1)
            button.layer.cornerRadius = self.view.frame.height * MultipliersForSections.heightOfSection.rawValue * 0.85 * 0.3 * 0.3
            
        case .emptyCripto:
            let view = UIView()
            view.backgroundColor = .purple
            viewsInSections.append(view)
            viewsOfSections[id].addSubview(viewsInSections[id])
            setConstraintsSubViewsOfSections(id: id)
        case .city:
            print()
        case .weather:
            print()
        case .cripto:
            print()
        }
    }
    
    func removeSubviews(){
        viewsOfSections.forEach { view in
            view.subviews.forEach { subview in
                if subview is UILabel != true{
                    subview.removeFromSuperview()
                }
            }
        }
    }
    
    func updateTextOfLabels(){
        let titles = presenter.getTitles()
        for i in 0...labels.count - 1{
            labels[i].text = titles[i]
        }
    }
    
    // MARK: - Objc Funcs
    @objc func rightBarButtonAction(_ sender: UIBarButtonItem){
        navigationController?.pushViewController(SettingsView(), animated: true)
    }
    
    @objc func selectCity(_ sender: UIButton){
        navigationController?.pushViewController(SelectCityView(), animated: true)
    }
}
