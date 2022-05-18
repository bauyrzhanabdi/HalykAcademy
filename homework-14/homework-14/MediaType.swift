//
//  MediaType.swift
//  homework-14
//
//  Created by Bauyrzhan Abdi on 18.05.2022.
//

import Foundation
import UIKit

enum MediaType : String, CaseIterable {
    case apple = "Apple",
         google = "Google",
         facebook = "Facebook"
    
    var titleColor : UIColor {
        switch self {
        case .apple, .facebook:
            return .white
        case .google:
            return bordeaux
        }
    }
    
    var backgrounColor : UIColor {
        switch self {
        case .apple, .facebook:
            return bordeaux
        case .google:
            return .white
        }
    }
}
