module Model.Zone where

import Prelude hiding (id)
import qualified Trans
import Trans (Trans)
import Model.Vec2 (Vec2)

-- | Current state of the game zone
data Zone = Zone {
    -- | Current center
    currentCenter :: Vec2,
    -- | Current radius
    currentRadius :: Double,
    -- | Next center
    nextCenter :: Vec2,
    -- | Next radius
    nextRadius :: Double }
    deriving Show

instance Trans Zone where
    read = do
        currentCenter <- Trans.read
        currentRadius <- Trans.read
        nextCenter <- Trans.read
        nextRadius <- Trans.read
        return Zone {
            currentCenter,
            currentRadius,
            nextCenter,
            nextRadius }
    
    write Zone {
        currentCenter,
        currentRadius,
        nextCenter,
        nextRadius } = do
            Trans.write currentCenter
            Trans.write currentRadius
            Trans.write nextCenter
            Trans.write nextRadius