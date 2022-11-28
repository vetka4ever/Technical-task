//
//  MainPresenter.swift
//  TechnicalTask
//
//  Created by Daniil on 28.11.2022.
//

import Foundation
class MainPresenter{
    private let localMemory = LocalMemoryHelper()
    enum TypeOfCells{
        case empty
        case city
        case weather
        case cripto
    }
    
    func getTitles() -> [String]{
        localMemory.accessToOrderOfSection
    }
    
}
