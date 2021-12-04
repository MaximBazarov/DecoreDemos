
import Decore

enum TodoList {

    typealias ID = Int

    struct Title: GroupContainer {
        typealias Element = String
        typealias ID = TodoList.ID

        static func initialValue(for id: ID) -> Element {
            "New Todo #\(id)"
        }
    }

    struct isCompleted: GroupContainer {
        typealias Element = Bool
        typealias ID = TodoList.ID

        static func initialValue(for id: TodoList.ID) -> Bool {
            false
        }
    }

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

    struct AllTodos: Container {
        typealias Value = [TodoList.ID]
        static func initialValue() -> [TodoList.ID] {
            []
        }
    }

    struct Favorites: Container {
        typealias Value = Set<TodoList.ID>
        static func initialValue() -> Value {
            []
        }
    }

    struct ShowMode: Container {
        /// for simplicity I used int here, 0 = all, 1 = favorites, will be changed later
        typealias Value = Int

        static func initialValue() -> Value {
            0
        }
    }

    struct TodosToShow: Computation {
        typealias Value = [TodoList.ID]

        static func value(read: Storage.Reader) -> [TodoList.ID] {
            let show = read(ShowMode.self)
            switch show {
            case 0: return read(AllTodos.self)
            case 1: return Array(read(Favorites.self))
            default: return read(AllTodos.self)
            }
        }
    }
}
