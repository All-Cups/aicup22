module model.order;

import stream;
import std.conv;
import std.typecons : Nullable;
import model.unit_order;

/// Player's (team's) orders
struct Order {
    /// Orders for each of your units
    model.UnitOrder[int] unitOrders;

    this(model.UnitOrder[int] unitOrders) {
        this.unitOrders = unitOrders;
    }

    /// Read Order from reader
    static Order readFrom(Stream reader) {
        model.UnitOrder[int] unitOrders;
        int unitOrdersSize = reader.readInt();
        unitOrders.clear();
        for (int unitOrdersIndex = 0; unitOrdersIndex < unitOrdersSize; unitOrdersIndex++) {
            int unitOrdersKey;
            model.UnitOrder unitOrdersValue;
            unitOrdersKey = reader.readInt();
            unitOrdersValue = model.UnitOrder.readFrom(reader);
            unitOrders[unitOrdersKey] = unitOrdersValue;
        }
        return Order(unitOrders);
    }

    /// Write Order to writer
    void writeTo(Stream writer) const {
        writer.write(cast(int)(unitOrders.length));
        foreach (unitOrdersKey, unitOrdersValue; unitOrders) {
            writer.write(unitOrdersKey);
            unitOrdersValue.writeTo(writer);
        }
    }
}