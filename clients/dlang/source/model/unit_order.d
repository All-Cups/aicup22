module model.unit_order;

import stream;
import std.conv;
import std.typecons : Nullable;
import model.action_order;
import model.vec2;

/// Order for specific unit
struct UnitOrder {
    /// Target moving velocity
    model.Vec2 targetVelocity;
    /// Target view direction (vector length doesn't matter)
    model.Vec2 targetDirection;
    /// Order to perform an action, or None
    Nullable!(model.ActionOrder) action;

    this(model.Vec2 targetVelocity, model.Vec2 targetDirection, Nullable!(model.ActionOrder) action) {
        this.targetVelocity = targetVelocity;
        this.targetDirection = targetDirection;
        this.action = action;
    }

    /// Read UnitOrder from reader
    static UnitOrder readFrom(Stream reader) {
        model.Vec2 targetVelocity;
        targetVelocity = model.Vec2.readFrom(reader);
        model.Vec2 targetDirection;
        targetDirection = model.Vec2.readFrom(reader);
        Nullable!(model.ActionOrder) action;
        if (reader.readBool()) {
            action = model.ActionOrder.readFrom(reader);
        } else {
            action.nullify();
        }
        return UnitOrder(targetVelocity, targetDirection, action);
    }

    /// Write UnitOrder to writer
    void writeTo(Stream writer) const {
        targetVelocity.writeTo(writer);
        targetDirection.writeTo(writer);
        if (action.isNull()) {
            writer.write(false);
        } else {
            writer.write(true);
            auto actionValue = action.get;
            actionValue.writeTo(writer);
        }
    }
}