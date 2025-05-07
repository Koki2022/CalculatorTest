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
    // リセットボタンテスト
    func testReset() throws {
        viewModel.inputNumber("3")
        viewModel.reset()
        XCTAssertEqual(viewModel.display, "0")
    }
    // 末尾削除（⌫ボタン）のテスト
    func testDeleteLastCharacter() throws {
        // まずは4と入力
        viewModel.inputNumber("4")
        // 次に5を入力
        viewModel.inputNumber("5")
        // 1文字消すと4が残るか確認
        viewModel.deleteLastCharacter()
        XCTAssertEqual(viewModel.display, "4")
        // もう1文字消すと値がなくなり0と表示
        viewModel.deleteLastCharacter()
        XCTAssertEqual(viewModel.display, "0")
    }
}
