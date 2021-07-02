//
//  JSONElementTests.swift
//  JSONElementTests
//
//  Created by Narek Mailian on 2021-06-30.
//

import XCTest
@testable import JSONElement

class JSONElementStringTests: XCTestCase {
    func testJSONElementStringInit() throws {
        let stringElement = try JSONElement(stringRepresentation: "\"hel\\\"lo\"")
        let intElement = try JSONElement(stringRepresentation: "2")
        let boolElement = try JSONElement(stringRepresentation: "true")
        let doubleElement = try JSONElement(stringRepresentation: "2.75")
        let arrayElement = try JSONElement(stringRepresentation: "[\"one\",2]")
        let nullElement = try JSONElement(stringRepresentation: "null")
        let dictElement = try JSONElement(stringRepresentation: "{\"bools\": [true,false]}")
        
        XCTAssertEqual(stringElement, JSONElement.string("hel\"lo"))
        XCTAssertEqual(intElement, JSONElement.int(2))
        XCTAssertEqual(boolElement, JSONElement.bool(true))
        XCTAssertEqual(doubleElement, JSONElement.double(2.75))
        XCTAssertEqual(arrayElement, JSONElement.array([.string("one"), .int(2)]))
        XCTAssertEqual(nullElement, JSONElement.null)
        XCTAssertEqual(dictElement, JSONElement.dictionary(["bools": JSONElement.array([.bool(true), .bool(false)])]))
    }
    
    func testJSONElementStringRepresentation() throws {
        let stringElement = JSONElement.string("hel\"lo")
        let intElement = JSONElement.int(2)
        let boolElement = JSONElement.bool(true)
        let doubleElement = JSONElement.double(2.75)
        let arrayElement = JSONElement.array([.string("one"), .int(2)])
        let nullElement = JSONElement.null
        let dictElement = JSONElement.dictionary(["bools": JSONElement.array([.bool(true), .bool(false)])])

        XCTAssertEqual(stringElement.stringRepresentation, "\"hel\\\"lo\"")
        XCTAssertEqual(intElement.stringRepresentation, "2")
        XCTAssertEqual(boolElement.stringRepresentation, "true")
        XCTAssertEqual(doubleElement.stringRepresentation, "2.75")
        XCTAssertEqual(arrayElement.stringRepresentation, "[\"one\",2]")
        XCTAssertEqual(nullElement.stringRepresentation, "null")
        XCTAssertEqual(dictElement.stringRepresentation, "{\"bools\": [true,false]}")
    }
}
