//
//  TuringSiteTestsTests.swift
//  TuringSiteTestsTests
//
//  Created by fabiocunha on 04/01/22.
//

import XCTest
import SwiftUI

import Combine

class TuringSiteTestsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        //XCTAssertTrue(true)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_aa() {
        
        class Dog {
            func bark() {
                print ("Woof !")
            }
        }
        
        class Corgi : Dog {
            override func bark() {
                print ("Yip!")
            }
        }
        let muttface = Corgi()

        muttface.bark()
        
        
//        var motto = "Swift quiz at Turing"
//        motto.replacingOccurrences(of: "Swift", with: "Android")
//        print (motto)
        
//        var screen = CGRect(x: 0, y: 0, width: 320, height: 480) {
//            didSet { print("Screen changed") }
//        }
//
//        screen.origin.x = 30 // apenas chama didSet qunado "screen.origin.x" é chamado
//        var screen2 = screen // quando chama por referencia, o didSet não funciona
//        screen2.size = CGSize(width: 20, height: 20)
//        screen2.origin.x = 10
//        screen.origin.x = 40
        
        
//        let p = Publishers.Sequence<[Int], Error>(sequence: [1, 4, 8])
//        p.append([3, 8, 18])
//            .filter { $0 >= 3 }
//            .count()
//
//        let alleven = p.tryAllSatisty { $0 % 2 == 0 }
        
        
//        let nsString = NSString("Hello")
//        let swiftString = String(nsString)
//        print(swiftString)
        
        
//        var s = CGSize(width: 100, height: 100)
//        s.scale(by: 2)
//        s.scale(by: 2)
//        s.width += 100
//        print(s)
        
//        enum Skill: Int {
//            case swiftUI, combine, arkit = 3
//            static subscript(n: Int) -> Skill? {
//                return Skill(rawValue: n)
//            }
//        }
//
//        let skill = Skill[2]
//        print(skill)
        
        
        
//        struct IntegralSize {
//            var width: Int
//            var height: Int
//            init(_ size: CGSize) {
//                self.width = Int(size.width)
//                self.height = Int(size.height)
//
//                if size.height == 50 { self.height = 25 }
//                if size.width  == 50 { self.width = 25 }
//
//            }
//        }
//
//        let size = IntegralSize(CGSize(width: 50, height: 50))
//        let size0fBoard = IntegralSize(CGSize(width: 50, height: 50))
//        print(size, size0fBoard)

         

        
        XCTAssertTrue(true)
    }
}

extension CGSize {
    mutating func scale(by f: CGFloat) {
        width *= 4
        height *= f
    }
    
}
