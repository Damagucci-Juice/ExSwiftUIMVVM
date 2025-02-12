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
        VStack(spacing: 20) {
            numberView(viewModel.state.count)
            HStack(spacing: 50) {
                subtractButton()
                addButton()
            }
        }
        .alert(item: $viewModel.state.alertItem) { alertItem in
            Alert(
                title: Text(alertItem.title),
                message: Text(alertItem.message),
                dismissButton: .default(Text("OK")) {
                    viewModel.dismissAlert()
                }
            )
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
