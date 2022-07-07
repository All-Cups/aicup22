namespace AiCup22.Debugging
{
    /// <summary>
    /// Data for debug rendering
    /// </summary>
    public abstract class DebugData
    {
        /// <summary> Write DebugData to writer </summary>
        public abstract void WriteTo(System.IO.BinaryWriter writer);

        /// <summary> Read DebugData from reader </summary>
        public static DebugData ReadFrom(System.IO.BinaryReader reader)
        {
            switch (reader.ReadInt32())
            {
                case PlacedText.TAG:
                    return PlacedText.ReadFrom(reader);
                case Circle.TAG:
                    return Circle.ReadFrom(reader);
                case GradientCircle.TAG:
                    return GradientCircle.ReadFrom(reader);
                case Ring.TAG:
                    return Ring.ReadFrom(reader);
                case Pie.TAG:
                    return Pie.ReadFrom(reader);
                case Arc.TAG:
                    return Arc.ReadFrom(reader);
                case Rect.TAG:
                    return Rect.ReadFrom(reader);
                case Polygon.TAG:
                    return Polygon.ReadFrom(reader);
                case GradientPolygon.TAG:
                    return GradientPolygon.ReadFrom(reader);
                case Segment.TAG:
                    return Segment.ReadFrom(reader);
                case GradientSegment.TAG:
                    return GradientSegment.ReadFrom(reader);
                case PolyLine.TAG:
                    return PolyLine.ReadFrom(reader);
                case GradientPolyLine.TAG:
                    return GradientPolyLine.ReadFrom(reader);
                default:
                    throw new System.Exception("Unexpected tag value");
            }
        }

        /// <summary>
        /// Text
        /// </summary>
        public class PlacedText : DebugData
        {
            public const int TAG = 0;
        
            /// <summary>
            /// Position
            /// </summary>
            public AiCup22.Model.Vec2 Position { get; set; }
            /// <summary>
            /// Text
            /// </summary>
            public string Text { get; set; }
            /// <summary>
            /// Alignment, separate for x and y. From 0 to 1. 0.5 - center alignment
            /// </summary>
            public AiCup22.Model.Vec2 Alignment { get; set; }
            /// <summary>
            /// Size
            /// </summary>
            public double Size { get; set; }
            /// <summary>
            /// Color
            /// </summary>
            public AiCup22.Debugging.Color Color { get; set; }
        
            public PlacedText() { }
        
            public PlacedText(AiCup22.Model.Vec2 position, string text, AiCup22.Model.Vec2 alignment, double size, AiCup22.Debugging.Color color)
            {
                this.Position = position;
                this.Text = text;
                this.Alignment = alignment;
                this.Size = size;
                this.Color = color;
            }
        
            /// <summary> Read PlacedText from reader </summary>
            public static new PlacedText ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new PlacedText();
                result.Position = AiCup22.Model.Vec2.ReadFrom(reader);
                result.Text = System.Text.Encoding.UTF8.GetString(reader.ReadBytes(reader.ReadInt32()));
                result.Alignment = AiCup22.Model.Vec2.ReadFrom(reader);
                result.Size = reader.ReadDouble();
                result.Color = AiCup22.Debugging.Color.ReadFrom(reader);
                return result;
            }
        
            /// <summary> Write PlacedText to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
                Position.WriteTo(writer);
                var textData = System.Text.Encoding.UTF8.GetBytes(Text);
                writer.Write(textData.Length);
                writer.Write(textData);
                Alignment.WriteTo(writer);
                writer.Write(Size);
                Color.WriteTo(writer);
            }
        
            /// <summary> Get string representation of PlacedText </summary>
            public override string ToString() {
                string stringResult = "PlacedText { ";
                stringResult += "Position: ";
                stringResult += Position.ToString();
                stringResult += ", ";
                stringResult += "Text: ";
                stringResult += "\"" + Text + "\"";
                stringResult += ", ";
                stringResult += "Alignment: ";
                stringResult += Alignment.ToString();
                stringResult += ", ";
                stringResult += "Size: ";
                stringResult += Size.ToString();
                stringResult += ", ";
                stringResult += "Color: ";
                stringResult += Color.ToString();
                stringResult += " }";
                return stringResult;
            }
        }

        /// <summary>
        /// Circle
        /// </summary>
        public class Circle : DebugData
        {
            public const int TAG = 1;
        
            /// <summary>
            /// Position of the center
            /// </summary>
            public AiCup22.Model.Vec2 Position { get; set; }
            /// <summary>
            /// Radius
            /// </summary>
            public double Radius { get; set; }
            /// <summary>
            /// Color
            /// </summary>
            public AiCup22.Debugging.Color Color { get; set; }
        
            public Circle() { }
        
            public Circle(AiCup22.Model.Vec2 position, double radius, AiCup22.Debugging.Color color)
            {
                this.Position = position;
                this.Radius = radius;
                this.Color = color;
            }
        
            /// <summary> Read Circle from reader </summary>
            public static new Circle ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new Circle();
                result.Position = AiCup22.Model.Vec2.ReadFrom(reader);
                result.Radius = reader.ReadDouble();
                result.Color = AiCup22.Debugging.Color.ReadFrom(reader);
                return result;
            }
        
            /// <summary> Write Circle to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
                Position.WriteTo(writer);
                writer.Write(Radius);
                Color.WriteTo(writer);
            }
        
            /// <summary> Get string representation of Circle </summary>
            public override string ToString() {
                string stringResult = "Circle { ";
                stringResult += "Position: ";
                stringResult += Position.ToString();
                stringResult += ", ";
                stringResult += "Radius: ";
                stringResult += Radius.ToString();
                stringResult += ", ";
                stringResult += "Color: ";
                stringResult += Color.ToString();
                stringResult += " }";
                return stringResult;
            }
        }

        /// <summary>
        /// Circle with gradient fill
        /// </summary>
        public class GradientCircle : DebugData
        {
            public const int TAG = 2;
        
            /// <summary>
            /// Position of the center
            /// </summary>
            public AiCup22.Model.Vec2 Position { get; set; }
            /// <summary>
            /// Radius
            /// </summary>
            public double Radius { get; set; }
            /// <summary>
            /// Color of the center
            /// </summary>
            public AiCup22.Debugging.Color InnerColor { get; set; }
            /// <summary>
            /// Color of the edge
            /// </summary>
            public AiCup22.Debugging.Color OuterColor { get; set; }
        
            public GradientCircle() { }
        
            public GradientCircle(AiCup22.Model.Vec2 position, double radius, AiCup22.Debugging.Color innerColor, AiCup22.Debugging.Color outerColor)
            {
                this.Position = position;
                this.Radius = radius;
                this.InnerColor = innerColor;
                this.OuterColor = outerColor;
            }
        
            /// <summary> Read GradientCircle from reader </summary>
            public static new GradientCircle ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new GradientCircle();
                result.Position = AiCup22.Model.Vec2.ReadFrom(reader);
                result.Radius = reader.ReadDouble();
                result.InnerColor = AiCup22.Debugging.Color.ReadFrom(reader);
                result.OuterColor = AiCup22.Debugging.Color.ReadFrom(reader);
                return result;
            }
        
            /// <summary> Write GradientCircle to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
                Position.WriteTo(writer);
                writer.Write(Radius);
                InnerColor.WriteTo(writer);
                OuterColor.WriteTo(writer);
            }
        
            /// <summary> Get string representation of GradientCircle </summary>
            public override string ToString() {
                string stringResult = "GradientCircle { ";
                stringResult += "Position: ";
                stringResult += Position.ToString();
                stringResult += ", ";
                stringResult += "Radius: ";
                stringResult += Radius.ToString();
                stringResult += ", ";
                stringResult += "InnerColor: ";
                stringResult += InnerColor.ToString();
                stringResult += ", ";
                stringResult += "OuterColor: ";
                stringResult += OuterColor.ToString();
                stringResult += " }";
                return stringResult;
            }
        }

        /// <summary>
        /// Ring
        /// </summary>
        public class Ring : DebugData
        {
            public const int TAG = 3;
        
            /// <summary>
            /// Position of the center
            /// </summary>
            public AiCup22.Model.Vec2 Position { get; set; }
            /// <summary>
            /// Radius
            /// </summary>
            public double Radius { get; set; }
            /// <summary>
            /// Width
            /// </summary>
            public double Width { get; set; }
            /// <summary>
            /// Color
            /// </summary>
            public AiCup22.Debugging.Color Color { get; set; }
        
            public Ring() { }
        
            public Ring(AiCup22.Model.Vec2 position, double radius, double width, AiCup22.Debugging.Color color)
            {
                this.Position = position;
                this.Radius = radius;
                this.Width = width;
                this.Color = color;
            }
        
            /// <summary> Read Ring from reader </summary>
            public static new Ring ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new Ring();
                result.Position = AiCup22.Model.Vec2.ReadFrom(reader);
                result.Radius = reader.ReadDouble();
                result.Width = reader.ReadDouble();
                result.Color = AiCup22.Debugging.Color.ReadFrom(reader);
                return result;
            }
        
            /// <summary> Write Ring to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
                Position.WriteTo(writer);
                writer.Write(Radius);
                writer.Write(Width);
                Color.WriteTo(writer);
            }
        
            /// <summary> Get string representation of Ring </summary>
            public override string ToString() {
                string stringResult = "Ring { ";
                stringResult += "Position: ";
                stringResult += Position.ToString();
                stringResult += ", ";
                stringResult += "Radius: ";
                stringResult += Radius.ToString();
                stringResult += ", ";
                stringResult += "Width: ";
                stringResult += Width.ToString();
                stringResult += ", ";
                stringResult += "Color: ";
                stringResult += Color.ToString();
                stringResult += " }";
                return stringResult;
            }
        }

        /// <summary>
        /// Sector of a circle
        /// </summary>
        public class Pie : DebugData
        {
            public const int TAG = 4;
        
            /// <summary>
            /// Position of the center
            /// </summary>
            public AiCup22.Model.Vec2 Position { get; set; }
            /// <summary>
            /// Radius
            /// </summary>
            public double Radius { get; set; }
            /// <summary>
            /// Start angle
            /// </summary>
            public double StartAngle { get; set; }
            /// <summary>
            /// End angle
            /// </summary>
            public double EndAngle { get; set; }
            /// <summary>
            /// Color
            /// </summary>
            public AiCup22.Debugging.Color Color { get; set; }
        
            public Pie() { }
        
            public Pie(AiCup22.Model.Vec2 position, double radius, double startAngle, double endAngle, AiCup22.Debugging.Color color)
            {
                this.Position = position;
                this.Radius = radius;
                this.StartAngle = startAngle;
                this.EndAngle = endAngle;
                this.Color = color;
            }
        
            /// <summary> Read Pie from reader </summary>
            public static new Pie ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new Pie();
                result.Position = AiCup22.Model.Vec2.ReadFrom(reader);
                result.Radius = reader.ReadDouble();
                result.StartAngle = reader.ReadDouble();
                result.EndAngle = reader.ReadDouble();
                result.Color = AiCup22.Debugging.Color.ReadFrom(reader);
                return result;
            }
        
            /// <summary> Write Pie to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
                Position.WriteTo(writer);
                writer.Write(Radius);
                writer.Write(StartAngle);
                writer.Write(EndAngle);
                Color.WriteTo(writer);
            }
        
            /// <summary> Get string representation of Pie </summary>
            public override string ToString() {
                string stringResult = "Pie { ";
                stringResult += "Position: ";
                stringResult += Position.ToString();
                stringResult += ", ";
                stringResult += "Radius: ";
                stringResult += Radius.ToString();
                stringResult += ", ";
                stringResult += "StartAngle: ";
                stringResult += StartAngle.ToString();
                stringResult += ", ";
                stringResult += "EndAngle: ";
                stringResult += EndAngle.ToString();
                stringResult += ", ";
                stringResult += "Color: ";
                stringResult += Color.ToString();
                stringResult += " }";
                return stringResult;
            }
        }

        /// <summary>
        /// Arc
        /// </summary>
        public class Arc : DebugData
        {
            public const int TAG = 5;
        
            /// <summary>
            /// Position of the center
            /// </summary>
            public AiCup22.Model.Vec2 Position { get; set; }
            /// <summary>
            /// Radius
            /// </summary>
            public double Radius { get; set; }
            /// <summary>
            /// Width
            /// </summary>
            public double Width { get; set; }
            /// <summary>
            /// Start angle
            /// </summary>
            public double StartAngle { get; set; }
            /// <summary>
            /// End angle
            /// </summary>
            public double EndAngle { get; set; }
            /// <summary>
            /// Color
            /// </summary>
            public AiCup22.Debugging.Color Color { get; set; }
        
            public Arc() { }
        
            public Arc(AiCup22.Model.Vec2 position, double radius, double width, double startAngle, double endAngle, AiCup22.Debugging.Color color)
            {
                this.Position = position;
                this.Radius = radius;
                this.Width = width;
                this.StartAngle = startAngle;
                this.EndAngle = endAngle;
                this.Color = color;
            }
        
            /// <summary> Read Arc from reader </summary>
            public static new Arc ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new Arc();
                result.Position = AiCup22.Model.Vec2.ReadFrom(reader);
                result.Radius = reader.ReadDouble();
                result.Width = reader.ReadDouble();
                result.StartAngle = reader.ReadDouble();
                result.EndAngle = reader.ReadDouble();
                result.Color = AiCup22.Debugging.Color.ReadFrom(reader);
                return result;
            }
        
            /// <summary> Write Arc to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
                Position.WriteTo(writer);
                writer.Write(Radius);
                writer.Write(Width);
                writer.Write(StartAngle);
                writer.Write(EndAngle);
                Color.WriteTo(writer);
            }
        
            /// <summary> Get string representation of Arc </summary>
            public override string ToString() {
                string stringResult = "Arc { ";
                stringResult += "Position: ";
                stringResult += Position.ToString();
                stringResult += ", ";
                stringResult += "Radius: ";
                stringResult += Radius.ToString();
                stringResult += ", ";
                stringResult += "Width: ";
                stringResult += Width.ToString();
                stringResult += ", ";
                stringResult += "StartAngle: ";
                stringResult += StartAngle.ToString();
                stringResult += ", ";
                stringResult += "EndAngle: ";
                stringResult += EndAngle.ToString();
                stringResult += ", ";
                stringResult += "Color: ";
                stringResult += Color.ToString();
                stringResult += " }";
                return stringResult;
            }
        }

        /// <summary>
        /// Rectancle
        /// </summary>
        public class Rect : DebugData
        {
            public const int TAG = 6;
        
            /// <summary>
            /// Bottom left position
            /// </summary>
            public AiCup22.Model.Vec2 BottomLeft { get; set; }
            /// <summary>
            /// Size
            /// </summary>
            public AiCup22.Model.Vec2 Size { get; set; }
            /// <summary>
            /// Color
            /// </summary>
            public AiCup22.Debugging.Color Color { get; set; }
        
            public Rect() { }
        
            public Rect(AiCup22.Model.Vec2 bottomLeft, AiCup22.Model.Vec2 size, AiCup22.Debugging.Color color)
            {
                this.BottomLeft = bottomLeft;
                this.Size = size;
                this.Color = color;
            }
        
            /// <summary> Read Rect from reader </summary>
            public static new Rect ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new Rect();
                result.BottomLeft = AiCup22.Model.Vec2.ReadFrom(reader);
                result.Size = AiCup22.Model.Vec2.ReadFrom(reader);
                result.Color = AiCup22.Debugging.Color.ReadFrom(reader);
                return result;
            }
        
            /// <summary> Write Rect to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
                BottomLeft.WriteTo(writer);
                Size.WriteTo(writer);
                Color.WriteTo(writer);
            }
        
            /// <summary> Get string representation of Rect </summary>
            public override string ToString() {
                string stringResult = "Rect { ";
                stringResult += "BottomLeft: ";
                stringResult += BottomLeft.ToString();
                stringResult += ", ";
                stringResult += "Size: ";
                stringResult += Size.ToString();
                stringResult += ", ";
                stringResult += "Color: ";
                stringResult += Color.ToString();
                stringResult += " }";
                return stringResult;
            }
        }

        /// <summary>
        /// Polygon (convex)
        /// </summary>
        public class Polygon : DebugData
        {
            public const int TAG = 7;
        
            /// <summary>
            /// Positions of vertices in order
            /// </summary>
            public AiCup22.Model.Vec2[] Vertices { get; set; }
            /// <summary>
            /// Color
            /// </summary>
            public AiCup22.Debugging.Color Color { get; set; }
        
            public Polygon() { }
        
            public Polygon(AiCup22.Model.Vec2[] vertices, AiCup22.Debugging.Color color)
            {
                this.Vertices = vertices;
                this.Color = color;
            }
        
            /// <summary> Read Polygon from reader </summary>
            public static new Polygon ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new Polygon();
                result.Vertices = new AiCup22.Model.Vec2[reader.ReadInt32()];
                for (int verticesIndex = 0; verticesIndex < result.Vertices.Length; verticesIndex++)
                {
                    result.Vertices[verticesIndex] = AiCup22.Model.Vec2.ReadFrom(reader);
                }
                result.Color = AiCup22.Debugging.Color.ReadFrom(reader);
                return result;
            }
        
            /// <summary> Write Polygon to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
                writer.Write(Vertices.Length);
                foreach (var verticesElement in Vertices)
                {
                    verticesElement.WriteTo(writer);
                }
                Color.WriteTo(writer);
            }
        
            /// <summary> Get string representation of Polygon </summary>
            public override string ToString() {
                string stringResult = "Polygon { ";
                stringResult += "Vertices: ";
                stringResult += "[ ";
                int verticesIndex = 0;
                foreach (var verticesElement in Vertices)
                {
                    if (verticesIndex != 0) {
                        stringResult += ", ";
                    }
                    stringResult += verticesElement.ToString();
                    verticesIndex++;
                }
                stringResult += " ]";
                stringResult += ", ";
                stringResult += "Color: ";
                stringResult += Color.ToString();
                stringResult += " }";
                return stringResult;
            }
        }

        /// <summary>
        /// Polygon with gradient fill
        /// </summary>
        public class GradientPolygon : DebugData
        {
            public const int TAG = 8;
        
            /// <summary>
            /// List of vertices in order
            /// </summary>
            public AiCup22.Debugging.ColoredVertex[] Vertices { get; set; }
        
            public GradientPolygon() { }
        
            public GradientPolygon(AiCup22.Debugging.ColoredVertex[] vertices)
            {
                this.Vertices = vertices;
            }
        
            /// <summary> Read GradientPolygon from reader </summary>
            public static new GradientPolygon ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new GradientPolygon();
                result.Vertices = new AiCup22.Debugging.ColoredVertex[reader.ReadInt32()];
                for (int verticesIndex = 0; verticesIndex < result.Vertices.Length; verticesIndex++)
                {
                    result.Vertices[verticesIndex] = AiCup22.Debugging.ColoredVertex.ReadFrom(reader);
                }
                return result;
            }
        
            /// <summary> Write GradientPolygon to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
                writer.Write(Vertices.Length);
                foreach (var verticesElement in Vertices)
                {
                    verticesElement.WriteTo(writer);
                }
            }
        
            /// <summary> Get string representation of GradientPolygon </summary>
            public override string ToString() {
                string stringResult = "GradientPolygon { ";
                stringResult += "Vertices: ";
                stringResult += "[ ";
                int verticesIndex = 0;
                foreach (var verticesElement in Vertices)
                {
                    if (verticesIndex != 0) {
                        stringResult += ", ";
                    }
                    stringResult += verticesElement.ToString();
                    verticesIndex++;
                }
                stringResult += " ]";
                stringResult += " }";
                return stringResult;
            }
        }

        /// <summary>
        /// Segment
        /// </summary>
        public class Segment : DebugData
        {
            public const int TAG = 9;
        
            /// <summary>
            /// Position of the first end
            /// </summary>
            public AiCup22.Model.Vec2 FirstEnd { get; set; }
            /// <summary>
            /// Position of the second end
            /// </summary>
            public AiCup22.Model.Vec2 SecondEnd { get; set; }
            /// <summary>
            /// Width
            /// </summary>
            public double Width { get; set; }
            /// <summary>
            /// Color
            /// </summary>
            public AiCup22.Debugging.Color Color { get; set; }
        
            public Segment() { }
        
            public Segment(AiCup22.Model.Vec2 firstEnd, AiCup22.Model.Vec2 secondEnd, double width, AiCup22.Debugging.Color color)
            {
                this.FirstEnd = firstEnd;
                this.SecondEnd = secondEnd;
                this.Width = width;
                this.Color = color;
            }
        
            /// <summary> Read Segment from reader </summary>
            public static new Segment ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new Segment();
                result.FirstEnd = AiCup22.Model.Vec2.ReadFrom(reader);
                result.SecondEnd = AiCup22.Model.Vec2.ReadFrom(reader);
                result.Width = reader.ReadDouble();
                result.Color = AiCup22.Debugging.Color.ReadFrom(reader);
                return result;
            }
        
            /// <summary> Write Segment to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
                FirstEnd.WriteTo(writer);
                SecondEnd.WriteTo(writer);
                writer.Write(Width);
                Color.WriteTo(writer);
            }
        
            /// <summary> Get string representation of Segment </summary>
            public override string ToString() {
                string stringResult = "Segment { ";
                stringResult += "FirstEnd: ";
                stringResult += FirstEnd.ToString();
                stringResult += ", ";
                stringResult += "SecondEnd: ";
                stringResult += SecondEnd.ToString();
                stringResult += ", ";
                stringResult += "Width: ";
                stringResult += Width.ToString();
                stringResult += ", ";
                stringResult += "Color: ";
                stringResult += Color.ToString();
                stringResult += " }";
                return stringResult;
            }
        }

        /// <summary>
        /// Segment with gradient fill
        /// </summary>
        public class GradientSegment : DebugData
        {
            public const int TAG = 10;
        
            /// <summary>
            /// Position of the first end
            /// </summary>
            public AiCup22.Model.Vec2 FirstEnd { get; set; }
            /// <summary>
            /// Color of the first end
            /// </summary>
            public AiCup22.Debugging.Color FirstColor { get; set; }
            /// <summary>
            /// Position of the second end
            /// </summary>
            public AiCup22.Model.Vec2 SecondEnd { get; set; }
            /// <summary>
            /// Color of the second end
            /// </summary>
            public AiCup22.Debugging.Color SecondColor { get; set; }
            /// <summary>
            /// Width
            /// </summary>
            public double Width { get; set; }
        
            public GradientSegment() { }
        
            public GradientSegment(AiCup22.Model.Vec2 firstEnd, AiCup22.Debugging.Color firstColor, AiCup22.Model.Vec2 secondEnd, AiCup22.Debugging.Color secondColor, double width)
            {
                this.FirstEnd = firstEnd;
                this.FirstColor = firstColor;
                this.SecondEnd = secondEnd;
                this.SecondColor = secondColor;
                this.Width = width;
            }
        
            /// <summary> Read GradientSegment from reader </summary>
            public static new GradientSegment ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new GradientSegment();
                result.FirstEnd = AiCup22.Model.Vec2.ReadFrom(reader);
                result.FirstColor = AiCup22.Debugging.Color.ReadFrom(reader);
                result.SecondEnd = AiCup22.Model.Vec2.ReadFrom(reader);
                result.SecondColor = AiCup22.Debugging.Color.ReadFrom(reader);
                result.Width = reader.ReadDouble();
                return result;
            }
        
            /// <summary> Write GradientSegment to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
                FirstEnd.WriteTo(writer);
                FirstColor.WriteTo(writer);
                SecondEnd.WriteTo(writer);
                SecondColor.WriteTo(writer);
                writer.Write(Width);
            }
        
            /// <summary> Get string representation of GradientSegment </summary>
            public override string ToString() {
                string stringResult = "GradientSegment { ";
                stringResult += "FirstEnd: ";
                stringResult += FirstEnd.ToString();
                stringResult += ", ";
                stringResult += "FirstColor: ";
                stringResult += FirstColor.ToString();
                stringResult += ", ";
                stringResult += "SecondEnd: ";
                stringResult += SecondEnd.ToString();
                stringResult += ", ";
                stringResult += "SecondColor: ";
                stringResult += SecondColor.ToString();
                stringResult += ", ";
                stringResult += "Width: ";
                stringResult += Width.ToString();
                stringResult += " }";
                return stringResult;
            }
        }

        /// <summary>
        /// Poly line
        /// </summary>
        public class PolyLine : DebugData
        {
            public const int TAG = 11;
        
            /// <summary>
            /// List of points in order
            /// </summary>
            public AiCup22.Model.Vec2[] Vertices { get; set; }
            /// <summary>
            /// Width
            /// </summary>
            public double Width { get; set; }
            /// <summary>
            /// Color
            /// </summary>
            public AiCup22.Debugging.Color Color { get; set; }
        
            public PolyLine() { }
        
            public PolyLine(AiCup22.Model.Vec2[] vertices, double width, AiCup22.Debugging.Color color)
            {
                this.Vertices = vertices;
                this.Width = width;
                this.Color = color;
            }
        
            /// <summary> Read PolyLine from reader </summary>
            public static new PolyLine ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new PolyLine();
                result.Vertices = new AiCup22.Model.Vec2[reader.ReadInt32()];
                for (int verticesIndex = 0; verticesIndex < result.Vertices.Length; verticesIndex++)
                {
                    result.Vertices[verticesIndex] = AiCup22.Model.Vec2.ReadFrom(reader);
                }
                result.Width = reader.ReadDouble();
                result.Color = AiCup22.Debugging.Color.ReadFrom(reader);
                return result;
            }
        
            /// <summary> Write PolyLine to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
                writer.Write(Vertices.Length);
                foreach (var verticesElement in Vertices)
                {
                    verticesElement.WriteTo(writer);
                }
                writer.Write(Width);
                Color.WriteTo(writer);
            }
        
            /// <summary> Get string representation of PolyLine </summary>
            public override string ToString() {
                string stringResult = "PolyLine { ";
                stringResult += "Vertices: ";
                stringResult += "[ ";
                int verticesIndex = 0;
                foreach (var verticesElement in Vertices)
                {
                    if (verticesIndex != 0) {
                        stringResult += ", ";
                    }
                    stringResult += verticesElement.ToString();
                    verticesIndex++;
                }
                stringResult += " ]";
                stringResult += ", ";
                stringResult += "Width: ";
                stringResult += Width.ToString();
                stringResult += ", ";
                stringResult += "Color: ";
                stringResult += Color.ToString();
                stringResult += " }";
                return stringResult;
            }
        }

        /// <summary>
        /// Poly line with gradient fill
        /// </summary>
        public class GradientPolyLine : DebugData
        {
            public const int TAG = 12;
        
            /// <summary>
            /// List of points and colors in order
            /// </summary>
            public AiCup22.Debugging.ColoredVertex[] Vertices { get; set; }
            /// <summary>
            /// Width
            /// </summary>
            public double Width { get; set; }
        
            public GradientPolyLine() { }
        
            public GradientPolyLine(AiCup22.Debugging.ColoredVertex[] vertices, double width)
            {
                this.Vertices = vertices;
                this.Width = width;
            }
        
            /// <summary> Read GradientPolyLine from reader </summary>
            public static new GradientPolyLine ReadFrom(System.IO.BinaryReader reader)
            {
                var result = new GradientPolyLine();
                result.Vertices = new AiCup22.Debugging.ColoredVertex[reader.ReadInt32()];
                for (int verticesIndex = 0; verticesIndex < result.Vertices.Length; verticesIndex++)
                {
                    result.Vertices[verticesIndex] = AiCup22.Debugging.ColoredVertex.ReadFrom(reader);
                }
                result.Width = reader.ReadDouble();
                return result;
            }
        
            /// <summary> Write GradientPolyLine to writer </summary>
            public override void WriteTo(System.IO.BinaryWriter writer)
            {
                writer.Write(TAG);
                writer.Write(Vertices.Length);
                foreach (var verticesElement in Vertices)
                {
                    verticesElement.WriteTo(writer);
                }
                writer.Write(Width);
            }
        
            /// <summary> Get string representation of GradientPolyLine </summary>
            public override string ToString() {
                string stringResult = "GradientPolyLine { ";
                stringResult += "Vertices: ";
                stringResult += "[ ";
                int verticesIndex = 0;
                foreach (var verticesElement in Vertices)
                {
                    if (verticesIndex != 0) {
                        stringResult += ", ";
                    }
                    stringResult += verticesElement.ToString();
                    verticesIndex++;
                }
                stringResult += " ]";
                stringResult += ", ";
                stringResult += "Width: ";
                stringResult += Width.ToString();
                stringResult += " }";
                return stringResult;
            }
        }
    }
}