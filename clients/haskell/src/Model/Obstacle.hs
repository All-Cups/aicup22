module Model.Obstacle where

import Prelude hiding (id)
import qualified Trans
import Trans (Trans)
import Data.Int
import Model.Vec2 (Vec2)

-- | An obstacle on the map
data Obstacle = Obstacle {
    -- | Unique id
    id :: Int32,
    -- | Center position
    position :: Vec2,
    -- | Obstacle's radius
    radius :: Double,
    -- | Whether units can see through this obstacle, or it blocks the view
    canSeeThrough :: Bool,
    -- | Whether projectiles can go through this obstacle
    canShootThrough :: Bool }
    deriving Show

instance Trans Obstacle where
    read = do
        id <- Trans.read
        position <- Trans.read
        radius <- Trans.read
        canSeeThrough <- Trans.read
        canShootThrough <- Trans.read
        return Obstacle {
            id,
            position,
            radius,
            canSeeThrough,
            canShootThrough }
    
    write Obstacle {
        id,
        position,
        radius,
        canSeeThrough,
        canShootThrough } = do
            Trans.write id
            Trans.write position
            Trans.write radius
            Trans.write canSeeThrough
            Trans.write canShootThrough