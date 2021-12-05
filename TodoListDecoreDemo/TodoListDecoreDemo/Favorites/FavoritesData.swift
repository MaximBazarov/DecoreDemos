
import Decore

extension TodoList {

    /// List of item IDs that are marked as favorite.
    struct Favorites: Container {
        typealias Value = Set<TodoList.Item.ID>
        static func initialValue() -> Value {
            []
        }
    }
    
}
