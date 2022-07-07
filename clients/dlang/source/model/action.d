module model.action;

import stream;
import std.conv;
import std.typecons : Nullable;
import model.action_type;

/// Action unit is currently performing
struct Action {
    /// Tick when the action will be finished
    int finishTick;
    /// Type of the action
    model.ActionType actionType;

    this(int finishTick, model.ActionType actionType) {
        this.finishTick = finishTick;
        this.actionType = actionType;
    }

    /// Read Action from reader
    static Action readFrom(Stream reader) {
        int finishTick;
        finishTick = reader.readInt();
        model.ActionType actionType;
        actionType = readActionType(reader);
        return Action(finishTick, actionType);
    }

    /// Write Action to writer
    void writeTo(Stream writer) const {
        writer.write(finishTick);
        writer.write(cast(int)(actionType));
    }
}