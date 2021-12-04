import Decore

struct Counter: Container {
    typealias Value = Int

    static func initialValue() -> Int {
        return 0
    }
}
