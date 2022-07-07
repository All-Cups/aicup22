import java.io.IOException
import java.io.InputStream
import java.io.OutputStream

class DebugInterface(private val inputStream: InputStream, private val outputStream: OutputStream) {
    fun addPlacedText(position: ai_cup_22.model.Vec2, text: String, alignment: ai_cup_22.model.Vec2, size: Double, color: ai_cup_22.debugging.Color) {
        this.add(ai_cup_22.debugging.DebugData.PlacedText(position, text, alignment, size, color))
    }
    
    fun addCircle(position: ai_cup_22.model.Vec2, radius: Double, color: ai_cup_22.debugging.Color) {
        this.add(ai_cup_22.debugging.DebugData.Circle(position, radius, color))
    }
    
    fun addGradientCircle(position: ai_cup_22.model.Vec2, radius: Double, innerColor: ai_cup_22.debugging.Color, outerColor: ai_cup_22.debugging.Color) {
        this.add(ai_cup_22.debugging.DebugData.GradientCircle(position, radius, innerColor, outerColor))
    }
    
    fun addRing(position: ai_cup_22.model.Vec2, radius: Double, width: Double, color: ai_cup_22.debugging.Color) {
        this.add(ai_cup_22.debugging.DebugData.Ring(position, radius, width, color))
    }
    
    fun addPie(position: ai_cup_22.model.Vec2, radius: Double, startAngle: Double, endAngle: Double, color: ai_cup_22.debugging.Color) {
        this.add(ai_cup_22.debugging.DebugData.Pie(position, radius, startAngle, endAngle, color))
    }
    
    fun addArc(position: ai_cup_22.model.Vec2, radius: Double, width: Double, startAngle: Double, endAngle: Double, color: ai_cup_22.debugging.Color) {
        this.add(ai_cup_22.debugging.DebugData.Arc(position, radius, width, startAngle, endAngle, color))
    }
    
    fun addRect(bottomLeft: ai_cup_22.model.Vec2, size: ai_cup_22.model.Vec2, color: ai_cup_22.debugging.Color) {
        this.add(ai_cup_22.debugging.DebugData.Rect(bottomLeft, size, color))
    }
    
    fun addPolygon(vertices: Array<ai_cup_22.model.Vec2>, color: ai_cup_22.debugging.Color) {
        this.add(ai_cup_22.debugging.DebugData.Polygon(vertices, color))
    }
    
    fun addGradientPolygon(vertices: Array<ai_cup_22.debugging.ColoredVertex>) {
        this.add(ai_cup_22.debugging.DebugData.GradientPolygon(vertices))
    }
    
    fun addSegment(firstEnd: ai_cup_22.model.Vec2, secondEnd: ai_cup_22.model.Vec2, width: Double, color: ai_cup_22.debugging.Color) {
        this.add(ai_cup_22.debugging.DebugData.Segment(firstEnd, secondEnd, width, color))
    }
    
    fun addGradientSegment(firstEnd: ai_cup_22.model.Vec2, firstColor: ai_cup_22.debugging.Color, secondEnd: ai_cup_22.model.Vec2, secondColor: ai_cup_22.debugging.Color, width: Double) {
        this.add(ai_cup_22.debugging.DebugData.GradientSegment(firstEnd, firstColor, secondEnd, secondColor, width))
    }
    
    fun addPolyLine(vertices: Array<ai_cup_22.model.Vec2>, width: Double, color: ai_cup_22.debugging.Color) {
        this.add(ai_cup_22.debugging.DebugData.PolyLine(vertices, width, color))
    }
    
    fun addGradientPolyLine(vertices: Array<ai_cup_22.debugging.ColoredVertex>, width: Double) {
        this.add(ai_cup_22.debugging.DebugData.GradientPolyLine(vertices, width))
    }

    fun add(debugData: ai_cup_22.debugging.DebugData) {
        this.send(ai_cup_22.debugging.DebugCommand.Add(debugData))
    }
    
    fun clear() {
        this.send(ai_cup_22.debugging.DebugCommand.Clear())
    }
    
    fun setAutoFlush(enable: Boolean) {
        this.send(ai_cup_22.debugging.DebugCommand.SetAutoFlush(enable))
    }
    
    fun flush() {
        this.send(ai_cup_22.debugging.DebugCommand.Flush())
    }

    fun send(command: ai_cup_22.debugging.DebugCommand) {
        try {
            ai_cup_22.codegame.ClientMessage.DebugMessage(command).writeTo(outputStream)
            outputStream.flush()
        } catch (e: IOException) {
            throw RuntimeException(e)
        }
    }

    fun getState(): ai_cup_22.debugging.DebugState {
        try {
            ai_cup_22.codegame.ClientMessage.RequestDebugState().writeTo(outputStream)
            outputStream.flush()
            return ai_cup_22.debugging.DebugState.readFrom(inputStream)
        } catch (e: IOException) {
            throw RuntimeException(e)
        }
    }
}