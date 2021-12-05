
import SwiftUI
import Decore

struct TodoItemView: View {

    var id: TodoList.Item.ID

    @Bind(TodoList.Item.Title.self) var title
    @Observe(TodoList.Item.IsCompleted.self) var isCompleted

    var body: some View {
        HStack {
            TodoCompletionToggleButton(id: id)

            if isCompleted[id] {
                Text(title[id]).strikethrough()
            }
            else {
                TextField("Title", text: $title[id])
            }

            Spacer()

            FavoriteButton(id: id)
        }
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemView(id: 0)
    }
}

