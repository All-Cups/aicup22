{-# LANGUAGE OverloadedStrings #-}

import qualified Control.Exception as CE
import Control.Monad (when)
import Control.Monad.IO.Class (MonadIO (liftIO))
import Control.Monad.Trans.State.Lazy (State, StateT, get, put, runState, runStateT)
import Data.Binary (Binary)
import qualified Data.Binary as Binary
import qualified Data.Binary.Get as Binary
import qualified Data.Binary.Put as Binary
import qualified Data.ByteString as BS
import qualified Data.ByteString.Lazy as BSL
import Data.Int (Int32)
import Data.Maybe (fromJust)
import MyStrategy
import Network.Socket
import Network.Socket.ByteString.Lazy as SBS
import qualified System.Environment
import qualified Trans
import Codegame.ServerMessage
import Codegame.ClientMessage

data Args = Args
  { host :: String,
    port :: String,
    token :: String
  }
  deriving (Show)

parseArgs :: [String] -> Args
parseArgs [] = parseArgs ["127.0.0.1"]
parseArgs [host] = parseArgs [host, "31001"]
parseArgs [host, port] = parseArgs [host, port, "0000000000000000"]
parseArgs (host : port : token : _) = Args {host = host, port = port, token = token}

runTCPClient :: HostName -> ServiceName -> (Socket -> IO a) -> IO a
runTCPClient host port client = withSocketsDo $ do
  addr <- resolve
  CE.bracket (open addr) close client
  where
    resolve = do
      let hints = defaultHints {addrSocketType = Stream}
      head <$> getAddrInfo (Just hints) (Just host) (Just port)
    open addr = do
      sock <- socket (addrFamily addr) (addrSocketType addr) (addrProtocol addr)
      connect sock $ addrAddress addr
      return sock

main :: IO ()
main = do
  args <- System.Environment.getArgs
  let Args {host, port, token} = parseArgs args
  runTCPClient host port $ \socket -> do
    let message = do
          Trans.write token
          Trans.write (1 :: Int32)
          Trans.write (0 :: Int32)
          Trans.write (1 :: Int32)
    SBS.sendAll socket (Binary.runPut message)
    contents <- SBS.getContents socket
    let messages = getManyIncremental Trans.read contents :: [ServerMessage]
    mainLoop Nothing socket messages

mainLoop :: Maybe MyStrategy -> Socket -> [ServerMessage] -> IO ()
mainLoop _ _ [] = return ()
mainLoop strategy socket (message : nextMessages) = do
  (keepRunning, newStrategy) <- runStateT (handleMessage message socket) strategy
  when keepRunning $ mainLoop newStrategy socket nextMessages

handleMessage :: ServerMessage -> Socket -> StateT (Maybe MyStrategy) IO Bool
handleMessage (UpdateConstants ServerMessageUpdateConstants {constants}) _ = do
  put $ Just (createMyStrategy constants)
  return True
handleMessage (GetOrder ServerMessageGetOrder {playerView}) socket = do
  order <- updateStrategy (getOrder playerView)
  let message = OrderMessage ClientMessageOrderMessage {order = order}
  liftIO $ sendMessage message socket
  return True
handleMessage (Finish ServerMessageFinish) _ = do
  return False
handleMessage (DebugUpdate ServerMessageDebugUpdate {}) socket = do
  liftIO $ sendMessage (DebugUpdateDone ClientMessageDebugUpdateDone {}) socket
  return True

sendMessage :: ClientMessage -> Socket -> IO ()
sendMessage message socket = SBS.sendAll socket $ Binary.runPut $ Trans.write message

updateStrategy :: State s a -> StateT (Maybe s) IO a
updateStrategy state = do
  strategy <- get
  let (message, newStrategy) = runState state (fromJust strategy)
  put (Just newStrategy)
  return message

getManyIncremental :: Binary.Get a -> BSL.ByteString -> [a]
getManyIncremental get = go getOne . BSL.toChunks
  where
    getOne = Binary.runGetIncremental get

    go (Binary.Fail _leftover _bytesRead err) _ = error err
    go (Binary.Done leftover _bytesRead x) chunks =
      let xs
            | null chunks && BS.null leftover = []
            | BS.null leftover = go getOne chunks
            | otherwise = go getOne (leftover : chunks)
       in x : xs
    go decoder [] = go (Binary.pushEndOfInput decoder) []
    go decoder (chunk : chunks) = go (decoder `Binary.pushChunk` chunk) chunks