//
//  CustomTableViewCell.swift
//  CompChat
//
//  Created by Zacc Konfor on 1/15/26.
//

import UIKit

let tableViewCellIdentifier = "cell"

class CustomTableViewCell: UITableViewCell {
    
    let theImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
     let theLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "TEXT Sample"
        label.numberOfLines = 0
        
        return label
    }()
    
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    let margins = contentView.layoutMarginsGuide
    
       backgroundColor = .darkGray
    
    addSubview(theImage)
    theImage.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        theImage.centerYAnchor.constraint(equalTo: margins.centerYAnchor),
        theImage.leftAnchor.constraint(equalTo: margins.leftAnchor),
        theImage.heightAnchor.constraint(equalToConstant: 24),
        theImage.widthAnchor.constraint(equalToConstant: 24)
    ])
    
    addSubview(theLabel)
    theLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        theLabel.centerYAnchor.constraint(equalTo: margins.centerYAnchor),
        theLabel.leftAnchor.constraint(equalTo: theImage.rightAnchor, constant: 10),
        theLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 300)
    ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
}


