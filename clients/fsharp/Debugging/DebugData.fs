#nowarn "0058"

namespace AiCup22
namespace AiCup22.Debugging

open AiCup22

/// Text
type DebugDataPlacedText = {
    /// Position
    Position: Model.Vec2;
    /// Text
    Text: string;
    /// Alignment, separate for x and y. From 0 to 1. 0.5 - center alignment
    Alignment: Model.Vec2;
    /// Size
    Size: double;
    /// Color
    Color: Debugging.Color;
} with

    /// Write PlacedText to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 0
        this.Position.writeTo writer
        let textData : byte[] = System.Text.Encoding.UTF8.GetBytes this.Text
        writer.Write textData.Length
        writer.Write textData
        this.Alignment.writeTo writer
        writer.Write this.Size
        this.Color.writeTo writer
        ()

    /// Read PlacedText from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Position = Model.Vec2.readFrom reader;
        Text = reader.ReadInt32() |> reader.ReadBytes |> System.Text.Encoding.UTF8.GetString
        Alignment = Model.Vec2.readFrom reader;
        Size = reader.ReadDouble()
        Color = Debugging.Color.readFrom reader;
    }

/// Circle
type DebugDataCircle = {
    /// Position of the center
    Position: Model.Vec2;
    /// Radius
    Radius: double;
    /// Color
    Color: Debugging.Color;
} with

    /// Write Circle to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 1
        this.Position.writeTo writer
        writer.Write this.Radius
        this.Color.writeTo writer
        ()

    /// Read Circle from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Position = Model.Vec2.readFrom reader;
        Radius = reader.ReadDouble()
        Color = Debugging.Color.readFrom reader;
    }

/// Circle with gradient fill
type DebugDataGradientCircle = {
    /// Position of the center
    Position: Model.Vec2;
    /// Radius
    Radius: double;
    /// Color of the center
    InnerColor: Debugging.Color;
    /// Color of the edge
    OuterColor: Debugging.Color;
} with

    /// Write GradientCircle to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 2
        this.Position.writeTo writer
        writer.Write this.Radius
        this.InnerColor.writeTo writer
        this.OuterColor.writeTo writer
        ()

    /// Read GradientCircle from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Position = Model.Vec2.readFrom reader;
        Radius = reader.ReadDouble()
        InnerColor = Debugging.Color.readFrom reader;
        OuterColor = Debugging.Color.readFrom reader;
    }

/// Ring
type DebugDataRing = {
    /// Position of the center
    Position: Model.Vec2;
    /// Radius
    Radius: double;
    /// Width
    Width: double;
    /// Color
    Color: Debugging.Color;
} with

    /// Write Ring to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 3
        this.Position.writeTo writer
        writer.Write this.Radius
        writer.Write this.Width
        this.Color.writeTo writer
        ()

    /// Read Ring from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Position = Model.Vec2.readFrom reader;
        Radius = reader.ReadDouble()
        Width = reader.ReadDouble()
        Color = Debugging.Color.readFrom reader;
    }

/// Sector of a circle
type DebugDataPie = {
    /// Position of the center
    Position: Model.Vec2;
    /// Radius
    Radius: double;
    /// Start angle
    StartAngle: double;
    /// End angle
    EndAngle: double;
    /// Color
    Color: Debugging.Color;
} with

    /// Write Pie to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 4
        this.Position.writeTo writer
        writer.Write this.Radius
        writer.Write this.StartAngle
        writer.Write this.EndAngle
        this.Color.writeTo writer
        ()

    /// Read Pie from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Position = Model.Vec2.readFrom reader;
        Radius = reader.ReadDouble()
        StartAngle = reader.ReadDouble()
        EndAngle = reader.ReadDouble()
        Color = Debugging.Color.readFrom reader;
    }

