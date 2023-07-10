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
            }
            .navigationTitle("Todos")
            .navigationBarItems(
                trailing: HStack(spacing: 20) {
                    EditButton()
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
