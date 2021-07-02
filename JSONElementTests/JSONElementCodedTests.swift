//
//  JSONElementCodedTests.swift
//  JSONElementTests
//
//  Created by Narek Mailian on 2021-06-30.
//

import XCTest
@testable import JSONElement

class JSONElementCodedTests: XCTestCase {
    struct Car: Codable, Equatable {
        let name: String
        let manufactureDate: Date
        let manualTransmission: Bool
    }
    
    func testJSONElementCodedDecoder() throws {
        let dict = JSONElement.dictionary(
            [
                "manualTransmission": .bool(true),
                "manufactureDate": .int(-647092028),
                "name": .string("Lada Niva")
            ]
        )
        
        let decoder = JSONDecoder()
        
        let decodedCar: Car = try dict.decoded(usingDecoder: decoder)
        
        let car = Car(
            name: "Lada Niva",
            manufactureDate: Date(timeIntervalSince1970: 331215172),
            manualTransmission: true
        )

        XCTAssertEqual(car, decodedCar)
    }
    
    func testJSONElementCodedEncoder() throws {
        let car = Car(
            name: "Lada Niva",
            manufactureDate: Date(timeIntervalSince1970: 331215172),
            manualTransmission: true
        )
        
        let encoder = JSONEncoder()
        
        let json = try JSONElement(encodable: car, usingEncoder: encoder)
        
        XCTAssertEqual(
            json,
            .dictionary(
                [
                    "manualTransmission": .bool(true),
                    "manufactureDate": .int(-647092028),
                    "name": .string("Lada Niva")
                ]
            )
        )
    }
}
