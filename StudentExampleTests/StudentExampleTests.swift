//
//  StudentExampleTests.swift
//  StudentExampleTests
//
//  Created by Ragaie Alfy on 1/28/20.
//  Copyright © 2020 Ragaie Alfy. All rights reserved.
//
import XCTest

@testable import StudentExample
class StudentExampleTests: XCTestCase {

    var studentPrsenter : StudentPresenter?
    override func setUp() {
        studentPrsenter = StudentPresenter()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        studentPrsenter = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFormatString() {
        let studentObject = Student.init(firstName: "Ali", lastName: "Ahmed", birthDate: "1990-04-01")
        XCTAssertEqual(studentPrsenter?.objectFormat(item: studentObject), "Ali Ahmed,29")
    }
    func testgetingAge() {
          XCTAssertEqual(studentPrsenter?.getDate(bitrhDate: "1990-04-01"), "29")
      }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
