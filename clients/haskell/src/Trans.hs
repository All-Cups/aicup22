module Trans where

import           Control.Monad        (replicateM)
import qualified Data.Binary          as Bin
import qualified Data.Binary.Get      as Bin.Get
import qualified Data.Binary.Put      as Bin.Put
import qualified Data.ByteString.Lazy as BL
import           Data.Int             (Int32, Int64)
import           Data.Map.Strict      (Map, fromList, toList)
import           Data.Maybe           (Maybe (Just))
import           Data.Text            (Text, pack, unpack)
import           Data.Text.Encoding   (decodeUtf8, encodeUtf8)
import qualified GHC.Generics         as G
import Prelude hiding (read, write)

class Trans a where
    write :: a -> Bin.Put
    read :: Bin.Get a

instance Trans Bool where
    write = Bin.put
    read = Bin.get

instance Trans Int where
    write = write . (fromIntegral :: Int -> Int32)
    read = (fromIntegral :: Int32 -> Int) <$> read

instance Trans Int32 where
    write = Bin.Put.putInt32le
    read = Bin.Get.getInt32le

instance Trans Int64 where
    write = Bin.Put.putInt64le
    read = Bin.Get.getInt64le

instance Trans Float where
    write = Bin.Put.putFloatle
    read = Bin.Get.getFloatle

instance Trans Double where
    write = Bin.Put.putDoublele
    read = Bin.Get.getDoublele

instance Trans Text where
    write text = do
        let raw = encodeUtf8 text
        write . (fromIntegral :: Int64 -> Int32) . BL.length . BL.fromStrict $ raw
        Bin.Put.putByteString raw
    read = do
        len <- read
        decodeUtf8 <$> Bin.Get.getByteString len

instance {-# OVERLAPPING #-} Trans String where
    write = write . pack
    read = unpack <$> read

instance (Trans a) => Trans [a] where
    write val = do
        write (length val)
        mconcat (map write val)
    read = do
        len <- read
        replicateM len read

instance Trans a => Trans (Maybe a) where
    write Nothing  = write False
    write (Just x) = write True <> write x
    read = do
        is_some <- read :: Bin.Get Bool
        if is_some then
            Just <$> read
        else
            return Nothing
            
instance (Trans a, Trans b) => Trans (a, b) where
    write (x, y) = write x <> write y
    read = do
        x <- read
        y <- read
        return (x, y)

instance (Trans k, Ord k, Trans v) => Trans (Map k v) where
    write val = write $ toList val
    read = fromList <$> read