import java.io.BufferedInputStream
import java.io.BufferedOutputStream
import java.io.IOException
import java.io.InputStream
import java.io.OutputStream
import java.net.Socket
import ai_cup_22.util.StreamUtil

fun main(args: Array<String>) {
    val host = if (args.size < 1) "127.0.0.1" else args[0]
    val port = if (args.size < 2) 31001 else Integer.parseInt(args[1])
    val token = if (args.size < 3) "0000000000000000" else args[2]
    
    val socket = Socket(host, port)
    socket.tcpNoDelay = true
    val inputStream = BufferedInputStream(socket.getInputStream())
    val outputStream = BufferedOutputStream(socket.getOutputStream())
    StreamUtil.writeString(outputStream, token)
    StreamUtil.writeInt(outputStream, 1)
    StreamUtil.writeInt(outputStream, 1)
    StreamUtil.writeInt(outputStream, 0)
    outputStream.flush()
    
    var myStrategy: MyStrategy? = null
    val debugInterface = DebugInterface(inputStream, outputStream)
    while (true) {
        val message = ai_cup_22.codegame.ServerMessage.readFrom(inputStream)
        if (message is ai_cup_22.codegame.ServerMessage.UpdateConstants) {
            myStrategy = MyStrategy(message.constants)
        } else if (message is ai_cup_22.codegame.ServerMessage.GetOrder) {
            ai_cup_22.codegame.ClientMessage.OrderMessage(myStrategy!!.getOrder(message.playerView, if (message.debugAvailable) debugInterface else null)).writeTo(outputStream)
            outputStream.flush()
        } else if (message is ai_cup_22.codegame.ServerMessage.Finish) {
            myStrategy!!.finish()
            break
        } else if (message is ai_cup_22.codegame.ServerMessage.DebugUpdate) {
            myStrategy!!.debugUpdate(message.displayedTick, debugInterface)
            ai_cup_22.codegame.ClientMessage.DebugUpdateDone().writeTo(outputStream)
            outputStream.flush()
        } else {
            throw java.io.IOException("Unexpected server message")
        }
    }
}