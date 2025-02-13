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
    struct State {
        var count: Int
        var alertItem: AlertItem? // `nil`이면 Alert 없음
    }

    struct AlertItem: Identifiable {
        let id = UUID()
        let title: String
        let message: String
    }

    enum Action {
        case onTapAddButton
        case onTapSubtractButton
        case onAlertDismiss
    }

    // MARK: - Properties
    @Published var state: State


    // MARK: - Initializer
    init() {
        state = State(count: 0, alertItem: nil)
    }

    // MARK: - Action
    func action(_ action: Action) {
        switch action {
        case .onTapAddButton:
            state.count += 1
        case .onTapSubtractButton:
            if state.count - 1 < 0 {
                state.alertItem = AlertItem(
                    title: "에러",
                    message: "카운트는 0 이하 일 수 없습니다."
                )
            } else {
                state.count -= 1
            }
        case .onAlertDismiss:
            state.alertItem = nil
        }
    }
}
