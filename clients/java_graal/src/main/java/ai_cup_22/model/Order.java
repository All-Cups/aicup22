package ai_cup_22.model;

import ai_cup_22.util.StreamUtil;

/**
 * Player's (team's) orders
 */
public class Order {
    /**
     * Orders for each of your units
     */
    private java.util.Map<Integer, ai_cup_22.model.UnitOrder> unitOrders;

    /**
     * Orders for each of your units
     */
    public java.util.Map<Integer, ai_cup_22.model.UnitOrder> getUnitOrders() {
        return unitOrders;
    }

    /**
     * Orders for each of your units
     */
    public void setUnitOrders(java.util.Map<Integer, ai_cup_22.model.UnitOrder> value) {
        this.unitOrders = value;
    }

    public Order(java.util.Map<Integer, ai_cup_22.model.UnitOrder> unitOrders) {
        this.unitOrders = unitOrders;
    }

    /**
     * Read Order from input stream
     */
    public static Order readFrom(java.io.InputStream stream) throws java.io.IOException {
        java.util.Map<Integer, ai_cup_22.model.UnitOrder> unitOrders;
        int unitOrdersSize = StreamUtil.readInt(stream);
        unitOrders = new java.util.HashMap<>(unitOrdersSize);
        for (int unitOrdersIndex = 0; unitOrdersIndex < unitOrdersSize; unitOrdersIndex++) {
            int unitOrdersKey;
            unitOrdersKey = StreamUtil.readInt(stream);
            ai_cup_22.model.UnitOrder unitOrdersValue;
            unitOrdersValue = ai_cup_22.model.UnitOrder.readFrom(stream);
            unitOrders.put(unitOrdersKey, unitOrdersValue);
        }
        return new Order(unitOrders);
    }

    /**
     * Write Order to output stream
     */
    public void writeTo(java.io.OutputStream stream) throws java.io.IOException {
        StreamUtil.writeInt(stream, unitOrders.size());
        for (java.util.Map.Entry<Integer, ai_cup_22.model.UnitOrder> unitOrdersEntry : unitOrders.entrySet()) {
            int unitOrdersKey = unitOrdersEntry.getKey();
            StreamUtil.writeInt(stream, unitOrdersKey);
            ai_cup_22.model.UnitOrder unitOrdersValue = unitOrdersEntry.getValue();
            unitOrdersValue.writeTo(stream);
        }
    }

    /**
     * Get string representation of Order
     */
    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder("Order { ");
        stringBuilder.append("unitOrders: ");
        stringBuilder.append(String.valueOf(unitOrders));
        stringBuilder.append(" }");
        return stringBuilder.toString();
    }
}