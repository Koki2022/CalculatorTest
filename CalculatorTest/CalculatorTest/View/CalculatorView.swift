//
//  ContentView.swift
//  CalculatorTest
//
//  Created by 高橋昴希 on 2025/04/28.
//

import SwiftUI

struct CalculatorView: View {
    @StateObject private var viewModel = CalculatorViewModel()
    // ボタンのレイアウトを定義
    private let buttons: [[String]] = [
        ["7", "8", "9", "/"],
        ["4", "5", "6", "*"],
        ["1", "2", "3", "-"],
        ["0", ".", "=", "+"],
        ["C", "⌫"]
    ]
    
    var body: some View {
        VStack(spacing: 10) {
            // 計算結果を表示
            Text(viewModel.display)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                .background(Color.gray.opacity(0.2))
        }
        // ボタン配列を使用してボタンを表示
        ForEach(buttons, id: \.self) { row in
            HStack(spacing: 10) {
                ForEach(row, id: \.self) { button in
                    Button(action: {
                        buttonTapped(button)
                    }) {
                        Text(button)
                            .font(.title)
                            .frame(width: button == "0" ? 150 : 70, height: 70)
                            .background(Color.blue)
                            .foregroundStyle(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
        }
    }
    // ボタンタップ時の処理
    private func buttonTapped(_ button: String) {
        switch button {
            // 数字ボタンか.ボタンタップ時、文字列追加
        case "0"..."9", ".":
            viewModel.inputNumber(button)
            // 演算子タップ時の処理
        case "+", "-", "*", "/":
            viewModel.setOperation(button)
            // =をタップしたら計算結果を表示
        case "=":
            viewModel.calculateResult()
            // 処理せずswitch文を抜ける
        default:
            break
        }
    }
}

#Preview {
    CalculatorView()
}
