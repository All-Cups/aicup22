module Debugging.DebugCommand where

import Prelude hiding (id)
import qualified Trans
import Trans (Trans)
import Data.Int
import Debugging.DebugData (DebugData)

-- | Add debug data to current tick
data DebugCommandAdd = DebugCommandAdd {
    -- | Data to add
    debugData :: DebugData }
    deriving Show

instance Trans DebugCommandAdd where
    read = do
        debugData <- Trans.read
        return DebugCommandAdd {
            debugData }
    
    write DebugCommandAdd {
        debugData } = do
            Trans.write debugData

-- | Clear current tick's debug data
data DebugCommandClear = DebugCommandClear { }
    deriving Show

instance Trans DebugCommandClear where
    read = do
        return DebugCommandClear { }
    
    write DebugCommandClear { } = do
            return ()

-- | Enable/disable auto performing of commands
data DebugCommandSetAutoFlush = DebugCommandSetAutoFlush {
    -- | Enable/disable autoflush
    enable :: Bool }
    deriving Show

instance Trans DebugCommandSetAutoFlush where
    read = do
        enable <- Trans.read
        return DebugCommandSetAutoFlush {
            enable }
    
    write DebugCommandSetAutoFlush {
        enable } = do
            Trans.write enable

-- | Perform all previously sent commands
data DebugCommandFlush = DebugCommandFlush { }
    deriving Show

instance Trans DebugCommandFlush where
    read = do
        return DebugCommandFlush { }
    
    write DebugCommandFlush { } = do
            return ()

-- | Debug commands that can be sent while debugging with the app
data DebugCommand
    -- | Add debug data to current tick
    = Add DebugCommandAdd
    -- | Clear current tick's debug data
    | Clear DebugCommandClear
    -- | Enable/disable auto performing of commands
    | SetAutoFlush DebugCommandSetAutoFlush
    -- | Perform all previously sent commands
    | Flush DebugCommandFlush
    deriving Show

instance Trans DebugCommand where
    read = do
        tag :: Int32 <- Trans.read
        case tag of
            0 -> Add <$> Trans.read
            1 -> Clear <$> Trans.read
            2 -> SetAutoFlush <$> Trans.read
            3 -> Flush <$> Trans.read
    
    write (Add value) = do
        Trans.write (0 :: Int32)
        Trans.write value
    write (Clear value) = do
        Trans.write (1 :: Int32)
        Trans.write value
    write (SetAutoFlush value) = do
        Trans.write (2 :: Int32)
        Trans.write value
    write (Flush value) = do
        Trans.write (3 :: Int32)
        Trans.write value