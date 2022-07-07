import stream;
import codegame.client_message;
import debugging.debug_data;
import debugging.color;
import debugging.colored_vertex;
import model.vec2;

class DebugInterface
{
    this(Stream stream)
    {
        this.stream = stream;
    }

    void addPlacedText(model.Vec2 position, string text, model.Vec2 alignment, double size, debugging.Color color) {
        add(new debugging.DebugData.PlacedText(position, text, alignment, size, color));
    }
    
    void addCircle(model.Vec2 position, double radius, debugging.Color color) {
        add(new debugging.DebugData.Circle(position, radius, color));
    }
    
    void addGradientCircle(model.Vec2 position, double radius, debugging.Color innerColor, debugging.Color outerColor) {
        add(new debugging.DebugData.GradientCircle(position, radius, innerColor, outerColor));
    }
    
    void addRing(model.Vec2 position, double radius, double width, debugging.Color color) {
        add(new debugging.DebugData.Ring(position, radius, width, color));
    }
    
    void addPie(model.Vec2 position, double radius, double startAngle, double endAngle, debugging.Color color) {
        add(new debugging.DebugData.Pie(position, radius, startAngle, endAngle, color));
    }
    
    void addArc(model.Vec2 position, double radius, double width, double startAngle, double endAngle, debugging.Color color) {
        add(new debugging.DebugData.Arc(position, radius, width, startAngle, endAngle, color));
    }
    
    void addRect(model.Vec2 bottomLeft, model.Vec2 size, debugging.Color color) {
        add(new debugging.DebugData.Rect(bottomLeft, size, color));
    }
    
    void addPolygon(model.Vec2[] vertices, debugging.Color color) {
        add(new debugging.DebugData.Polygon(vertices, color));
    }
    
    void addGradientPolygon(debugging.ColoredVertex[] vertices) {
        add(new debugging.DebugData.GradientPolygon(vertices));
    }
    
    void addSegment(model.Vec2 firstEnd, model.Vec2 secondEnd, double width, debugging.Color color) {
        add(new debugging.DebugData.Segment(firstEnd, secondEnd, width, color));
    }
    
    void addGradientSegment(model.Vec2 firstEnd, debugging.Color firstColor, model.Vec2 secondEnd, debugging.Color secondColor, double width) {
        add(new debugging.DebugData.GradientSegment(firstEnd, firstColor, secondEnd, secondColor, width));
    }
    
    void addPolyLine(model.Vec2[] vertices, double width, debugging.Color color) {
        add(new debugging.DebugData.PolyLine(vertices, width, color));
    }
    
    void addGradientPolyLine(debugging.ColoredVertex[] vertices, double width) {
        add(new debugging.DebugData.GradientPolyLine(vertices, width));
    }

    void add(debugging.DebugData debugData) {
        send(new debugging.DebugCommand.Add(debugData));
    }
    
    void clear() {
        send(new debugging.DebugCommand.Clear());
    }
    
    void setAutoFlush(bool enable) {
        send(new debugging.DebugCommand.SetAutoFlush(enable));
    }
    
    void flush() {
        send(new debugging.DebugCommand.Flush());
    }

    void send(debugging.DebugCommand command)
    {
        new codegame.ClientMessage.DebugMessage(command).writeTo(stream);
        stream.flush();
    }

    debugging.DebugState getState()
    {
        new codegame.ClientMessage.RequestDebugState().writeTo(stream);
        stream.flush();
        return debugging.DebugState.readFrom(stream);
    }

private:
    Stream stream;
}