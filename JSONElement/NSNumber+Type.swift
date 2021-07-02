//
//  NSNumber+Type.swift
//  JSONElement
//
//  Created by Narek Mailian on 2021-06-30.
//

import Foundation

extension NSNumber {
    var isBool: Bool {
        guard let encoding = String(validatingUTF8: self.objCType) else {return false}
        switch encoding {
        case "C", "c":
            return true
        default:
            return false
        }
    }

    var isInt: Bool {
        guard let encoding = String(validatingUTF8: self.objCType) else {return false}
        switch encoding {
        case "Q", "L", "I", "S", "q", "l", "i", "s":
            return true
        default:
            return false
        }
    }
}
