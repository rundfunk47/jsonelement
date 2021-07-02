//
//  JSONElementHashableTests.swift
//  JSONElementTests
//
//  Created by Narek Mailian on 2021-06-30.
//

import XCTest
@testable import JSONElement

class JSONElementEquatableTests: XCTestCase {
    func testJSONEquatableTests() throws {
        let stringElement1 = JSONElement.string("hel\"lo")
        let intElement1 = JSONElement.int(1)
        let boolElement1 = JSONElement.bool(true)
        let doubleElement1 = JSONElement.double(1.0)
        let arrayElement1 = JSONElement.array([.string("one"), .int(2)])
        let nullElement1 = JSONElement.null
        let dictElement1 = JSONElement.dictionary(["bools": JSONElement.array([.bool(true), .bool(false)])])

        let stringElement2 = JSONElement.string("hel\"lo")
        let intElement2 = JSONElement.int(1)
        let boolElement2 = JSONElement.bool(true)
        let doubleElement2 = JSONElement.double(1.0)
        let arrayElement2 = JSONElement.array([.string("one"), .int(2)])
        let nullElement2 = JSONElement.null
        let dictElement2 = JSONElement.dictionary(["bools": JSONElement.array([.bool(true), .bool(false)])])

        XCTAssertEqual(stringElement1, stringElement2)
        XCTAssertEqual(intElement1, intElement2)
        XCTAssertEqual(boolElement1, boolElement2)
        XCTAssertEqual(doubleElement1, doubleElement2)
        XCTAssertEqual(arrayElement1, arrayElement2)
        XCTAssertEqual(nullElement1, nullElement2)
        XCTAssertEqual(dictElement1, dictElement2)

        XCTAssertNotEqual(boolElement1, intElement1)
        XCTAssertNotEqual(intElement1, doubleElement1)
    }
}
