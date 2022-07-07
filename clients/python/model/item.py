from stream_wrapper import StreamWrapper

class Item:
    """Lootable item"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Item":
        """Read Item from input stream
        """
        tag = stream.read_int()
        if tag == Weapon.TAG:
            return Item.Weapon.read_from(stream)
        if tag == ShieldPotions.TAG:
            return Item.ShieldPotions.read_from(stream)
        if tag == Ammo.TAG:
            return Item.Ammo.read_from(stream)
        raise Exception("Unexpected tag value")

class Weapon(Item):
    """Weapon"""

    TAG = 0

    __slots__ = ("type_index",)

    type_index: int

    def __init__(self, type_index: int):
        self.type_index = type_index
        """Weapon type index (starting with 0)"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Weapon":
        """Read Weapon from input stream
        """
        type_index = stream.read_int()
        return Weapon(type_index)
    
    def write_to(self, stream: StreamWrapper):
        """Write Weapon to output stream
        """
        stream.write_int(self.TAG)
        stream.write_int(self.type_index)
    
    def __repr__(self):
        return "Weapon(" + \
            repr(self.type_index) + \
            ")"

Item.Weapon = Weapon

class ShieldPotions(Item):
    """Shield potions"""

    TAG = 1

    __slots__ = ("amount",)

    amount: int

    def __init__(self, amount: int):
        self.amount = amount
        """Amount of potions"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "ShieldPotions":
        """Read ShieldPotions from input stream
        """
        amount = stream.read_int()
        return ShieldPotions(amount)
    
    def write_to(self, stream: StreamWrapper):
        """Write ShieldPotions to output stream
        """
        stream.write_int(self.TAG)
        stream.write_int(self.amount)
    
    def __repr__(self):
        return "ShieldPotions(" + \
            repr(self.amount) + \
            ")"

Item.ShieldPotions = ShieldPotions

class Ammo(Item):
    """Ammo"""

    TAG = 2

    __slots__ = ("weapon_type_index","amount",)

    weapon_type_index: int
    amount: int

    def __init__(self, weapon_type_index: int, amount: int):
        self.weapon_type_index = weapon_type_index
        """Weapon type index (starting with 0)"""
        self.amount = amount
        """Amount of ammo"""

    @staticmethod
    def read_from(stream: StreamWrapper) -> "Ammo":
        """Read Ammo from input stream
        """
        weapon_type_index = stream.read_int()
        amount = stream.read_int()
        return Ammo(weapon_type_index, amount)
    
    def write_to(self, stream: StreamWrapper):
        """Write Ammo to output stream
        """
        stream.write_int(self.TAG)
        stream.write_int(self.weapon_type_index)
        stream.write_int(self.amount)
    
    def __repr__(self):
        return "Ammo(" + \
            repr(self.weapon_type_index) + \
            ", " + \
            repr(self.amount) + \
            ")"

Item.Ammo = Ammo