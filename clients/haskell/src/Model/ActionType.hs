module Model.ActionType where

import Prelude hiding (id)
import qualified Trans
import Trans (Trans)
import Data.Int

-- | Type of action a unit is currently performing
data ActionType
    -- | Picking up or dropping loot
    = Looting
    -- | Using a shield potion
    | UseShieldPotion
    deriving (Eq, Ord, Show)

instance Trans ActionType where
    read = do
        tag :: Int32 <- Trans.read
        return $ case tag of
            0 -> Looting
            1 -> UseShieldPotion
            
    write Looting =
        Trans.write (0 :: Int32)
    write UseShieldPotion =
        Trans.write (1 :: Int32)