import java.io.{BufferedInputStream, BufferedOutputStream}
import java.net.Socket

import ai_cup_22.util.StreamUtil

object Runner {
  def main(args: Array[String]) = {
    val host = if (args.length < 1) "127.0.0.1" else args(0)
    val port = if (args.length < 2) 31001 else args(1).toInt
    val token = if (args.length < 3) "0000000000000000" else args(2)
    run(host, port, token)
  }

  def run(host: String, port: Int, token: String): scala.Unit = {
    val socket = new Socket(host, port)
    socket.setTcpNoDelay(true)
    val inputStream = new BufferedInputStream(socket.getInputStream)
    val outputStream = new BufferedOutputStream(socket.getOutputStream)

    StreamUtil.writeString(outputStream, token)
    StreamUtil.writeInt(outputStream, 1)
    StreamUtil.writeInt(outputStream, 1)
    StreamUtil.writeInt(outputStream, 0)
    outputStream.flush()

    var myStrategy: Option[MyStrategy] = None
    val debugInterface = new DebugInterface(inputStream, outputStream)
    while (true) {
      ai_cup_22.codegame.ServerMessage.readFrom(inputStream) match {
        case ai_cup_22.codegame.ServerMessage.UpdateConstants(constants) =>
          myStrategy = Some(new MyStrategy(constants))
        case ai_cup_22.codegame.ServerMessage.GetOrder(playerView, debugAvailable) =>
          ai_cup_22.codegame.ClientMessage.OrderMessage(myStrategy.get.getOrder(playerView, if (debugAvailable) Some(debugInterface) else None)).writeTo(outputStream)
          outputStream.flush()
        case ai_cup_22.codegame.ServerMessage.Finish() =>
          myStrategy.get.finish()
          return
        case ai_cup_22.codegame.ServerMessage.DebugUpdate(displayedTick) =>
          myStrategy.get.debugUpdate(displayedTick, debugInterface)
          ai_cup_22.codegame.ClientMessage.DebugUpdateDone().writeTo(outputStream)
          outputStream.flush()
      }
    }
  }
}