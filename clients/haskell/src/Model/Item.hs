module Model.Item where

import Prelude hiding (id)
import qualified Trans
import Trans (Trans)
import Data.Int

-- | Weapon
data ItemWeapon = ItemWeapon {
    -- | Weapon type index (starting with 0)
    typeIndex :: Int32 }
    deriving Show

instance Trans ItemWeapon where
    read = do
        typeIndex <- Trans.read
        return ItemWeapon {
            typeIndex }
    
    write ItemWeapon {
        typeIndex } = do
            Trans.write typeIndex

-- | Shield potions
data ItemShieldPotions = ItemShieldPotions {
    -- | Amount of potions
    amount :: Int32 }
    deriving Show

instance Trans ItemShieldPotions where
    read = do
        amount <- Trans.read
        return ItemShieldPotions {
            amount }
    
    write ItemShieldPotions {
        amount } = do
            Trans.write amount

-- | Ammo
data ItemAmmo = ItemAmmo {
    -- | Weapon type index (starting with 0)
    weaponTypeIndex :: Int32,
    -- | Amount of ammo
    amount :: Int32 }
    deriving Show

instance Trans ItemAmmo where
    read = do
        weaponTypeIndex <- Trans.read
        amount <- Trans.read
        return ItemAmmo {
            weaponTypeIndex,
            amount }
    
    write ItemAmmo {
        weaponTypeIndex,
        amount } = do
            Trans.write weaponTypeIndex
            Trans.write amount

-- | Lootable item
data Item
    -- | Weapon
    = Weapon ItemWeapon
    -- | Shield potions
    | ShieldPotions ItemShieldPotions
    -- | Ammo
    | Ammo ItemAmmo
    deriving Show

instance Trans Item where
    read = do
        tag :: Int32 <- Trans.read
        case tag of
            0 -> Weapon <$> Trans.read
            1 -> ShieldPotions <$> Trans.read
            2 -> Ammo <$> Trans.read
    
    write (Weapon value) = do
        Trans.write (0 :: Int32)
        Trans.write value
    write (ShieldPotions value) = do
        Trans.write (1 :: Int32)
        Trans.write value
    write (Ammo value) = do
        Trans.write (2 :: Int32)
        Trans.write value