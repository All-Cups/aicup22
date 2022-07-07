package ai_cup_22;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import java.io.InputStream;
import java.util.Map;
import java.util.HashMap;
import java.io.BufferedOutputStream;

import ai_cup_22.util.StreamUtil;

public class Runner {
    private final InputStream inputStream;
    private final OutputStream outputStream;

    Runner(String host, int port, String token) throws IOException {
        Socket socket = new Socket(host, port);
        socket.setTcpNoDelay(true);
        inputStream = new BufferedInputStream(socket.getInputStream());
        outputStream = new BufferedOutputStream(socket.getOutputStream());
        StreamUtil.writeString(outputStream, token);
        StreamUtil.writeInt(outputStream, 1);
        StreamUtil.writeInt(outputStream, 0);
        StreamUtil.writeInt(outputStream, 1);
        outputStream.flush();
    }

    void run() throws IOException {
        MyStrategy myStrategy = null;
        DebugInterface debugInterface = new DebugInterface(inputStream, outputStream);
        while (true) {
            ai_cup_22.codegame.ServerMessage message = ai_cup_22.codegame.ServerMessage.readFrom(inputStream);
            if (message instanceof ai_cup_22.codegame.ServerMessage.UpdateConstants) {
                ai_cup_22.codegame.ServerMessage.UpdateConstants updateConstantsMessage = (ai_cup_22.codegame.ServerMessage.UpdateConstants) message;
                myStrategy = new MyStrategy(updateConstantsMessage.getConstants());
            } else if (message instanceof ai_cup_22.codegame.ServerMessage.GetOrder) {
                ai_cup_22.codegame.ServerMessage.GetOrder getOrderMessage = (ai_cup_22.codegame.ServerMessage.GetOrder) message;
                new ai_cup_22.codegame.ClientMessage.OrderMessage(myStrategy.getOrder(getOrderMessage.getPlayerView(), getOrderMessage.isDebugAvailable() ? debugInterface : null)).writeTo(outputStream);
                outputStream.flush();
            } else if (message instanceof ai_cup_22.codegame.ServerMessage.Finish) {
                myStrategy.finish();
                break;
            } else if (message instanceof ai_cup_22.codegame.ServerMessage.DebugUpdate) {
                ai_cup_22.codegame.ServerMessage.DebugUpdate debugUpdateMessage = (ai_cup_22.codegame.ServerMessage.DebugUpdate) message;
                myStrategy.debugUpdate(debugInterface);
                new ai_cup_22.codegame.ClientMessage.DebugUpdateDone().writeTo(outputStream);
                outputStream.flush();
            } else {
                throw new IOException("Unexpected server message");
            }
        }
    }

    public static void main(String[] args) throws IOException {
        String host = args.length < 1 ? "127.0.0.1" : args[0];
        int port = args.length < 2 ? 31001 : Integer.parseInt(args[1]);
        String token = args.length < 3 ? "0000000000000000" : args[2];
        new Runner(host, port, token).run();
    }
}