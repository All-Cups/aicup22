class MyStrategy {
    init(_ constants: Constants) {}
    func getOrder(_ game: Game, _ debugInterface: DebugInterface?) -> Order {
        return Order(unitOrders: [:])
    }
    func debugUpdate(_ displayedTick: Int32, _ debugInterface: DebugInterface) {}
    func finish() {}
}