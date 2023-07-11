//
//  ComposableToDoApp.swift
//  ComposableToDo
//
//  Created by ferico.samuel on 05/07/23.
//

import SwiftUI

@main
struct ComposableToDoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: .init(initialState: .init(todos: .mock), reducer: {
                Todos()
            }))
        }
    }
}
