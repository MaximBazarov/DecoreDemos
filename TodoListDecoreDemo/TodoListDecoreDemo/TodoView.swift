//
//  TodoView.swift
//  TodoListDecoreDemo
//
//  Created by Maxim Bazarov on 04.12.21.
//

import SwiftUI
import Decore

struct TodoView: View {

    var id: TodoList.ID

    @Bind(TodoList.Title.self) var title
    @Bind(TodoList.Favorites.self) var favorites
    @Bind(TodoList.isCompleted.self) var isCompleted


    var body: some View {
        HStack {
            Button("✓") {
                isCompleted[id].toggle()
            }.frame(minWidth: 64, minHeight: 64, alignment: .center)
            if isCompleted[id] {
                Text(title[id]).strikethrough()
            }
            else {
                TextField("Title", text: $title[id])
            }
            Button(favorites.contains(id) ? "★" : "☆") {
                if favorites.contains(id) {
                    favorites.remove(id)
                }
                else {
                    favorites.insert(id)
                }
            }.buttonStyle(.borderedProminent)
            .frame(minWidth: 64, minHeight: 64, alignment: .center)
        }
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView(id: 0)
    }
}
