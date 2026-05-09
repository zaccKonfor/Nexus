//
//  MenuOptions.swift
//  Nexus
//
//  Created by Zacc Konfor on 5/4/26.
//

import UIKit

enum Menu: Int, CaseIterable, CustomStringConvertible {
    
    case Settings
    case LogOut
    
    var description: String {
        switch self {
        case .Settings: return "Settings"
        case .LogOut: return "Log Out"
        }
    }
    
    var image: UIImage {
        switch self {
        case .Settings: return UIImage(named: "settings") ?? UIImage()
        case .LogOut: return UIImage(named: "logout") ?? UIImage()
        }
    }
}
