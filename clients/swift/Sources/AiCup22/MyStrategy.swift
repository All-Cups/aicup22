class MyStrategy {
    init(_ constants: Constants) {}
    func getOrder(_ game: Game, _ debugInterface: DebugInterface?) -> Order {
        return Order(unitOrders: [:])
    }
    func debugUpdate(_ debug_interface: DebugInterface) {}
    func finish() {}
}
