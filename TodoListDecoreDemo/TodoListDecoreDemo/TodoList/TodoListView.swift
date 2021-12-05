
import SwiftUI
import Decore

struct TodoListView: View {

    @Observe(TodoList.TodosToShow.self) var todos

    var body: some View {
        List(todos, id: \.self) { id in
            TodoItemView(id: id)
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
