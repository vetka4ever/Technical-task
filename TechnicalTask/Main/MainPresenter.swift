//
//  MainPresenter.swift
//  TechnicalTask
//
//  Created by Daniil on 28.11.2022.
//

import Foundation
class MainPresenter{
    private let localMemory = LocalMemoryHelper()
    private var currentTypeOfCells: [TypeOfCells] = []
    enum TypeOfCells{
        case emptyCity
        case emptyCripto
        case city
        case weather
        case cripto
    }
    
    init(){
        updateTypeOfCell()
        
    }
    
    func getTypeOfCellById(id: Int) -> TypeOfCells{
        return currentTypeOfCells[id]
    }
    
    func updateTypeOfCell(){
        currentTypeOfCells = setCurrentTypeOfCells()
        print(currentTypeOfCells)
    }
    
    func getTitles() -> [String]{
        localMemory.accessToOrderOfSection
    }
    
}

private extension MainPresenter{
    func setCurrentTypeOfCells() -> [TypeOfCells]{
        var types = getTitles()
        var newTypeOfCells: [TypeOfCells] = []
        types.forEach { item in
            if item == "Город" || item == "Погода"{
                newTypeOfCells.append(.emptyCity)
            } else{
                newTypeOfCells.append(.emptyCripto)
            }
        }
        return newTypeOfCells
    }
}
