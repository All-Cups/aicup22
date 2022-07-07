module Model.Sound where

import Prelude hiding (id)
import qualified Trans
import Trans (Trans)
import Data.Int
import Model.Vec2 (Vec2)

-- | Sound heard by one of your units
data Sound = Sound {
    -- | Sound type index (starting with 0)
    typeIndex :: Int32,
    -- | Id of unit that heard this sound
    unitId :: Int32,
    -- | Position where sound was heard (different from sound source position)
    position :: Vec2 }
    deriving Show

instance Trans Sound where
    read = do
        typeIndex <- Trans.read
        unitId <- Trans.read
        position <- Trans.read
        return Sound {
            typeIndex,
            unitId,
            position }
    
    write Sound {
        typeIndex,
        unitId,
        position } = do
            Trans.write typeIndex
            Trans.write unitId
            Trans.write position