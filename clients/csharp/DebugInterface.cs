using System.IO;

namespace AiCup22
{
    public class DebugInterface
    {
        private BinaryWriter writer;
        private BinaryReader reader;
        public DebugInterface(BinaryReader reader, BinaryWriter writer)
        {
            this.reader = reader;
            this.writer = writer;
        }

        public void AddPlacedText(AiCup22.Model.Vec2 position, string text, AiCup22.Model.Vec2 alignment, double size, AiCup22.Debugging.Color color)
        {
            Add(new AiCup22.Debugging.DebugData.PlacedText(position, text, alignment, size, color));
        }
        
        public void AddCircle(AiCup22.Model.Vec2 position, double radius, AiCup22.Debugging.Color color)
        {
            Add(new AiCup22.Debugging.DebugData.Circle(position, radius, color));
        }
        
        public void AddGradientCircle(AiCup22.Model.Vec2 position, double radius, AiCup22.Debugging.Color innerColor, AiCup22.Debugging.Color outerColor)
        {
            Add(new AiCup22.Debugging.DebugData.GradientCircle(position, radius, innerColor, outerColor));
        }
        
        public void AddRing(AiCup22.Model.Vec2 position, double radius, double width, AiCup22.Debugging.Color color)
        {
            Add(new AiCup22.Debugging.DebugData.Ring(position, radius, width, color));
        }
        
        public void AddPie(AiCup22.Model.Vec2 position, double radius, double startAngle, double endAngle, AiCup22.Debugging.Color color)
        {
            Add(new AiCup22.Debugging.DebugData.Pie(position, radius, startAngle, endAngle, color));
        }
        
        public void AddArc(AiCup22.Model.Vec2 position, double radius, double width, double startAngle, double endAngle, AiCup22.Debugging.Color color)
        {
            Add(new AiCup22.Debugging.DebugData.Arc(position, radius, width, startAngle, endAngle, color));
        }
        
        public void AddRect(AiCup22.Model.Vec2 bottomLeft, AiCup22.Model.Vec2 size, AiCup22.Debugging.Color color)
        {
            Add(new AiCup22.Debugging.DebugData.Rect(bottomLeft, size, color));
        }
        
        public void AddPolygon(AiCup22.Model.Vec2[] vertices, AiCup22.Debugging.Color color)
        {
            Add(new AiCup22.Debugging.DebugData.Polygon(vertices, color));
        }
        
        public void AddGradientPolygon(AiCup22.Debugging.ColoredVertex[] vertices)
        {
            Add(new AiCup22.Debugging.DebugData.GradientPolygon(vertices));
        }
        
        public void AddSegment(AiCup22.Model.Vec2 firstEnd, AiCup22.Model.Vec2 secondEnd, double width, AiCup22.Debugging.Color color)
        {
            Add(new AiCup22.Debugging.DebugData.Segment(firstEnd, secondEnd, width, color));
        }
        
        public void AddGradientSegment(AiCup22.Model.Vec2 firstEnd, AiCup22.Debugging.Color firstColor, AiCup22.Model.Vec2 secondEnd, AiCup22.Debugging.Color secondColor, double width)
        {
            Add(new AiCup22.Debugging.DebugData.GradientSegment(firstEnd, firstColor, secondEnd, secondColor, width));
        }
        
        public void AddPolyLine(AiCup22.Model.Vec2[] vertices, double width, AiCup22.Debugging.Color color)
        {
            Add(new AiCup22.Debugging.DebugData.PolyLine(vertices, width, color));
        }
        
        public void AddGradientPolyLine(AiCup22.Debugging.ColoredVertex[] vertices, double width)
        {
            Add(new AiCup22.Debugging.DebugData.GradientPolyLine(vertices, width));
        }

        public void Add(AiCup22.Debugging.DebugData debugData)
        {
            Send(new AiCup22.Debugging.DebugCommand.Add(debugData));
        }
        
        public void Clear()
        {
            Send(new AiCup22.Debugging.DebugCommand.Clear());
        }
        
        public void SetAutoFlush(bool enable)
        {
            Send(new AiCup22.Debugging.DebugCommand.SetAutoFlush(enable));
        }
        
        public void Flush()
        {
            Send(new AiCup22.Debugging.DebugCommand.Flush());
        }

        public void Send(AiCup22.Debugging.DebugCommand command)
        {
            new AiCup22.Codegame.ClientMessage.DebugMessage(command).WriteTo(writer);
            writer.Flush();
        }

        public AiCup22.Debugging.DebugState GetState()
        {
            new AiCup22.Codegame.ClientMessage.RequestDebugState().WriteTo(writer);
            writer.Flush();
            return AiCup22.Debugging.DebugState.ReadFrom(reader);
        }
    }
}