from enum import IntEnum

class ActionType(IntEnum):
    """Type of action a unit is currently performing"""

    LOOTING = 0
    """Picking up or dropping loot"""
    USE_SHIELD_POTION = 1
    """Using a shield potion"""

    def __repr__(self):
        return str(self)