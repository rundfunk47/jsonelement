//
//  JSONElement.swift
//  JSONElement
//
//  Created by Narek Mailian on 2021-06-30.
//

import Foundation

@dynamicMemberLookup
public enum JSONElement {
    case string(String)
    case bool(Bool)
    case int(Int)
    case double(Double)
    case array(Array<JSONElement>)
    case dictionary(Dictionary<String, JSONElement>)
    case null
}
