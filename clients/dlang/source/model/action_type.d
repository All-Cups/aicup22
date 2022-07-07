module model.action_type;

import stream;

/// Type of action a unit is currently performing
enum ActionType : int {
    /// Picking up or dropping loot
    Looting = 0,
    /// Using a shield potion
    UseShieldPotion = 1,
}

/// Read ActionType from reader
ActionType readActionType(Stream reader) {
    switch (reader.readInt()) {
        case ActionType.Looting:
            return ActionType.Looting;
        case ActionType.UseShieldPotion:
            return ActionType.UseShieldPotion;
        default:
            throw new Exception("Unexpected tag value");
    }
}