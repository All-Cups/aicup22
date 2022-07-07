using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.IO;
using System.Net.Sockets;
using System.Text;

namespace AiCup22
{
    public class Runner
    {
        private BinaryReader reader;
        private BinaryWriter writer;
        public Runner(string host, int port, string token)
        {
            var client = new TcpClient(host, port) { NoDelay = true };
            var stream = new BufferedStream(client.GetStream());
            reader = new BinaryReader(stream);
            writer = new BinaryWriter(stream);
            var tokenData = System.Text.Encoding.UTF8.GetBytes(token);
            writer.Write(tokenData.Length);
            writer.Write(tokenData);
            writer.Write((int) 1);
            writer.Write((int) 0);
            writer.Write((int) 1);
            writer.Flush();
        }
        public void Run()
        {
            MyStrategy myStrategy = null;
            var debugInterface = new DebugInterface(reader, writer);
            var running = true;
            while (running)
            {
                switch (AiCup22.Codegame.ServerMessage.ReadFrom(reader))
                {
                    case AiCup22.Codegame.ServerMessage.UpdateConstants message:
                        myStrategy = new MyStrategy(message.Constants);
                        break;
                    case AiCup22.Codegame.ServerMessage.GetOrder message:
                        new AiCup22.Codegame.ClientMessage.OrderMessage(myStrategy.GetOrder(message.PlayerView, message.DebugAvailable ? debugInterface : null)).WriteTo(writer);
                        writer.Flush();
                        break;
                    case AiCup22.Codegame.ServerMessage.Finish message:
                        running = false;
                        myStrategy.Finish();
                        break;
                    case AiCup22.Codegame.ServerMessage.DebugUpdate message:
                        myStrategy.DebugUpdate(debugInterface);
                        new AiCup22.Codegame.ClientMessage.DebugUpdateDone().WriteTo(writer);
                        writer.Flush();
                        break;
                    default:
                        throw new Exception("Unexpected server message");
                }
            }
        }
        public static void Main(string[] args)
        {
            string host = args.Length < 1 ? "127.0.0.1" : args[0];
            int port = args.Length < 2 ? 31001 : int.Parse(args[1]);
            string token = args.Length < 3 ? "0000000000000000" : args[2];
            new Runner(host, port, token).Run();
        }
    }
}