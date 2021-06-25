//
//  NasaTests.swift
//  NasaTests
//
//  Created by Cole on 22/06/2021.
//  Copyright © 2021 Cole. All rights reserved.
//

import XCTest
import Foundation

@testable import Nasa

class NasaTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    
    func testNasaAPI() {
        guard let url = URL(string: "https://images-api.nasa.gov/search?q=%22%22") else {
            fatalError("URL can't be empty")
        }
        
        // Test 1 : XCTFail
        // Test 2 : XCTAssertThrowsError
    }
    
    func testNasaDataModel(){
        
    }

}


