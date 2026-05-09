//
//  CustomImageView.swift
//  CompChat
//
//  Created by Zacc Konfor on 1/13/26.
//

import UIKit

class CustomImageView: UIImageView {

    
    override init(frame: CGRect) {
    super.init(frame: frame)
        setImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  private func setImageView() {
    
    let width: CGFloat = 20
    let height: CGFloat = 20
    let radius : CGFloat = 10
    
    frame.size.width = width
    frame.size.height = height
    layer.cornerRadius = radius
    translatesAutoresizingMaskIntoConstraints = false
    clipsToBounds = true
    }

}
