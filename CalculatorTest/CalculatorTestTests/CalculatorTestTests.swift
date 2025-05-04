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
    // 数字入力と小数点入力のテスト
    func testInputNumber() throws {
        // 画面表示が "1" になることを確認
        viewModel.inputNumber("1")
        XCTAssertEqual(viewModel.display, "1")
        // 画面表示が "1.5" になることを確認
        viewModel.inputNumber(".")
        viewModel.inputNumber("5")
        XCTAssertEqual(viewModel.display, "1.5")
    }
    // 四則演算テスト
    func testSetOperationAndCalculateResult() throws {
        viewModel.inputNumber("2")
        viewModel.setOperation("+")
        viewModel.inputNumber("3")
        viewModel.calculateResult()
        XCTAssertEqual(viewModel.display, "5")
    }
}
