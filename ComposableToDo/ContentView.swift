//
//  ContentView.swift
//  ComposableToDo
//
//  Created by ferico.samuel on 05/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                TodoView()
                // TODO: iterate over stored todos
                //            ForEachStore(
                //                self.store.scope(state: \.filteredTodos, action: Todos.Action.todo(id:action:))
                //            ) {
                //                TodoView(store: $0)
                //            }
                //            .onDelete { viewStore.send(.delete($0)) }
                //            .onMove { viewStore.send(.move($0, $1)) }
            }
            .navigationTitle("Todos")
            .navigationBarItems(
                trailing: HStack(spacing: 20) {
                    Button("Clear Completed") {
                        // TODO: add clear action
                    }
                    
                    Button("Add Todo") {
                        // TODO: add new todo
                    }
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
