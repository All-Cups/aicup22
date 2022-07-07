package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Player's (team's) orders
 */
class Order {
    /**
     * Orders for each of your units
     */
    var unitOrders: MutableMap<Int, ai_cup_22.model.UnitOrder>

    constructor(unitOrders: MutableMap<Int, ai_cup_22.model.UnitOrder>) {
        this.unitOrders = unitOrders
    }

    /**
     * Write Order to output stream
     */
    @Throws(java.io.IOException::class)
    fun writeTo(stream: java.io.OutputStream) {
        StreamUtil.writeInt(stream, unitOrders.size)
        for (unitOrdersEntry in unitOrders) {
            val unitOrdersKey = unitOrdersEntry.key
            StreamUtil.writeInt(stream, unitOrdersKey)
            val unitOrdersValue = unitOrdersEntry.value
            unitOrdersValue.writeTo(stream)
        }
    }

    /**
     * Get string representation of Order
     */
    override fun toString(): String {
        var stringBuilder = StringBuilder("Order { ")
        stringBuilder.append("unitOrders: ")
        stringBuilder.append(unitOrders)
        stringBuilder.append(" }")
        return stringBuilder.toString()
    }

    companion object {
        /**
         * Read Order from input stream
         */
        @Throws(java.io.IOException::class)
        fun readFrom(stream: java.io.InputStream): Order {
            var unitOrders: MutableMap<Int, ai_cup_22.model.UnitOrder>
            val unitOrdersSize = StreamUtil.readInt(stream)
            unitOrders = mutableMapOf();
            for (unitOrdersIndex in 0 until unitOrdersSize) {
                var unitOrdersKey: Int
                unitOrdersKey = StreamUtil.readInt(stream)
                var unitOrdersValue: ai_cup_22.model.UnitOrder
                unitOrdersValue = ai_cup_22.model.UnitOrder.readFrom(stream)
                unitOrders.put(unitOrdersKey, unitOrdersValue)
            }
            return Order(unitOrders)
        }
    }
}