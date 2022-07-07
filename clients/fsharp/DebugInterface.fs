namespace AiCup22

type DebugInterface(reader, writer) =
    member this.addPlacedText(position: Model.Vec2, text: string, alignment: Model.Vec2, size: double, color: Debugging.Color) =
        this.add (Debugging.DebugData.PlacedText {
            Position = position
            Text = text
            Alignment = alignment
            Size = size
            Color = color
        })
    
    member this.addCircle(position: Model.Vec2, radius: double, color: Debugging.Color) =
        this.add (Debugging.DebugData.Circle {
            Position = position
            Radius = radius
            Color = color
        })
    
    member this.addGradientCircle(position: Model.Vec2, radius: double, innerColor: Debugging.Color, outerColor: Debugging.Color) =
        this.add (Debugging.DebugData.GradientCircle {
            Position = position
            Radius = radius
            InnerColor = innerColor
            OuterColor = outerColor
        })
    
    member this.addRing(position: Model.Vec2, radius: double, width: double, color: Debugging.Color) =
        this.add (Debugging.DebugData.Ring {
            Position = position
            Radius = radius
            Width = width
            Color = color
        })
    
    member this.addPie(position: Model.Vec2, radius: double, startAngle: double, endAngle: double, color: Debugging.Color) =
        this.add (Debugging.DebugData.Pie {
            Position = position
            Radius = radius
            StartAngle = startAngle
            EndAngle = endAngle
            Color = color
        })
    
    member this.addArc(position: Model.Vec2, radius: double, width: double, startAngle: double, endAngle: double, color: Debugging.Color) =
        this.add (Debugging.DebugData.Arc {
            Position = position
            Radius = radius
            Width = width
            StartAngle = startAngle
            EndAngle = endAngle
            Color = color
        })
    
    member this.addRect(bottomLeft: Model.Vec2, size: Model.Vec2, color: Debugging.Color) =
        this.add (Debugging.DebugData.Rect {
            BottomLeft = bottomLeft
            Size = size
            Color = color
        })
    
    member this.addPolygon(vertices: Model.Vec2[], color: Debugging.Color) =
        this.add (Debugging.DebugData.Polygon {
            Vertices = vertices
            Color = color
        })
    
    member this.addGradientPolygon(vertices: Debugging.ColoredVertex[]) =
        this.add (Debugging.DebugData.GradientPolygon {
            Vertices = vertices
        })
    
    member this.addSegment(firstEnd: Model.Vec2, secondEnd: Model.Vec2, width: double, color: Debugging.Color) =
        this.add (Debugging.DebugData.Segment {
            FirstEnd = firstEnd
            SecondEnd = secondEnd
            Width = width
            Color = color
        })
    
    member this.addGradientSegment(firstEnd: Model.Vec2, firstColor: Debugging.Color, secondEnd: Model.Vec2, secondColor: Debugging.Color, width: double) =
        this.add (Debugging.DebugData.GradientSegment {
            FirstEnd = firstEnd
            FirstColor = firstColor
            SecondEnd = secondEnd
            SecondColor = secondColor
            Width = width
        })
    
    member this.addPolyLine(vertices: Model.Vec2[], width: double, color: Debugging.Color) =
        this.add (Debugging.DebugData.PolyLine {
            Vertices = vertices
            Width = width
            Color = color
        })
    
    member this.addGradientPolyLine(vertices: Debugging.ColoredVertex[], width: double) =
        this.add (Debugging.DebugData.GradientPolyLine {
            Vertices = vertices
            Width = width
        })

    member this.add(debugData: Debugging.DebugData) =
        this.send (Debugging.DebugCommand.Add {
            DebugData = debugData
        })
    
    member this.clear() =
        this.send (Debugging.DebugCommand.Clear (new Debugging.DebugCommandClear()))
    
    member this.setAutoFlush(enable: bool) =
        this.send (Debugging.DebugCommand.SetAutoFlush {
            Enable = enable
        })
    
    member this.flush() =
        this.send (Debugging.DebugCommand.Flush (new Debugging.DebugCommandFlush()))

    member this.send(command: Debugging.DebugCommand) =
        (Codegame.ClientMessage.DebugMessage { Command = command }).writeTo writer
        writer.Flush()

    member this.getState(): Debugging.DebugState =
        (new Codegame.ClientMessageRequestDebugState()).writeTo writer
        writer.Flush()
        Debugging.DebugState.readFrom reader