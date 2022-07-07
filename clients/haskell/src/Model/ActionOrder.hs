module Model.ActionOrder where

import Prelude hiding (id)
import qualified Trans
import Trans (Trans)
import Data.Int

-- | Pick up loot
data ActionOrderPickup = ActionOrderPickup {
    -- | Loot id
    loot :: Int32 }
    deriving Show

instance Trans ActionOrderPickup where
    read = do
        loot <- Trans.read
        return ActionOrderPickup {
            loot }
    
    write ActionOrderPickup {
        loot } = do
            Trans.write loot

-- | Use shield potion
data ActionOrderUseShieldPotion = ActionOrderUseShieldPotion { }
    deriving Show

instance Trans ActionOrderUseShieldPotion where
    read = do
        return ActionOrderUseShieldPotion { }
    
    write ActionOrderUseShieldPotion { } = do
            return ()

-- | Drop shield potions on the ground
data ActionOrderDropShieldPotions = ActionOrderDropShieldPotions {
    -- | Amount of potions
    amount :: Int32 }
    deriving Show

instance Trans ActionOrderDropShieldPotions where
    read = do
        amount <- Trans.read
        return ActionOrderDropShieldPotions {
            amount }
    
    write ActionOrderDropShieldPotions {
        amount } = do
            Trans.write amount

-- | Drop current weapon
data ActionOrderDropWeapon = ActionOrderDropWeapon { }
    deriving Show

instance Trans ActionOrderDropWeapon where
    read = do
        return ActionOrderDropWeapon { }
    
    write ActionOrderDropWeapon { } = do
            return ()

-- | Drop ammo
data ActionOrderDropAmmo = ActionOrderDropAmmo {
    -- | Weapon type index (starting with 0)
    weaponTypeIndex :: Int32,
    -- | Amount of ammo
    amount :: Int32 }
    deriving Show

instance Trans ActionOrderDropAmmo where
    read = do
        weaponTypeIndex <- Trans.read
        amount <- Trans.read
        return ActionOrderDropAmmo {
            weaponTypeIndex,
            amount }
    
    write ActionOrderDropAmmo {
        weaponTypeIndex,
        amount } = do
            Trans.write weaponTypeIndex
            Trans.write amount

-- | Start/continue aiming
data ActionOrderAim = ActionOrderAim {
    -- | Shoot (only possible in full aim)
    shoot :: Bool }
    deriving Show

instance Trans ActionOrderAim where
    read = do
        shoot <- Trans.read
        return ActionOrderAim {
            shoot }
    
    write ActionOrderAim {
        shoot } = do
            Trans.write shoot

-- | Order to perform an action for unit
data ActionOrder
    -- | Pick up loot
    = Pickup ActionOrderPickup
    -- | Use shield potion
    | UseShieldPotion ActionOrderUseShieldPotion
    -- | Drop shield potions on the ground
    | DropShieldPotions ActionOrderDropShieldPotions
    -- | Drop current weapon
    | DropWeapon ActionOrderDropWeapon
    -- | Drop ammo
    | DropAmmo ActionOrderDropAmmo
    -- | Start/continue aiming
    | Aim ActionOrderAim
    deriving Show

instance Trans ActionOrder where
    read = do
        tag :: Int32 <- Trans.read
        case tag of
            0 -> Pickup <$> Trans.read
            1 -> UseShieldPotion <$> Trans.read
            2 -> DropShieldPotions <$> Trans.read
            3 -> DropWeapon <$> Trans.read
            4 -> DropAmmo <$> Trans.read
            5 -> Aim <$> Trans.read
    
    write (Pickup value) = do
        Trans.write (0 :: Int32)
        Trans.write value
    write (UseShieldPotion value) = do
        Trans.write (1 :: Int32)
        Trans.write value
    write (DropShieldPotions value) = do
        Trans.write (2 :: Int32)
        Trans.write value
    write (DropWeapon value) = do
        Trans.write (3 :: Int32)
        Trans.write value
    write (DropAmmo value) = do
        Trans.write (4 :: Int32)
        Trans.write value
    write (Aim value) = do
        Trans.write (5 :: Int32)
        Trans.write value