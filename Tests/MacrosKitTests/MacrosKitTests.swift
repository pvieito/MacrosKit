//
//  MacrosKitTests.swift
//  MacrosKit
//
//  Created by Pedro José Pereira Vieito on 09/01/2024.
//  Copyright © 2024 Pedro José Pereira Vieito. All rights reserved.
//

import Foundation
import XCTest
import MacrosKit

class CGRatioTests: XCTestCase {
    func testURLMacro() throws {
        let url: URL = #URL("https://pvieito.com")
        XCTAssertNotNil(url)
        XCTAssertEqual(url.absoluteString, "https://pvieito.com")
    }
    
    func testAssociatedValuesMacro() throws {
        @AssociatedValues
        enum AssociatedValuesMacroEnum {
            case case1(String)
            case case2(Int, String)
        }
        
        let case1Value = UUID().uuidString
        XCTAssertEqual(AssociatedValuesMacroEnum.case1(case1Value).case1Value, case1Value)
        XCTAssertNil(AssociatedValuesMacroEnum.case1(case1Value).case2Value)
    }
}
