//
//  TextFieldType.swift
//  homework-14
//
//  Created by Bauyrzhan Abdi on 17.05.2022.
//

import Foundation

enum TextFieldType : Int, CaseIterable {
    case login = 0, name, password, surname
    
    var placeholder : String {
        switch self {
        case .login:
            return "\tEnter username"
        case .password:
            return "\tEnter password"
        case .name:
            return "\tEnter firstname"
        case .surname:
            return "\tEnter lastname"
        }
    }
}
