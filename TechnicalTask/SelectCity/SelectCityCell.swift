//
//  SelectCityCell1.swift
//  TechnicalTask
//
//  Created by Daniil on 29.11.2022.
//

import UIKit
import TinyConstraints
class SelectCityCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        setAppearance()
    }

    var shortCounryName = UILabel()
    var cityName = UILabel()
    var viewImage = UIImageView()
    
    private var selectedCity = true{
        didSet{
            viewImage.image = (selectedCity ? UIImage(systemName: "checkmark") : UIImage(systemName: "plus"))
        }
    }
    
    func selectCity(){
        selectedCity.toggle()
    }
    
    func setAppearance(){
        [shortCounryName, cityName, viewImage].forEach { item in
            contentView.addSubview(item)
        }
        
        shortCounryName.height(to: contentView)
        shortCounryName.width(contentView.frame.width * 0.1)
        shortCounryName.left(to: contentView, offset: contentView.frame.width * 0.04)
        
        cityName.height(to: contentView)
        cityName.width(contentView.frame.width * 0.8)
        cityName.leftToRight(of: shortCounryName, offset: contentView.frame.width * 0.04)
        
        viewImage.height(to: contentView)
        viewImage.width(contentView.frame.width * 0.1)
        viewImage.right(to: contentView, offset: -contentView.frame.width * 0.04)
//        viewImage.fit
    }
}
