module Debugging.DebugState where

import Prelude hiding (id)
import qualified Trans
import Trans (Trans)
import Data.Int
import Debugging.Camera (Camera)
import Model.Vec2 (Vec2)

-- | Renderer's state
data DebugState = DebugState {
    -- | Pressed keys
    pressedKeys :: [String],
    -- | Cursor's position in game coordinates
    cursorWorldPosition :: Vec2,
    -- | Id of unit which is followed by the camera, or None
    lockedUnit :: Maybe Int32,
    -- | Current camera state
    camera :: Camera }
    deriving Show

instance Trans DebugState where
    read = do
        pressedKeys <- Trans.read
        cursorWorldPosition <- Trans.read
        lockedUnit <- Trans.read
        camera <- Trans.read
        return DebugState {
            pressedKeys,
            cursorWorldPosition,
            lockedUnit,
            camera }
    
    write DebugState {
        pressedKeys,
        cursorWorldPosition,
        lockedUnit,
        camera } = do
            Trans.write pressedKeys
            Trans.write cursorWorldPosition
            Trans.write lockedUnit
            Trans.write camera