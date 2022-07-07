package ai_cup_22.model

import ai_cup_22.util.StreamUtil

/**
 * Player's (team's) orders
 *
 * @param unitOrders Orders for each of your units
 */
case class Order(unitOrders: Map[Int, ai_cup_22.model.UnitOrder]) {
    /**
     * Write Order to output stream
     */
    def writeTo(stream: java.io.OutputStream): scala.Unit = {
        StreamUtil.writeInt(stream, unitOrders.size)
        unitOrders.foreach { case (key, value) =>
            StreamUtil.writeInt(stream, key)
            value.writeTo(stream)
        }
    }

    /**
     * Get string representation of Order
     */
    override def toString(): String = {
        var stringBuilder = new StringBuilder("Order { ")
        stringBuilder.append("unitOrders: ")
        stringBuilder.append(unitOrders)
        stringBuilder.append(" }")
        stringBuilder.toString()
    }
}

object Order {
    /**
     * Read Order from input stream
     */
    def readFrom(stream: java.io.InputStream): Order = Order(
        (0 until StreamUtil.readInt(stream)).map { _ => (
            StreamUtil.readInt(stream),
            ai_cup_22.model.UnitOrder.readFrom(stream)
        )}.toMap
    )
}