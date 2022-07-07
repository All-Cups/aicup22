namespace AiCup22.Debugging
{
    /// <summary>
    /// Renderer's state
    /// </summary>
    public struct DebugState
    {
        /// <summary>
        /// Pressed keys
        /// </summary>
        public string[] PressedKeys { get; set; }
        /// <summary>
        /// Cursor's position in game coordinates
        /// </summary>
        public AiCup22.Model.Vec2 CursorWorldPosition { get; set; }
        /// <summary>
        /// Id of unit which is followed by the camera, or None
        /// </summary>
        public int? LockedUnit { get; set; }
        /// <summary>
        /// Current camera state
        /// </summary>
        public AiCup22.Debugging.Camera Camera { get; set; }
    
        public DebugState(string[] pressedKeys, AiCup22.Model.Vec2 cursorWorldPosition, int? lockedUnit, AiCup22.Debugging.Camera camera)
        {
            this.PressedKeys = pressedKeys;
            this.CursorWorldPosition = cursorWorldPosition;
            this.LockedUnit = lockedUnit;
            this.Camera = camera;
        }
    
        /// <summary> Read DebugState from reader </summary>
        public static DebugState ReadFrom(System.IO.BinaryReader reader)
        {
            var result = new DebugState();
            result.PressedKeys = new string[reader.ReadInt32()];
            for (int pressedKeysIndex = 0; pressedKeysIndex < result.PressedKeys.Length; pressedKeysIndex++)
            {
                result.PressedKeys[pressedKeysIndex] = System.Text.Encoding.UTF8.GetString(reader.ReadBytes(reader.ReadInt32()));
            }
            result.CursorWorldPosition = AiCup22.Model.Vec2.ReadFrom(reader);
            if (reader.ReadBoolean())
            {
                result.LockedUnit = reader.ReadInt32();
            } else
            {
                result.LockedUnit = null;
            }
            result.Camera = AiCup22.Debugging.Camera.ReadFrom(reader);
            return result;
        }
    
        /// <summary> Write DebugState to writer </summary>
        public void WriteTo(System.IO.BinaryWriter writer)
        {
            writer.Write(PressedKeys.Length);
            foreach (var pressedKeysElement in PressedKeys)
            {
                var pressedKeysElementData = System.Text.Encoding.UTF8.GetBytes(pressedKeysElement);
                writer.Write(pressedKeysElementData.Length);
                writer.Write(pressedKeysElementData);
            }
            CursorWorldPosition.WriteTo(writer);
            if (!LockedUnit.HasValue)
            {
                writer.Write(false);
            } else
            {
                writer.Write(true);
                writer.Write(LockedUnit.Value);
            }
            Camera.WriteTo(writer);
        }
    
        /// <summary> Get string representation of DebugState </summary>
        public override string ToString() {
            string stringResult = "DebugState { ";
            stringResult += "PressedKeys: ";
            stringResult += "[ ";
            int pressedKeysIndex = 0;
            foreach (var pressedKeysElement in PressedKeys)
            {
                if (pressedKeysIndex != 0) {
                    stringResult += ", ";
                }
                stringResult += "\"" + pressedKeysElement + "\"";
                pressedKeysIndex++;
            }
            stringResult += " ]";
            stringResult += ", ";
            stringResult += "CursorWorldPosition: ";
            stringResult += CursorWorldPosition.ToString();
            stringResult += ", ";
            stringResult += "LockedUnit: ";
            if (!LockedUnit.HasValue)
            {
                stringResult += "null";
            } else
            {
                stringResult += LockedUnit.Value.ToString();
            }
            stringResult += ", ";
            stringResult += "Camera: ";
            stringResult += Camera.ToString();
            stringResult += " }";
            return stringResult;
        }
    }
}