import java.io.InputStream
import java.io.OutputStream

class DebugInterface(private val inputStream: InputStream, private val outputStream: OutputStream) {
  def addPlacedText(position: ai_cup_22.model.Vec2, text: String, alignment: ai_cup_22.model.Vec2, size: Double, color: ai_cup_22.debugging.Color): scala.Unit = {
      add(ai_cup_22.debugging.DebugData.PlacedText(position, text, alignment, size, color))
  }
  
  def addCircle(position: ai_cup_22.model.Vec2, radius: Double, color: ai_cup_22.debugging.Color): scala.Unit = {
      add(ai_cup_22.debugging.DebugData.Circle(position, radius, color))
  }
  
  def addGradientCircle(position: ai_cup_22.model.Vec2, radius: Double, innerColor: ai_cup_22.debugging.Color, outerColor: ai_cup_22.debugging.Color): scala.Unit = {
      add(ai_cup_22.debugging.DebugData.GradientCircle(position, radius, innerColor, outerColor))
  }
  
  def addRing(position: ai_cup_22.model.Vec2, radius: Double, width: Double, color: ai_cup_22.debugging.Color): scala.Unit = {
      add(ai_cup_22.debugging.DebugData.Ring(position, radius, width, color))
  }
  
  def addPie(position: ai_cup_22.model.Vec2, radius: Double, startAngle: Double, endAngle: Double, color: ai_cup_22.debugging.Color): scala.Unit = {
      add(ai_cup_22.debugging.DebugData.Pie(position, radius, startAngle, endAngle, color))
  }
  
  def addArc(position: ai_cup_22.model.Vec2, radius: Double, width: Double, startAngle: Double, endAngle: Double, color: ai_cup_22.debugging.Color): scala.Unit = {
      add(ai_cup_22.debugging.DebugData.Arc(position, radius, width, startAngle, endAngle, color))
  }
  
  def addRect(bottomLeft: ai_cup_22.model.Vec2, size: ai_cup_22.model.Vec2, color: ai_cup_22.debugging.Color): scala.Unit = {
      add(ai_cup_22.debugging.DebugData.Rect(bottomLeft, size, color))
  }
  
  def addPolygon(vertices: Seq[ai_cup_22.model.Vec2], color: ai_cup_22.debugging.Color): scala.Unit = {
      add(ai_cup_22.debugging.DebugData.Polygon(vertices, color))
  }
  
  def addGradientPolygon(vertices: Seq[ai_cup_22.debugging.ColoredVertex]): scala.Unit = {
      add(ai_cup_22.debugging.DebugData.GradientPolygon(vertices))
  }
  
  def addSegment(firstEnd: ai_cup_22.model.Vec2, secondEnd: ai_cup_22.model.Vec2, width: Double, color: ai_cup_22.debugging.Color): scala.Unit = {
      add(ai_cup_22.debugging.DebugData.Segment(firstEnd, secondEnd, width, color))
  }
  
  def addGradientSegment(firstEnd: ai_cup_22.model.Vec2, firstColor: ai_cup_22.debugging.Color, secondEnd: ai_cup_22.model.Vec2, secondColor: ai_cup_22.debugging.Color, width: Double): scala.Unit = {
      add(ai_cup_22.debugging.DebugData.GradientSegment(firstEnd, firstColor, secondEnd, secondColor, width))
  }
  
  def addPolyLine(vertices: Seq[ai_cup_22.model.Vec2], width: Double, color: ai_cup_22.debugging.Color): scala.Unit = {
      add(ai_cup_22.debugging.DebugData.PolyLine(vertices, width, color))
  }
  
  def addGradientPolyLine(vertices: Seq[ai_cup_22.debugging.ColoredVertex], width: Double): scala.Unit = {
      add(ai_cup_22.debugging.DebugData.GradientPolyLine(vertices, width))
  }

  def add(debugData: ai_cup_22.debugging.DebugData): scala.Unit = {
      send(ai_cup_22.debugging.DebugCommand.Add(debugData))
  }
  
  def clear(): scala.Unit = {
      send(ai_cup_22.debugging.DebugCommand.Clear())
  }
  
  def setAutoFlush(enable: Boolean): scala.Unit = {
      send(ai_cup_22.debugging.DebugCommand.SetAutoFlush(enable))
  }
  
  def flush(): scala.Unit = {
      send(ai_cup_22.debugging.DebugCommand.Flush())
  }

  def send(command: ai_cup_22.debugging.DebugCommand): scala.Unit = {
    ai_cup_22.codegame.ClientMessage.DebugMessage(command).writeTo(outputStream)
    outputStream.flush()
  }

  def getState(): ai_cup_22.debugging.DebugState = {
    ai_cup_22.codegame.ClientMessage.RequestDebugState().writeTo(outputStream)
    outputStream.flush()
    ai_cup_22.debugging.DebugState.readFrom(inputStream)
  }
}