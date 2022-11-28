//
//  LocalMemoryHelper.swift
//  TechnicalTask
//
//  Created by Daniil on 28.11.2022.
//

import Foundation
class LocalMemoryHelper{
    private var keyOfOrderOfTitles = "order_key"
    var accessToOrderOfSection: [String]{
        get{
            guard let order = UserDefaults.standard.array(forKey: keyOfOrderOfTitles) as? [String] else {return ["Город", "Погода", "Курс криптовалют"]}
            return order
        }
        
        set{
            UserDefaults.standard.set(newValue, forKey: keyOfOrderOfTitles)
        }
    }
}
