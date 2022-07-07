from stream_wrapper import StreamWrapper

class ActionOrder:
    """Order to perform an action for unit"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "ActionOrder":
        """Read ActionOrder from input stream
        """
        tag = stream.read_int()
        if tag == Pickup.TAG:
            return ActionOrder.Pickup.read_from(stream)
        if tag == UseShieldPotion.TAG:
            return ActionOrder.UseShieldPotion.read_from(stream)
        if tag == DropShieldPotions.TAG:
            return ActionOrder.DropShieldPotions.read_from(stream)
        if tag == DropWeapon.TAG:
            return ActionOrder.DropWeapon.read_from(stream)
        if tag == DropAmmo.TAG:
            return ActionOrder.DropAmmo.read_from(stream)
        if tag == Aim.TAG:
            return ActionOrder.Aim.read_from(stream)
        raise Exception("Unexpected tag value")

class Pickup(ActionOrder):
    """Pick up loot"""

    TAG = 0

    __slots__ = ("loot",)

    loot: int

    def __init__(self, loot: int):
        self.loot = loot
        """Loot id"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Pickup":
        """Read Pickup from input stream
        """
        loot = stream.read_int()
        return Pickup(loot)
    
    def write_to(self, stream: StreamWrapper):
        """Write Pickup to output stream
        """
        stream.write_int(self.TAG)
        stream.write_int(self.loot)
    
    def __repr__(self):
        return "Pickup(" + \
            repr(self.loot) + \
            ")"

ActionOrder.Pickup = Pickup

class UseShieldPotion(ActionOrder):
    """Use shield potion"""

    TAG = 1

    __slots__ = ()


    def __init__(self):
        pass

    @staticmethod
    def read_from(stream: StreamWrapper) -> "UseShieldPotion":
        """Read UseShieldPotion from input stream
        """
        return UseShieldPotion()
    
    def write_to(self, stream: StreamWrapper):
        """Write UseShieldPotion to output stream
        """
        stream.write_int(self.TAG)
    
    def __repr__(self):
        return "UseShieldPotion(" + \
            ")"

ActionOrder.UseShieldPotion = UseShieldPotion

class DropShieldPotions(ActionOrder):
    """Drop shield potions on the ground"""

    TAG = 2

    __slots__ = ("amount",)

    amount: int

    def __init__(self, amount: int):
        self.amount = amount
        """Amount of potions"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "DropShieldPotions":
        """Read DropShieldPotions from input stream
        """
        amount = stream.read_int()
        return DropShieldPotions(amount)
    
    def write_to(self, stream: StreamWrapper):
        """Write DropShieldPotions to output stream
        """
        stream.write_int(self.TAG)
        stream.write_int(self.amount)
    
    def __repr__(self):
        return "DropShieldPotions(" + \
            repr(self.amount) + \
            ")"

ActionOrder.DropShieldPotions = DropShieldPotions

class DropWeapon(ActionOrder):
    """Drop current weapon"""

    TAG = 3

    __slots__ = ()


    def __init__(self):
        pass

    @staticmethod
    def read_from(stream: StreamWrapper) -> "DropWeapon":
        """Read DropWeapon from input stream
        """
        return DropWeapon()
    
    def write_to(self, stream: StreamWrapper):
        """Write DropWeapon to output stream
        """
        stream.write_int(self.TAG)
    
    def __repr__(self):
        return "DropWeapon(" + \
            ")"

ActionOrder.DropWeapon = DropWeapon

class DropAmmo(ActionOrder):
    """Drop ammo"""

    TAG = 4

    __slots__ = ("weapon_type_index","amount",)

    weapon_type_index: int
    amount: int

    def __init__(self, weapon_type_index: int, amount: int):
        self.weapon_type_index = weapon_type_index
        """Weapon type index (starting with 0)"""
        self.amount = amount
        """Amount of ammo"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "DropAmmo":
        """Read DropAmmo from input stream
        """
        weapon_type_index = stream.read_int()
        amount = stream.read_int()
        return DropAmmo(weapon_type_index, amount)
    
    def write_to(self, stream: StreamWrapper):
        """Write DropAmmo to output stream
        """
        stream.write_int(self.TAG)
        stream.write_int(self.weapon_type_index)
        stream.write_int(self.amount)
    
    def __repr__(self):
        return "DropAmmo(" + \
            repr(self.weapon_type_index) + \
            ", " + \
            repr(self.amount) + \
            ")"

ActionOrder.DropAmmo = DropAmmo

class Aim(ActionOrder):
    """Start/continue aiming"""

    TAG = 5

    __slots__ = ("shoot",)

    shoot: bool

    def __init__(self, shoot: bool):
        self.shoot = shoot
        """Shoot (only possible in full aim)"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Aim":
        """Read Aim from input stream
        """
        shoot = stream.read_bool()
        return Aim(shoot)
    
    def write_to(self, stream: StreamWrapper):
        """Write Aim to output stream
        """
        stream.write_int(self.TAG)
        stream.write_bool(self.shoot)
    
    def __repr__(self):
        return "Aim(" + \
            repr(self.shoot) + \
            ")"

ActionOrder.Aim = Aim