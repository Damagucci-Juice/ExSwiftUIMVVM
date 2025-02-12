//
//  CounterViewModel.swift
//  ExSwiftUIMVVM
//
//  Created by Gucci on 2/12/25.
//

import Foundation
import Combine

final class CounterViewModel: ViewModelType {
    // MARK: - Types
    enum State {
        case count(Int)
    }

    enum Action {
        case onTapAddButton
        case onTapSubtractButton
    }

    // MARK: - Properties
    @Published var state: State


    // MARK: - Initializer
    init() {
        state = .count(0)
    }

    // MARK: - Action
    func action(_ action: Action) {
        switch action {
        case .onTapAddButton:
            state = .count(getCurrnetCount() + 1)
        case .onTapSubtractButton:
            state = .count(getCurrnetCount() - 1)
        }
    }

    private func getCurrnetCount() -> Int {
        guard case let .count(int) = state else { return 0 }
        return int
    }
}
