//
//  ButtonType.swift
//  homework-14
//
//  Created by Bauyrzhan Abdi on 17.05.2022.
//

import Foundation
import UIKit

public let bordeaux = UIColor(red: 167/255, green: 40/255, blue: 51/255, alpha: 1)

enum ButtonType : Int, CaseIterable {
    case authorize = 0,
         register = 1
    
    var backgroundColor : UIColor {
        switch self {
        case .authorize:
            return bordeaux
        case .register:
            return .white
        }
    }
    
    var titleColor : UIColor {
        switch self {
        case .authorize:
            return .white
        case .register:
            return bordeaux
        }
    }
    
    var title : String {
        switch self {
        case .authorize:
            return "Login"
        case .register:
            return "Register"
        }
    }
}
