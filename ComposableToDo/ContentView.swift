//
//  ContentView.swift
//  ComposableToDo
//
//  Created by ferico.samuel on 05/07/23.
//

import ComposableArchitecture
import SwiftUI

struct Todos: ReducerProtocol {
    struct State: Equatable {
        var todos: IdentifiedArrayOf<Todo.State> = []
    }
    
    enum Action: BindableAction, Equatable, Sendable {
        case binding(BindingAction<State>)
        case todo(id: Todo.State.ID, action: Todo.Action)
        case addTodo
        case clearCompleted
    }
    
    @Dependency(\.uuid) var uuid
    
    var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding: return .none
            case .todo(id: let id, action: let action):
                return .none
            case .addTodo:
                state.todos.insert(Todo.State(id: self.uuid()), at: 0)
                return .none
            case .clearCompleted:
                state.todos.removeAll(where: \.isComplete)
                return .none
            }
        }
        .forEach(\.todos, action: /Action.todo(id:action:)) {
            Todo()
        }
    }
}

struct ContentView: View {
    let store: StoreOf<Todos>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                List {
                    ForEachStore(self.store.scope(
                        state: \.todos,
                        action: Todos.Action.todo(id:action:))
                    ) {
                        TodoView(store: $0)
                    }
                }
                .navigationTitle("Todos")
                .navigationBarItems(
                    trailing: HStack(spacing: 20) {
                        Button("Clear Completed") {
                            viewStore.send(.clearCompleted)
                        }
                        
                        Button("Add Todo") {
                            viewStore.send(.addTodo)
                        }
                    }
                )
            }
        }
    }
}

extension IdentifiedArray where ID == Todo.State.ID, Element == Todo.State {
  static let mock: Self = [
    Todo.State(
      description: "Check Mail",
      id: UUID(),
      isComplete: false
    ),
    Todo.State(
      description: "Buy Milk",
      id: UUID(),
      isComplete: false
    ),
    Todo.State(
      description: "Call Mom",
      id: UUID(),
      isComplete: true
    ),
  ]
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: .init(initialState: .init(todos: .mock),
                                 reducer: {
            Todos()
        }))
    }
}
