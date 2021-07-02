//
//  JSONElement+Hashable.swift
//  JSONElement
//
//  Created by Narek Mailian on 2021-06-30.
//

import Foundation

extension JSONElement: Hashable {
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .string(let string):
            hasher.combine("string")
            hasher.combine(string)
        case .bool(let bool):
            hasher.combine("bool")
            hasher.combine(bool)
        case .int(let int):
            hasher.combine("int")
            hasher.combine(int)
        case .double(let double):
            hasher.combine("double")
            hasher.combine(double)
        case .array(let array):
            hasher.combine("array")
            hasher.combine(array)
        case .dictionary(let dictionary):
            hasher.combine("dictionary")
            hasher.combine(dictionary)
        case .null:
            hasher.combine("null")
        }
    }
}
