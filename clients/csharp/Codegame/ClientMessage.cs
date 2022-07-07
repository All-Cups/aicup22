namespace AiCup22.Codegame
{
    /// <summary>
    /// Message sent from client
    /// </summary>
    public abstract class ClientMessage
    {
        /// <summary> Write ClientMessage to writer </summary>
        public abstract void WriteTo(System.IO.BinaryWriter writer);

        /// <summary> Read ClientMessage from reader </summary>
        public static ClientMessage ReadFrom(System.IO.BinaryReader reader)
        {
            switch (reader.ReadInt32())
            {
                case DebugMessage.TAG:
                    return DebugMessage.ReadFrom(reader);
                case OrderMessage.TAG:
                    return OrderMessage.ReadFrom(reader);
                case DebugUpdateDone.TAG:
                    return DebugUpdateDone.ReadFrom(reader);
                case RequestDebugState.TAG:
                    return RequestDebugState.ReadFrom(reader);
                default:
                    throw new System.Exception("Unexpected tag value");
            }
        }

        /// <summary>
        /// Ask app to perform new debug command
        /// </summary>
        public class DebugMessage : ClientMessage
        {
            public const int TAG = 0;
        
            /// <summary>
            /// Command to perform
            /// </summary>
            public AiCup22.Debugging.DebugCommand Command { get; set; }
        
            public DebugMessage() { }
        
            public DebugMessage(AiCup22.Debugging.DebugCommand command)
            {
                this.Command = command;
            }
        
            /// <summary> Read DebugMessage from reader </summary>
            public static new DebugMessage ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new DebugMessage();
                result.Command = AiCup22.Debugging.DebugCommand.ReadFrom(reader);
                return result;
            }
        
            /// <summary> Write DebugMessage to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
                Command.WriteTo(writer);
            }
        
            /// <summary> Get string representation of DebugMessage </summary>
            public override string ToString() {
                string stringResult = "DebugMessage { ";
                stringResult += "Command: ";
                stringResult += Command.ToString();
                stringResult += " }";
                return stringResult;
            }
        }

        /// <summary>
        /// Reply for ServerMessage::GetOrder
        /// </summary>
        public class OrderMessage : ClientMessage
        {
            public const int TAG = 1;
        
            /// <summary>
            /// Player's order
            /// </summary>
            public AiCup22.Model.Order Order { get; set; }
        
            public OrderMessage() { }
        
            public OrderMessage(AiCup22.Model.Order order)
            {
                this.Order = order;
            }
        
            /// <summary> Read OrderMessage from reader </summary>
            public static new OrderMessage ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new OrderMessage();
                result.Order = AiCup22.Model.Order.ReadFrom(reader);
                return result;
            }
        
            /// <summary> Write OrderMessage to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
                Order.WriteTo(writer);
            }
        
            /// <summary> Get string representation of OrderMessage </summary>
            public override string ToString() {
                string stringResult = "OrderMessage { ";
                stringResult += "Order: ";
                stringResult += Order.ToString();
                stringResult += " }";
                return stringResult;
            }
        }

        /// <summary>
        /// Signifies finish of the debug update
        /// </summary>
        public class DebugUpdateDone : ClientMessage
        {
            public const int TAG = 2;
        
        
            public DebugUpdateDone() { }
        
            /// <summary> Read DebugUpdateDone from reader </summary>
            public static new DebugUpdateDone ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new DebugUpdateDone();
                return result;
            }
        
            /// <summary> Write DebugUpdateDone to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
            }
        
            /// <summary> Get string representation of DebugUpdateDone </summary>
            public override string ToString() {
                string stringResult = "DebugUpdateDone { ";
                stringResult += " }";
                return stringResult;
            }
        }

        /// <summary>
        /// Request debug state from the app
        /// </summary>
        public class RequestDebugState : ClientMessage
        {
            public const int TAG = 3;
        
        
            public RequestDebugState() { }
        
            /// <summary> Read RequestDebugState from reader </summary>
            public static new RequestDebugState ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new RequestDebugState();
                return result;
            }
        
            /// <summary> Write RequestDebugState to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
            }
        
            /// <summary> Get string representation of RequestDebugState </summary>
            public override string ToString() {
                string stringResult = "RequestDebugState { ";
                stringResult += " }";
                return stringResult;
            }
        }
    }
}