//
//  JSONElement+Subscript.swift
//  JSONElement
//
//  Created by Narek Mailian on 2021-07-31.
//

import Foundation

public extension JSONElement {
    subscript(dynamicMember string: String) -> JSONElement? {
        switch self {
        case .dictionary(let dictionary):
            return dictionary[string]
        default:
            return nil
        }
    }

    subscript(_ index: Int) -> JSONElement? {
        switch self {
        case .array(let array):
            return array[safe: index]
        default:
            return nil
        }
    }
}
