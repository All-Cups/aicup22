module Debugging.Camera where

import Prelude hiding (id)
import qualified Trans
import Trans (Trans)
import Model.Vec2 (Vec2)

-- | Camera state
data Camera = Camera {
    -- | Center
    center :: Vec2,
    -- | Rotation
    rotation :: Double,
    -- | Attack angle
    attack :: Double,
    -- | Vertical field of view
    fov :: Double }
    deriving Show

instance Trans Camera where
    read = do
        center <- Trans.read
        rotation <- Trans.read
        attack <- Trans.read
        fov <- Trans.read
        return Camera {
            center,
            rotation,
            attack,
            fov }
    
    write Camera {
        center,
        rotation,
        attack,
        fov } = do
            Trans.write center
            Trans.write rotation
            Trans.write attack
            Trans.write fov