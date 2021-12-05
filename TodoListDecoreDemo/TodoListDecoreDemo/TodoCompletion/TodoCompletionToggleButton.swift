
import SwiftUI
import Decore

struct TodoCompletionToggleButton: View {

    var id: TodoList.Item.ID

    @Bind(TodoList.Item.IsCompleted.self) var isCompleted

    var body: some View {
        Button("✓") {
            isCompleted[id].toggle()
        }
        .opacity(isCompleted[id] ? 0.5 : 1)
        .buttonStyle(.borderless)
        .frame(minWidth: 64, minHeight: 64, alignment: .center)
    }
}

struct TodoCompletionToggleButtonButton_Previews: PreviewProvider {
    static var previews: some View {
        TodoCompletionToggleButton(id: 0)
    }
}
