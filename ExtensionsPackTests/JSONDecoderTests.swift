//
//  JSONDecoderTests.swift
//  ExtensionsPackTests
//
//  Created by Yaroslav Pasternak on 19.06.2018.
//  Copyright © 2018 Thorax. All rights reserved.
//

import XCTest
@testable import ExtensionsPack

class JSONDecoderTests: XCTestCase {

    func testDecoding() {
        struct TestStruct: Codable {
            let name: String
            let age: Int
            let city: String?
        }

        let jsonString = """
                        {
                            "Name": "Testname",
                            "Age": 25,
                            "City": "California"
                        }
        """

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromUpperCamelCase
        XCTAssertNoThrow(try decoder.decode(TestStruct.self, from: Data(jsonString.utf8)))
    }

}
