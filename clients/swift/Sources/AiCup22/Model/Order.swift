/// Player's (team's) orders
public struct Order {
    /// Orders for each of your units
    let unitOrders: [Int32: UnitOrder]

    /// Read Order from input stream
    static func readFrom<S: InputStream>(_ stream: S) -> Order {
        var unitOrders: [Int32: UnitOrder]
        let unitOrdersSize = stream.readInt32()
        unitOrders = [:]
        for _ in 0..<unitOrdersSize {
            let unitOrdersKey: Int32
            let unitOrdersValue: UnitOrder
            unitOrdersKey = stream.readInt32()
            unitOrdersValue = UnitOrder.readFrom(stream)
            unitOrders[unitOrdersKey] = unitOrdersValue
        }
        return Order(unitOrders: unitOrders)
    }

    /// Write Order to output stream
    func writeTo<S: OutputStream>(_ stream: S) {
        stream.writeInt32(Int32(unitOrders.count))
        for (unitOrdersKey, unitOrdersValue) in unitOrders {
            stream.writeInt32(unitOrdersKey)
            unitOrdersValue.writeTo(stream)
        }
    }
}