/// Arc
type DebugDataArc = {
    /// Position of the center
    Position: Model.Vec2;
    /// Radius
    Radius: double;
    /// Width
    Width: double;
    /// Start angle
    StartAngle: double;
    /// End angle
    EndAngle: double;
    /// Color
    Color: Debugging.Color;
} with

    /// Write Arc to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 5
        this.Position.writeTo writer
        writer.Write this.Radius
        writer.Write this.Width
        writer.Write this.StartAngle
        writer.Write this.EndAngle
        this.Color.writeTo writer
        ()

    /// Read Arc from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Position = Model.Vec2.readFrom reader;
        Radius = reader.ReadDouble()
        Width = reader.ReadDouble()
        StartAngle = reader.ReadDouble()
        EndAngle = reader.ReadDouble()
        Color = Debugging.Color.readFrom reader;
    }

/// Rectancle
type DebugDataRect = {
    /// Bottom left position
    BottomLeft: Model.Vec2;
    /// Size
    Size: Model.Vec2;
    /// Color
    Color: Debugging.Color;
} with

    /// Write Rect to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 6
        this.BottomLeft.writeTo writer
        this.Size.writeTo writer
        this.Color.writeTo writer
        ()

    /// Read Rect from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        BottomLeft = Model.Vec2.readFrom reader;
        Size = Model.Vec2.readFrom reader;
        Color = Debugging.Color.readFrom reader;
    }

/// Polygon (convex)
type DebugDataPolygon = {
    /// Positions of vertices in order
    Vertices: Model.Vec2[];
    /// Color
    Color: Debugging.Color;
} with

    /// Write Polygon to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 7
        writer.Write this.Vertices.Length
        this.Vertices |> Array.iter (fun value ->
            value.writeTo writer )
        this.Color.writeTo writer
        ()

    /// Read Polygon from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Vertices = [|for _ in 1 .. reader.ReadInt32() do
                       yield Model.Vec2.readFrom reader; |]
        Color = Debugging.Color.readFrom reader;
    }

/// Polygon with gradient fill
type DebugDataGradientPolygon = {
    /// List of vertices in order
    Vertices: Debugging.ColoredVertex[];
} with

    /// Write GradientPolygon to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 8
        writer.Write this.Vertices.Length
        this.Vertices |> Array.iter (fun value ->
            value.writeTo writer )
        ()

    /// Read GradientPolygon from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Vertices = [|for _ in 1 .. reader.ReadInt32() do
                       yield Debugging.ColoredVertex.readFrom reader; |]
    }

/// Segment
type DebugDataSegment = {
    /// Position of the first end
    FirstEnd: Model.Vec2;
    /// Position of the second end
    SecondEnd: Model.Vec2;
    /// Width
    Width: double;
    /// Color
    Color: Debugging.Color;
} with

    /// Write Segment to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 9
        this.FirstEnd.writeTo writer
        this.SecondEnd.writeTo writer
        writer.Write this.Width
        this.Color.writeTo writer
        ()

    /// Read Segment from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        FirstEnd = Model.Vec2.readFrom reader;
        SecondEnd = Model.Vec2.readFrom reader;
        Width = reader.ReadDouble()
        Color = Debugging.Color.readFrom reader;
    }

/// Segment with gradient fill
type DebugDataGradientSegment = {
    /// Position of the first end
    FirstEnd: Model.Vec2;
    /// Color of the first end
    FirstColor: Debugging.Color;
    /// Position of the second end
    SecondEnd: Model.Vec2;
    /// Color of the second end
    SecondColor: Debugging.Color;
    /// Width
    Width: double;
} with

    /// Write GradientSegment to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 10
        this.FirstEnd.writeTo writer
        this.FirstColor.writeTo writer
        this.SecondEnd.writeTo writer
        this.SecondColor.writeTo writer
        writer.Write this.Width
        ()

    /// Read GradientSegment from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        FirstEnd = Model.Vec2.readFrom reader;
        FirstColor = Debugging.Color.readFrom reader;
        SecondEnd = Model.Vec2.readFrom reader;
        SecondColor = Debugging.Color.readFrom reader;
        Width = reader.ReadDouble()
    }

