module Model.Vec2 where

import Prelude hiding (id)
import qualified Trans
import Trans (Trans)


-- | 2 dimensional vector.
data Vec2 = Vec2 {
    -- | `x` coordinate of the vector
    x :: Double,
    -- | `y` coordinate of the vector
    y :: Double }
    deriving Show

instance Trans Vec2 where
    read = do
        x <- Trans.read
        y <- Trans.read
        return Vec2 {
            x,
            y }
    
    write Vec2 {
        x,
        y } = do
            Trans.write x
            Trans.write y