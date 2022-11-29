//
//  SelectCityView.swift
//  TechnicalTask
//
//  Created by Daniil on 29.11.2022.
//

import UIKit

class SelectCityView: UIViewController {
    private var presenter = SelectCityPresenter()
    private var tableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppearance()
    }
}

extension SelectCityView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.accessToListOfCity.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(SelectCityCell.self)", for: indexPath) as? SelectCityCell
        
        guard let corCell = cell else {return UITableViewCell()}
        corCell.setAppearance()
        corCell.shortCounryName.text = presenter.accessToListOfCity[indexPath.row].0
        corCell.cityName.text = presenter.accessToListOfCity[indexPath.row].1
        corCell.selectCity()
        return corCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height * 0.06
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? SelectCityCell else {return}
        cell.selectCity()
        print("cur City - \(presenter.accessToListOfCity[indexPath.row].1)")
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? SelectCityCell else {return}
        print("prev City - \(presenter.accessToListOfCity[indexPath.row].1)")
    }
}

private extension SelectCityView{
    func setAppearance(){
        setTableView()
    }
    
    func setTableView(){
        tableView.frame = view.frame
        tableView.backgroundColor = .systemPink
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SelectCityCell.self, forCellReuseIdentifier: "\(SelectCityCell.self)")
        view.addSubview(tableView)
    }
}
