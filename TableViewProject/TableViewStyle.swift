//
//  TableViewStyle.swift
//  TableViewProject
//
//  Created by Asset on 10/16/24.
//

import Foundation

enum TableViewStyle {
    case mentor
    case mentee
    
    func values() -> [String] {
        switch self {
        case .mentor:
            return ["Yedige", "Alisher", "Yersin", "Amirzhan"]
        case .mentee:
            return ["Asset", "Sanya", "Amankeldi", "Dias"]
        }
    }
}
