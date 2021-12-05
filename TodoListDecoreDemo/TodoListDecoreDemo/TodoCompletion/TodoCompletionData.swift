
import Decore

extension TodoList.Item {

    struct IsCompleted: GroupContainer {
        typealias Element = Bool
        typealias ID = TodoList.Item.ID

        static func initialValue(for id: ID) -> Element {
            false
        }
    }

}
