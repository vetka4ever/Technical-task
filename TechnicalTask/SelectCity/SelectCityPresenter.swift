//
//  SelectCityPresenter.swift
//  TechnicalTask
//
//  Created by Daniil on 29.11.2022.
//

import Foundation
import SwiftyJSON
class SelectCityPresenter{
    private var listOfCity: [(String, String, Bool)] = []
    init(){
        getData()
    }
    
    var accessToListOfCity: [(String, String, Bool)]{
        get{
            return listOfCity
        }
    }
}

private extension SelectCityPresenter{
    func getData(){
        guard let path = Bundle.main.path(forResource: "cities", ofType: "json") else {return}
        let url = URL(fileURLWithPath: path)
        let data = try? Data(contentsOf: url)
        guard let corData = data else {return}
        let json = try? JSON(data: corData)
        guard let corJson = json else {return}
        for item in corJson["cities"].arrayValue{
            var city = ("\(item.arrayValue[1].stringValue)", "\(item.arrayValue[0].stringValue)", false)
            listOfCity.append(city)
        }
    }
}
