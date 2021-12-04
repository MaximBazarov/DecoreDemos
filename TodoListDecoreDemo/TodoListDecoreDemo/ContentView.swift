//
//  ContentView.swift
//  TodoListDecoreDemo
//
//  Created by Maxim Bazarov on 04.12.21.
//

import SwiftUI
import Decore


struct ContentView: View {

    @Bind(TodoList.ShowMode.self) var showMode
    @Bind(TodoList.AllTodos.self) var todos
    @Observe(TodoList.NewID.self) var newID

    var body: some View {
        VStack {
            Picker(
                "",
                selection: $showMode,
                content: {
                    Text("All").tag(0)
                    Text("Favorites").tag(1)
                }).pickerStyle(.segmented)
                .padding()
            TodoListView()
            Spacer()
            Button("Add New Todo") {
                todos.append(newID)
            }.buttonStyle(.borderedProminent)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
