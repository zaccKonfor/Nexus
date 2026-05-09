//
//  CustomButton.swift
//  CompChat
//
//  Created by Zacc Konfor on 1/13/26.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   private func setupButton() {
        setShadow()
        shake()
        setTitleColor(.white, for: .normal)
        setTitleColor(Components.standardGold, for: .highlighted)
        backgroundColor    = .darkGray
        titleLabel?.font   = UIFont(name: "AvenirNext-DemiBold", size: 25)
        layer.cornerRadius = 5
        layer.borderWidth  = 5
        layer.borderColor  = Components.standardGold.cgColor
        translatesAutoresizingMaskIntoConstraints = false
       
       titleLabel?.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
       titleLabel?.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    private func setShadow() {
        layer.shadowColor   = UIColor.green.cgColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius  = 8
        layer.shadowOpacity = 0.5
        clipsToBounds       = true
        layer.masksToBounds = false
    }
    
     func shake() {
        let shake          = CABasicAnimation(keyPath: "position")
        shake.duration     = 0.1
        shake.repeatCount  = 2
        shake.autoreverses = true
        
        let fromPoint      = CGPoint(x: center.x - 8, y: center.y)
        let fromValue      = NSValue(cgPoint: fromPoint)
        
        let toPoint        = CGPoint(x: center.x + 8, y: center.y)
        let toValue        = NSValue(cgPoint: toPoint)
        
        shake.fromValue    = fromValue
        shake.toValue      = toValue
        
        layer.add(shake, forKey: "position")
         
    }
}



