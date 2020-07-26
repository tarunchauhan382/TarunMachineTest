//
//  CityInfoTableViewCell.swift
//  TarunMachineTest
//
//  Created by Tarun on 25/07/20.
//  Copyright © 2020 Tarun. All rights reserved.
//

import UIKit
import Foundation
import SDWebImage

class CityInfoTableViewCell: UITableViewCell {
    
    //MARK: Passive Control Image view Implementation
    
    let placeImage:UIImageView = {
        
        let imgPlace = UIImageView()
        imgPlace.translatesAutoresizingMaskIntoConstraints = false
        imgPlace.contentMode = .scaleAspectFill
        imgPlace.layer.cornerRadius = 26
        imgPlace.clipsToBounds = true
        return imgPlace
    }()
    
    //MARK: Passive Control Title Label Implementation
    
    let titleHeadlineLabel:UILabel = {
        
        let lblHeadlineTitle = UILabel()
        lblHeadlineTitle.font = UIFont.boldSystemFont(ofSize: 19)
        lblHeadlineTitle.textColor = .darkGray
        lblHeadlineTitle.translatesAutoresizingMaskIntoConstraints = false
        return lblHeadlineTitle
    }()
    
    //MARK: Passive Control Description Label Implementation
    
    let descriptionLabel:UILabel = {
        
        let lblDescription = UILabel()
        lblDescription.font = UIFont.systemFont(ofSize: 14.0)
        lblDescription.textColor =  .lightGray
        lblDescription.clipsToBounds = true
        lblDescription.translatesAutoresizingMaskIntoConstraints = false
        return lblDescription
    }()
    
    //MARK: Design Configuration Of Content TableViewCell
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(placeImage)
        contentView.addSubview(titleHeadlineLabel)
        contentView.addSubview(descriptionLabel)
        
        let layoutMarginGuide = contentView.layoutMarginsGuide
        
        //Layout Constraints for Place Image
        placeImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        placeImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        placeImage.widthAnchor.constraint(equalToConstant: 52).isActive = true
        placeImage.heightAnchor.constraint(equalToConstant:52).isActive = true
        
        //Layout Constraints for Title Label
        titleHeadlineLabel.leadingAnchor.constraint(equalTo: placeImage.leadingAnchor, constant: 80).isActive = true
        titleHeadlineLabel.topAnchor.constraint(equalTo: layoutMarginGuide.topAnchor).isActive = true
        titleHeadlineLabel.trailingAnchor.constraint(equalTo: layoutMarginGuide.trailingAnchor).isActive = true
        titleHeadlineLabel.numberOfLines = 0
        
        //Layout Constraints for Description Label
        descriptionLabel.leadingAnchor.constraint(equalTo: placeImage.leadingAnchor,constant: 80).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: layoutMarginGuide.bottomAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: layoutMarginGuide.trailingAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleHeadlineLabel.bottomAnchor).isActive = true
        descriptionLabel.numberOfLines = 0
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: Configure Cell
    
    public func configure(with info:DataViewModel){
        
        self.selectionStyle = .none
        self.titleHeadlineLabel.text =  info.title
        self.descriptionLabel.text = info.description
        self.placeImage.sd_setImage(with: URL(string: info.imageHref), placeholderImage: UIImage(named: "imgPlaceholder"))
        
    }
    
}
