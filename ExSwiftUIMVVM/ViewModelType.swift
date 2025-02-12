//
//  ViewModelType.swift
//  ExSwiftUIMVVM
//
//  Created by Gucci on 2/12/25.
//

import Foundation
import Combine

protocol ViewModelType: ObservableObject {
    associatedtype Action
    associatedtype State

    var state: State { get }

    func action(_ action: Action)
}
