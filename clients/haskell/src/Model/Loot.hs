module Model.Loot where

import Prelude hiding (id)
import qualified Trans
import Trans (Trans)
import Data.Int
import Model.Item (Item)
import Model.Vec2 (Vec2)

-- | Loot lying on the ground
data Loot = Loot {
    -- | Unique id
    id :: Int32,
    -- | Position
    position :: Vec2,
    -- | Item
    item :: Item }
    deriving Show

instance Trans Loot where
    read = do
        id <- Trans.read
        position <- Trans.read
        item <- Trans.read
        return Loot {
            id,
            position,
            item }
    
    write Loot {
        id,
        position,
        item } = do
            Trans.write id
            Trans.write position
            Trans.write item