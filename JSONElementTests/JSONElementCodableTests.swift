//
//  JSONElementCodableTests.swift
//  JSONElementTests
//
//  Created by Narek Mailian on 2021-06-30.
//

import XCTest
@testable import JSONElement

class JSONElementCodableTests: XCTestCase {
    func testJSONElementCodableDecoder() throws {
        let jsonDecoder = JSONDecoder()

        let decodedString = try jsonDecoder.decode(JSONElement.self, from: "\"hel\\\"lo\"".data(using: .utf8)!)
        XCTAssertEqual(decodedString.stringRepresentation, "\"hel\\\"lo\"")

        let decodedInt = try jsonDecoder.decode(JSONElement.self, from: "2".data(using: .utf8)!)
        XCTAssertEqual(decodedInt.stringRepresentation, "2.0")

        let decodedBool = try jsonDecoder.decode(JSONElement.self, from: "true".data(using: .utf8)!)
        XCTAssertEqual(decodedBool.stringRepresentation, "true")

        let decodedDouble = try jsonDecoder.decode(JSONElement.self, from: "2.75".data(using: .utf8)!)
        XCTAssertEqual(decodedDouble.stringRepresentation, "2.75")

        let decodedArray = try jsonDecoder.decode(JSONElement.self, from: "[\"one\",2]".data(using: .utf8)!)
        XCTAssertEqual(decodedArray.stringRepresentation, "[\"one\",2.0]")

        let decodedNull = try jsonDecoder.decode(JSONElement.self, from: "null".data(using: .utf8)!)
        XCTAssertEqual(decodedNull.stringRepresentation, "null")
        
        let decodedDict = try jsonDecoder.decode(JSONElement.self, from: "{\"bools\":[true,false]}".data(using: .utf8)!)
        XCTAssertEqual(decodedDict.stringRepresentation, "{\"bools\": [true,false]}")
    }
    
    func testJSONElementCodableEncoder() throws {
        let jsonEncoder = JSONEncoder()

        let stringElement = JSONElement.string("hel\"lo")
        let intElement = JSONElement.int(2)
        let boolElement = JSONElement.bool(true)
        let doubleElement = JSONElement.double(2.75)
        let arrayElement = JSONElement.array([.string("one"), .int(2)])
        let nullElement = JSONElement.null
        let dictElement = JSONElement.dictionary(["bools": JSONElement.array([.bool(true), .bool(false)])])
        
        XCTAssertEqual(String(data: try jsonEncoder.encode(stringElement), encoding: .utf8)!, "\"hel\\\"lo\"")
        XCTAssertEqual(String(data: try jsonEncoder.encode(intElement), encoding: .utf8)!, "2")
        XCTAssertEqual(String(data: try jsonEncoder.encode(boolElement), encoding: .utf8)!, "true")
        XCTAssertEqual(String(data: try jsonEncoder.encode(doubleElement), encoding: .utf8)!, "2.75")
        XCTAssertEqual(String(data: try jsonEncoder.encode(arrayElement), encoding: .utf8)!, "[\"one\",2]")
        XCTAssertEqual(String(data: try jsonEncoder.encode(nullElement), encoding: .utf8)!, "null")
        XCTAssertEqual(String(data: try jsonEncoder.encode(dictElement), encoding: .utf8)!, "{\"bools\":[true,false]}")
    }
}
