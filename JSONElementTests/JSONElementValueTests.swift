//
//  JSONElementValueTests.swift
//  JSONElementTests
//
//  Created by Narek Mailian on 2021-06-30.
//

import XCTest
@testable import JSONElement

class JSONElementValueTests: XCTestCase {
    func testJSONElementValueInit() throws {
        let stringElement = try JSONElement(NSString("hel\"lo"))
        let intElement = try JSONElement(1)
        let boolElement = try JSONElement(true)
        let doubleElement = try JSONElement(1.75)
        let arrayElement = try JSONElement(["one", 2])
        let nullElement = try JSONElement(NSNull())
        let dictElement = try JSONElement(["bools":[true, false]])

        XCTAssertEqual(stringElement, JSONElement.string("hel\"lo"))
        XCTAssertEqual(intElement, JSONElement.int(1))
        XCTAssertEqual(boolElement, JSONElement.bool(true))
        XCTAssertEqual(doubleElement, JSONElement.double(1.75))
        XCTAssertEqual(arrayElement, JSONElement.array([.string("one"), .int(2)]))
        XCTAssertEqual(nullElement, JSONElement.null)
        XCTAssertEqual(dictElement, JSONElement.dictionary(["bools": JSONElement.array([.bool(true), .bool(false)])]))
    }
    
    func testJSONElementValueRepresentation() throws {
        XCTAssertEqual("hel\"lo", JSONElement.string("hel\"lo").value as! String)
        XCTAssertEqual(1, JSONElement.int(1).value as! Int)
        XCTAssertEqual(true, JSONElement.bool(true).value as! Bool)
        XCTAssertEqual(1.75, JSONElement.double(1.75).value as! Double)
        XCTAssertEqual([1, 2], JSONElement.array([.int(1), .int(2)]).value as! Array<Int>)
        XCTAssertEqual(NSNull(), JSONElement.null.value as! NSNull)
        XCTAssertEqual(["bools":[true, false]], JSONElement.dictionary(["bools": JSONElement.array([.bool(true), .bool(false)])]).value as! Dictionary<String, Array<Bool>>)

    }
}
