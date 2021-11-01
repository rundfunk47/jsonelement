//
//  JSONElement+Value.swift
//  JSONElement
//
//  Created by Narek Mailian on 2021-06-30.
//

import Foundation

public enum JSONElementValueError: LocalizedError {
    case cannotBeRepresented(_ value: Any)

    public var errorDescription: String? {
        switch self {
        case .cannotBeRepresented(let value):
            return "Element \(value) cannot be represented as JSON"
        }
    }
}

public extension JSONElement {
    init(_ inputValue: Any) throws {
        if let inputValue = inputValue as? JSONElement {
            self = inputValue
        } else {
            if let string = inputValue as? String {
                self = .string(string)
            } else if let number = inputValue as? NSNumber , number.isBool, let bool = number as? Bool {
                self = .bool(bool)
            } else if let number = inputValue as? NSNumber , number.isInt, let int = number as? Int {
                self = .int(int)
            } else if let double = inputValue as? Double {
                self = .double(double)
            } else if let array = inputValue as? Array<Any> {
                self = .array(try array.map { try JSONElement($0) })
            } else if let dictionary = inputValue as? Dictionary<String, Any> {
                self = .dictionary(try dictionary.mapValues( { try JSONElement($0) } ))
            } else if inputValue is NSNull || inputValue is Void {
                self = .null
            } else {
                throw JSONElementValueError.cannotBeRepresented(inputValue)
            }
        }
    }

    var value: Any {
        switch self {
        case .string(let string):
            return string
        case .bool(let bool):
            return bool
        case .int(let int):
            return int
        case .double(let double):
            return double
        case .array(let array):
            return array.map { $0.value }
        case .dictionary(let dictionary):
            return dictionary.mapValues { $0.value }
        case .null:
            return ()
        }
    }
}
