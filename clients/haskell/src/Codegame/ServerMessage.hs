module Codegame.ServerMessage where

import Prelude hiding (id)
import qualified Trans
import Trans (Trans)
import Data.Int
import Model.Constants (Constants)
import Model.Game (Game)

-- | Update constants
data ServerMessageUpdateConstants = ServerMessageUpdateConstants {
    -- | New constants
    constants :: Constants }
    deriving Show

instance Trans ServerMessageUpdateConstants where
    read = do
        constants <- Trans.read
        return ServerMessageUpdateConstants {
            constants }
    
    write ServerMessageUpdateConstants {
        constants } = do
            Trans.write constants

-- | Get order for next tick
data ServerMessageGetOrder = ServerMessageGetOrder {
    -- | Player's view
    playerView :: Game,
    -- | Whether app is running with debug interface available
    debugAvailable :: Bool }
    deriving Show

instance Trans ServerMessageGetOrder where
    read = do
        playerView <- Trans.read
        debugAvailable <- Trans.read
        return ServerMessageGetOrder {
            playerView,
            debugAvailable }
    
    write ServerMessageGetOrder {
        playerView,
        debugAvailable } = do
            Trans.write playerView
            Trans.write debugAvailable

-- | Signifies end of the game
data ServerMessageFinish = ServerMessageFinish { }
    deriving Show

instance Trans ServerMessageFinish where
    read = do
        return ServerMessageFinish { }
    
    write ServerMessageFinish { } = do
            return ()

-- | Debug update
data ServerMessageDebugUpdate = ServerMessageDebugUpdate {
    -- | Displayed tick
    displayedTick :: Int32 }
    deriving Show

instance Trans ServerMessageDebugUpdate where
    read = do
        displayedTick <- Trans.read
        return ServerMessageDebugUpdate {
            displayedTick }
    
    write ServerMessageDebugUpdate {
        displayedTick } = do
            Trans.write displayedTick

-- | Message sent from server
data ServerMessage
    -- | Update constants
    = UpdateConstants ServerMessageUpdateConstants
    -- | Get order for next tick
    | GetOrder ServerMessageGetOrder
    -- | Signifies end of the game
    | Finish ServerMessageFinish
    -- | Debug update
    | DebugUpdate ServerMessageDebugUpdate
    deriving Show

instance Trans ServerMessage where
    read = do
        tag :: Int32 <- Trans.read
        case tag of
            0 -> UpdateConstants <$> Trans.read
            1 -> GetOrder <$> Trans.read
            2 -> Finish <$> Trans.read
            3 -> DebugUpdate <$> Trans.read
    
    write (UpdateConstants value) = do
        Trans.write (0 :: Int32)
        Trans.write value
    write (GetOrder value) = do
        Trans.write (1 :: Int32)
        Trans.write value
    write (Finish value) = do
        Trans.write (2 :: Int32)
        Trans.write value
    write (DebugUpdate value) = do
        Trans.write (3 :: Int32)
        Trans.write value