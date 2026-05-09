//
//  CustomTextField.swift
//  CompChat
//
//  Created by Zacc Konfor on 1/13/26.
//

import UIKit

class CustomTextField: UITextField {
    override init(frame: CGRect) {
    super.init(frame: frame)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTextField() {
        translatesAutoresizingMaskIntoConstraints = false
        placeholder = ""
        textColor = .black
        keyboardType = UIKeyboardType.default
        returnKeyType = UIReturnKeyType.done
        autocorrectionType = UITextAutocorrectionType.no
        font = UIFont.init(name: "Helvetica", size: 15)
        borderStyle = UITextField.BorderStyle.roundedRect
        clearButtonMode = UITextField.ViewMode.whileEditing
        contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
    }
    
    private func setShadow() {
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius  = 8
        layer.shadowOpacity = 0.5
        clipsToBounds       = true
        layer.masksToBounds = false
    }
}
