//
//  Array+Safe.swift
//  JSONElement
//
//  Created by Narek Mailian on 2021-07-31.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }

        return self[index]
    }
}
