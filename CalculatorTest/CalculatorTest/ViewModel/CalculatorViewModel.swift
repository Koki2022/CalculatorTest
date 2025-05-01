//
//  CalculatorViewModel.swift
//  CalculatorTest
//
//  Created by 高橋昴希 on 2025/05/01.
//

import Foundation

class CalculatorViewModel: ObservableObject {
    // 画面に表示される文字
    @Published var display: String = "0"
    // 入力中の数字。private(set): クラスの外からは読み取りだけOK、書き換えはこのクラスの中だけOK
    private(set) var currentNumber: Double = 0.0
    // 入力直前の数字
    private(set) var previousNumber: Double = 0.0
    // 選択した演算子
    private(set) var selectedOperation: String? = nil
    
    // 数字ボタンタップ時、画面に数字を足していく処理
    func inputNumber(_ input: String) {
        // 現在の値が0、もしくは演算子を押下後に数字未入力の状態の時
        if display == "0" || (selectedOperation != nil && currentNumber == 0) {
            // 0の後に小数点を入力できるようにする
            if input == "." {
                display = "0."
            } else {
                // 普通の数字入力
                display = input
            }
        } else {
            // すでに数字が入力されているとき
            // 小数点がすでに含まれていたら、さらに小数点を入れないように制御
            if input == "." && display.contains(".") {
                return
            }
            // 数字を入力後は表示してる文字列に新しい文字をくっつける
            display += input
        }
        // 入力した文字を数値に変換
        currentNumber = Double(display) ?? 0
    }
    // 演算子タップ時の処理
    func setOperation(_ opreation: String) {
        // 演算子セット
        selectedOperation = opreation
        // 入力してた数字を保存
        previousNumber = currentNumber
        // 演算子押下後は数字をリセット
        currentNumber = 0
    }
    // 計算処理結果
    func calculateResult() {
        // 演算子がセットされているかチェック
        guard let selectedOperation = selectedOperation else { return }
        // 演算子毎の処理
        switch selectedOperation {
        case "+":
            currentNumber = previousNumber + currentNumber
        case "-":
            currentNumber = previousNumber - currentNumber
        case "*":
            currentNumber = previousNumber * currentNumber
        case "/":
            currentNumber = previousNumber / currentNumber
        default:
            break
        }
        // 計算結果表示
        display = formatResult(currentNumber)
        // 演算子をクリア
        self.selectedOperation = nil
    }
    // クリアボタン押下時の処理
    func reset() {
        display = "0"
        currentNumber = 0
        previousNumber = 0
        selectedOperation = nil
    }
    // 末尾の数値を削除する
    func deleteLastCharacter() {
        // 文字が1文字以下なら削除したときに0を表示する
        guard display.count > 1 else {
            display = "0"
            currentNumber = 0
            return
        }
        // 末尾削除
        display.removeLast()
        // 削除後の数値を入力中の数字に代入
        currentNumber = Double(display) ?? 0
    }
    // 計算結果を整形する(小数点以下が0なら小数点なしで出力)
    private func formatResult(_ value: Double)  -> String {
        // value を1で割った余りを見ることで、「小数点以下がゼロか」をチェック
        return value.truncatingRemainder(dividingBy: 1) == 0 ?
        // valueが整数なら小数点なしで表示 "%.0f":「浮動小数を0桁 = 小数点以下を表示しない」
        String(format: "%.0f", value) : String(value)
    }
}
