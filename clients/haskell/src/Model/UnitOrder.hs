module Model.UnitOrder where

import Prelude hiding (id)
import qualified Trans
import Trans (Trans)
import Model.ActionOrder (ActionOrder)
import Model.Vec2 (Vec2)

-- | Order for specific unit
data UnitOrder = UnitOrder {
    -- | Target moving velocity
    targetVelocity :: Vec2,
    -- | Target view direction (vector length doesn't matter)
    targetDirection :: Vec2,
    -- | Order to perform an action, or None
    action :: Maybe ActionOrder }
    deriving Show

instance Trans UnitOrder where
    read = do
        targetVelocity <- Trans.read
        targetDirection <- Trans.read
        action <- Trans.read
        return UnitOrder {
            targetVelocity,
            targetDirection,
            action }
    
    write UnitOrder {
        targetVelocity,
        targetDirection,
        action } = do
            Trans.write targetVelocity
            Trans.write targetDirection
            Trans.write action