/// Poly line
type DebugDataPolyLine = {
    /// List of points in order
    Vertices: Model.Vec2[];
    /// Width
    Width: double;
    /// Color
    Color: Debugging.Color;
} with

    /// Write PolyLine to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 11
        writer.Write this.Vertices.Length
        this.Vertices |> Array.iter (fun value ->
            value.writeTo writer )
        writer.Write this.Width
        this.Color.writeTo writer
        ()

    /// Read PolyLine from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Vertices = [|for _ in 1 .. reader.ReadInt32() do
                       yield Model.Vec2.readFrom reader; |]
        Width = reader.ReadDouble()
        Color = Debugging.Color.readFrom reader;
    }

/// Poly line with gradient fill
type DebugDataGradientPolyLine = {
    /// List of points and colors in order
    Vertices: Debugging.ColoredVertex[];
    /// Width
    Width: double;
} with

    /// Write GradientPolyLine to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write 12
        writer.Write this.Vertices.Length
        this.Vertices |> Array.iter (fun value ->
            value.writeTo writer )
        writer.Write this.Width
        ()

    /// Read GradientPolyLine from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        Vertices = [|for _ in 1 .. reader.ReadInt32() do
                       yield Debugging.ColoredVertex.readFrom reader; |]
        Width = reader.ReadDouble()
    }

/// Data for debug rendering
type DebugData =
    /// Text
    | PlacedText of DebugDataPlacedText
    /// Circle
    | Circle of DebugDataCircle
    /// Circle with gradient fill
    | GradientCircle of DebugDataGradientCircle
    /// Ring
    | Ring of DebugDataRing
    /// Sector of a circle
    | Pie of DebugDataPie
    /// Arc
    | Arc of DebugDataArc
    /// Rectancle
    | Rect of DebugDataRect
    /// Polygon (convex)
    | Polygon of DebugDataPolygon
    /// Polygon with gradient fill
    | GradientPolygon of DebugDataGradientPolygon
    /// Segment
    | Segment of DebugDataSegment
    /// Segment with gradient fill
    | GradientSegment of DebugDataGradientSegment
    /// Poly line
    | PolyLine of DebugDataPolyLine
    /// Poly line with gradient fill
    | GradientPolyLine of DebugDataGradientPolyLine
    with

    /// Write DebugData to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        match this with
            | PlacedText value -> value.writeTo writer
            | Circle value -> value.writeTo writer
            | GradientCircle value -> value.writeTo writer
            | Ring value -> value.writeTo writer
            | Pie value -> value.writeTo writer
            | Arc value -> value.writeTo writer
            | Rect value -> value.writeTo writer
            | Polygon value -> value.writeTo writer
            | GradientPolygon value -> value.writeTo writer
            | Segment value -> value.writeTo writer
            | GradientSegment value -> value.writeTo writer
            | PolyLine value -> value.writeTo writer
            | GradientPolyLine value -> value.writeTo writer

    /// Read DebugData from reader
    static member readFrom(reader: System.IO.BinaryReader) =
        match reader.ReadInt32() with
            | 0 -> PlacedText (DebugDataPlacedText.readFrom reader)
            | 1 -> Circle (DebugDataCircle.readFrom reader)
            | 2 -> GradientCircle (DebugDataGradientCircle.readFrom reader)
            | 3 -> Ring (DebugDataRing.readFrom reader)
            | 4 -> Pie (DebugDataPie.readFrom reader)
            | 5 -> Arc (DebugDataArc.readFrom reader)
            | 6 -> Rect (DebugDataRect.readFrom reader)
            | 7 -> Polygon (DebugDataPolygon.readFrom reader)
            | 8 -> GradientPolygon (DebugDataGradientPolygon.readFrom reader)
            | 9 -> Segment (DebugDataSegment.readFrom reader)
            | 10 -> GradientSegment (DebugDataGradientSegment.readFrom reader)
            | 11 -> PolyLine (DebugDataPolyLine.readFrom reader)
            | 12 -> GradientPolyLine (DebugDataGradientPolyLine.readFrom reader)
            | x -> failwith (sprintf "Unexpected tag %d" x)