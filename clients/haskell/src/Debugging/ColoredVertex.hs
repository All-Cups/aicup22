module Debugging.ColoredVertex where

import Prelude hiding (id)
import qualified Trans
import Trans (Trans)
import Debugging.Color (Color)
import Model.Vec2 (Vec2)

-- | Point + color
data ColoredVertex = ColoredVertex {
    -- | Position
    position :: Vec2,
    -- | Color
    color :: Color }
    deriving Show

instance Trans ColoredVertex where
    read = do
        position <- Trans.read
        color <- Trans.read
        return ColoredVertex {
            position,
            color }
    
    write ColoredVertex {
        position,
        color } = do
            Trans.write position
            Trans.write color