//
//  CalculatorTestTests.swift
//  CalculatorTestTests
//
//  Created by 高橋昴希 on 2025/04/28.
//

import XCTest
@testable import CalculatorTest

final class CalculatorTestTests: XCTestCase {
    
    var viewModel: CalculatorViewModel!
    // テストの前に毎回呼ばれる関数。
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // テスト前に毎回新しいインスタンスを作成する
        viewModel = CalculatorViewModel()
    }
    // テストの後に毎回呼ばれる関数。
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        // インスタンスを破棄
        viewModel = nil
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
