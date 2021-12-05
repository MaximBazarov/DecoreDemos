
import Decore

extension TodoList {
    enum Item {}
}

extension TodoList.Item {

    typealias ID = Int

    struct Title: GroupContainer {
        typealias Element = String
        typealias ID = TodoList.Item.ID

        static func initialValue(for id: ID) -> Element {
            "New Todo #\(id)"
        }
    }
}
