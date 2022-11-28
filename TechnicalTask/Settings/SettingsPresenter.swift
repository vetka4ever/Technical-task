//
//  SettingsPresenter.swift
//  TechnicalTask
//
//  Created by Daniil on 28.11.2022.
//

import Foundation
class SettingsPresenter{
    // MARK: - Properties
    private var localMemory = LocalMemoryHelper()
    private var titles: [String]
    
    var accessToTitles: [String]{
        get{
            return titles
        }
    }
    // MARK: - Life Cycle
    init(){
        titles = localMemory.accessToOrderOfSection
    }
    
    // MARK: - View's method
    func changeOrderOfSection(from: Int, to: Int){
        
        let title = titles[from]
        titles.remove(at: from)
        titles.insert(title, at: to)
        localMemory.accessToOrderOfSection = titles
        
    }
}
