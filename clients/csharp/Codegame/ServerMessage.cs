namespace AiCup22.Codegame
{
    /// <summary>
    /// Message sent from server
    /// </summary>
    public abstract class ServerMessage
    {
        /// <summary> Write ServerMessage to writer </summary>
        public abstract void WriteTo(System.IO.BinaryWriter writer);

        /// <summary> Read ServerMessage from reader </summary>
        public static ServerMessage ReadFrom(System.IO.BinaryReader reader)
        {
            switch (reader.ReadInt32())
            {
                case UpdateConstants.TAG:
                    return UpdateConstants.ReadFrom(reader);
                case GetOrder.TAG:
                    return GetOrder.ReadFrom(reader);
                case Finish.TAG:
                    return Finish.ReadFrom(reader);
                case DebugUpdate.TAG:
                    return DebugUpdate.ReadFrom(reader);
                default:
                    throw new System.Exception("Unexpected tag value");
            }
        }

        /// <summary>
        /// Update constants
        /// </summary>
        public class UpdateConstants : ServerMessage
        {
            public const int TAG = 0;
        
            /// <summary>
            /// New constants
            /// </summary>
            public AiCup22.Model.Constants Constants { get; set; }
        
            public UpdateConstants() { }
        
            public UpdateConstants(AiCup22.Model.Constants constants)
            {
                this.Constants = constants;
            }
        
            /// <summary> Read UpdateConstants from reader </summary>
            public static new UpdateConstants ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new UpdateConstants();
                result.Constants = AiCup22.Model.Constants.ReadFrom(reader);
                return result;
            }
        
            /// <summary> Write UpdateConstants to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
                Constants.WriteTo(writer);
            }
        
            /// <summary> Get string representation of UpdateConstants </summary>
            public override string ToString() {
                string stringResult = "UpdateConstants { ";
                stringResult += "Constants: ";
                stringResult += Constants.ToString();
                stringResult += " }";
                return stringResult;
            }
        }

        /// <summary>
        /// Get order for next tick
        /// </summary>
        public class GetOrder : ServerMessage
        {
            public const int TAG = 1;
        
            /// <summary>
            /// Player's view
            /// </summary>
            public AiCup22.Model.Game PlayerView { get; set; }
            /// <summary>
            /// Whether app is running with debug interface available
            /// </summary>
            public bool DebugAvailable { get; set; }
        
            public GetOrder() { }
        
            public GetOrder(AiCup22.Model.Game playerView, bool debugAvailable)
            {
                this.PlayerView = playerView;
                this.DebugAvailable = debugAvailable;
            }
        
            /// <summary> Read GetOrder from reader </summary>
            public static new GetOrder ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new GetOrder();
                result.PlayerView = AiCup22.Model.Game.ReadFrom(reader);
                result.DebugAvailable = reader.ReadBoolean();
                return result;
            }
        
            /// <summary> Write GetOrder to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
                PlayerView.WriteTo(writer);
                writer.Write(DebugAvailable);
            }
        
            /// <summary> Get string representation of GetOrder </summary>
            public override string ToString() {
                string stringResult = "GetOrder { ";
                stringResult += "PlayerView: ";
                stringResult += PlayerView.ToString();
                stringResult += ", ";
                stringResult += "DebugAvailable: ";
                stringResult += DebugAvailable.ToString();
                stringResult += " }";
                return stringResult;
            }
        }

        /// <summary>
        /// Signifies end of the game
        /// </summary>
        public class Finish : ServerMessage
        {
            public const int TAG = 2;
        
        
            public Finish() { }
        
            /// <summary> Read Finish from reader </summary>
            public static new Finish ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new Finish();
                return result;
            }
        
            /// <summary> Write Finish to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
            }
        
            /// <summary> Get string representation of Finish </summary>
            public override string ToString() {
                string stringResult = "Finish { ";
                stringResult += " }";
                return stringResult;
            }
        }

        /// <summary>
        /// Debug update
        /// </summary>
        public class DebugUpdate : ServerMessage
        {
            public const int TAG = 3;
        
        
            public DebugUpdate() { }
        
            /// <summary> Read DebugUpdate from reader </summary>
            public static new DebugUpdate ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new DebugUpdate();
                return result;
            }
        
            /// <summary> Write DebugUpdate to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
            }
        
            /// <summary> Get string representation of DebugUpdate </summary>
            public override string ToString() {
                string stringResult = "DebugUpdate { ";
                stringResult += " }";
                return stringResult;
            }
        }
    }
}