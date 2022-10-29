//
//  TestExtensions.swift
//  DataTests
//
//  Created by fabiocunha on 07/10/22.
//

import Foundation
import XCTest

extension XCTestCase {
    
    func checkMemoryLeak(for instance:AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, file: file, line: line)
        }
    }
    
}
