//
//  TodoView.swift
//  ComposableToDo
//
//  Created by ferico.samuel on 05/07/23.
//

import ComposableArchitecture
import SwiftUI

struct Todo: ReducerProtocol {
  struct State: Equatable, Identifiable {
    @BindingState var description = ""
    let id: UUID
    @BindingState var isComplete = false
  }

  enum Action: BindableAction, Equatable, Sendable {
    case binding(BindingAction<State>)
  }

  var body: some ReducerProtocol<State, Action> {
    BindingReducer()
  }
}

struct TodoView: View {
    let store: StoreOf<Todo>
    
    var body: some View {
        WithViewStore(store) { $0 } content: { viewStore in
            HStack {
                Button {
                    viewStore.$isComplete.wrappedValue.toggle()
                } label: {
                    Image(systemName: viewStore.isComplete ? "checkmark.square" : "square")
                }
                .buttonStyle(.plain)
                TextField("Untitled Todo", text: viewStore.$description)
            }
            .foregroundColor(viewStore.isComplete ? .gray : nil)
        }
    }
}
