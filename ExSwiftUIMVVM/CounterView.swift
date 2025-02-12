//
//  CounterView.swift
//  ExSwiftUIMVVM
//
//  Created by Gucci on 2/12/25.
//

import SwiftUI

struct CounterView: View {
    @ObservedObject var viewModel: CounterViewModel

    var body: some View {
        switch viewModel.state {
        case .count(let number):
            VStack(spacing: 20) {
                numberView(number)
                HStack(spacing: 50) {
                    subtractButton()
                    addButton()
                }
            }
        }
    }

    @ViewBuilder
    private func numberView(_ number: Int) -> some View {
        Text("\(number)")
            .font(.title)
    }

    @ViewBuilder
    private func subtractButton() -> some View {
      Button("-") {
        viewModel.action(.onTapSubtractButton)
      }
      .font(.largeTitle)
    }

    @ViewBuilder
    private func addButton() -> some View {
      Button("+") {
        viewModel.action(.onTapAddButton)
      }
      .font(.largeTitle)
    }

}

#Preview {
    @StateObject var viewModel = CounterViewModel()

    CounterView(viewModel: viewModel)
}
