//
//  ContentView.swift
//  ExSwiftUIMVVM
//
//  Created by Gucci on 2/12/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var counterViewModel: CounterViewModel = .init()

    var body: some View {
        NavigationStack {
            CounterView(viewModel: counterViewModel)
        }
    }
}

#Preview {
    ContentView()
}
