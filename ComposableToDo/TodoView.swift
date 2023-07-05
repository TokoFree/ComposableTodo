//
//  TodoView.swift
//  ComposableToDo
//
//  Created by ferico.samuel on 05/07/23.
//

import SwiftUI

struct TodoView: View {
    @State var isComplete = false
    @State var descrption = ""
    
    var body: some View {
        HStack {
            Button {
                // TODO: bind completion
                isComplete.toggle()
            } label: {
                // TODO: ke viewStore
                Image(systemName: isComplete ? "checkmark.square" : "square")
            }
            .buttonStyle(.plain)
            
            // TODO: bind ke viewStore
            TextField("Untitled Todo", text: $descrption)
        }
        // TODO: ke viewStore
        .foregroundColor(isComplete ? .gray : nil)
    }
}
