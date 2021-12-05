
import Decore

enum TodoList {


    /// Computes the new ID for a todo item.
    struct NewID: Computation {
        typealias Value = Int

        static func value(read: Storage.Reader) -> Value {
            // reading the value for AllTodos container
            let all = read(AllTodos.self)
            // finding the maximum index in the array
            let biggestIndex = all.reduce(into: 0) { acc, el in
                acc = max(acc, el)
            }
            // return next after the biggest index
            return biggestIndex + 1
        }
    }

    /// List of all existing todo items.
    struct AllTodos: Container {
        typealias Value = [TodoList.Item.ID]
        static func initialValue() -> Value {
            []
        }
    }

    /// Show mode defining which set of todo items to show.
    struct ShowMode: Container {
        /// for simplicity I used int here, 0 = all, 1 = favorites, will be changed later
        typealias Value = Int

        static func initialValue() -> Value {
            0
        }
    }

    /// Computes the list of Todo item IDs to show depending on the selected mode
    struct TodosToShow: Computation {
        typealias Value = [TodoList.Item.ID]

        static func value(read: Storage.Reader) -> Value {
            let show = read(ShowMode.self)
            switch show {
            case 0: return read(AllTodos.self)
            case 1: return Array(read(Favorites.self))
            default: return read(AllTodos.self)
            }
        }
    }
}
