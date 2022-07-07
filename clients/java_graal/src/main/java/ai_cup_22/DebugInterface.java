package ai_cup_22;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class DebugInterface {
    private InputStream inputStream;
    private OutputStream outputStream;

    public DebugInterface(InputStream inputStream, OutputStream outputStream) {
        this.inputStream = inputStream;
        this.outputStream = outputStream;
    }

    public void addPlacedText(ai_cup_22.model.Vec2 position, String text, ai_cup_22.model.Vec2 alignment, double size, ai_cup_22.debugging.Color color) {
        this.add(new ai_cup_22.debugging.DebugData.PlacedText(position, text, alignment, size, color));
    }
    
    public void addCircle(ai_cup_22.model.Vec2 position, double radius, ai_cup_22.debugging.Color color) {
        this.add(new ai_cup_22.debugging.DebugData.Circle(position, radius, color));
    }
    
    public void addGradientCircle(ai_cup_22.model.Vec2 position, double radius, ai_cup_22.debugging.Color innerColor, ai_cup_22.debugging.Color outerColor) {
        this.add(new ai_cup_22.debugging.DebugData.GradientCircle(position, radius, innerColor, outerColor));
    }
    
    public void addRing(ai_cup_22.model.Vec2 position, double radius, double width, ai_cup_22.debugging.Color color) {
        this.add(new ai_cup_22.debugging.DebugData.Ring(position, radius, width, color));
    }
    
    public void addPie(ai_cup_22.model.Vec2 position, double radius, double startAngle, double endAngle, ai_cup_22.debugging.Color color) {
        this.add(new ai_cup_22.debugging.DebugData.Pie(position, radius, startAngle, endAngle, color));
    }
    
    public void addArc(ai_cup_22.model.Vec2 position, double radius, double width, double startAngle, double endAngle, ai_cup_22.debugging.Color color) {
        this.add(new ai_cup_22.debugging.DebugData.Arc(position, radius, width, startAngle, endAngle, color));
    }
    
    public void addRect(ai_cup_22.model.Vec2 bottomLeft, ai_cup_22.model.Vec2 size, ai_cup_22.debugging.Color color) {
        this.add(new ai_cup_22.debugging.DebugData.Rect(bottomLeft, size, color));
    }
    
    public void addPolygon(ai_cup_22.model.Vec2[] vertices, ai_cup_22.debugging.Color color) {
        this.add(new ai_cup_22.debugging.DebugData.Polygon(vertices, color));
    }
    
    public void addGradientPolygon(ai_cup_22.debugging.ColoredVertex[] vertices) {
        this.add(new ai_cup_22.debugging.DebugData.GradientPolygon(vertices));
    }
    
    public void addSegment(ai_cup_22.model.Vec2 firstEnd, ai_cup_22.model.Vec2 secondEnd, double width, ai_cup_22.debugging.Color color) {
        this.add(new ai_cup_22.debugging.DebugData.Segment(firstEnd, secondEnd, width, color));
    }
    
    public void addGradientSegment(ai_cup_22.model.Vec2 firstEnd, ai_cup_22.debugging.Color firstColor, ai_cup_22.model.Vec2 secondEnd, ai_cup_22.debugging.Color secondColor, double width) {
        this.add(new ai_cup_22.debugging.DebugData.GradientSegment(firstEnd, firstColor, secondEnd, secondColor, width));
    }
    
    public void addPolyLine(ai_cup_22.model.Vec2[] vertices, double width, ai_cup_22.debugging.Color color) {
        this.add(new ai_cup_22.debugging.DebugData.PolyLine(vertices, width, color));
    }
    
    public void addGradientPolyLine(ai_cup_22.debugging.ColoredVertex[] vertices, double width) {
        this.add(new ai_cup_22.debugging.DebugData.GradientPolyLine(vertices, width));
    }

    public void add(ai_cup_22.debugging.DebugData debugData) {
        this.send(new ai_cup_22.debugging.DebugCommand.Add(debugData));
    }
    
    public void clear() {
        this.send(new ai_cup_22.debugging.DebugCommand.Clear());
    }
    
    public void setAutoFlush(boolean enable) {
        this.send(new ai_cup_22.debugging.DebugCommand.SetAutoFlush(enable));
    }
    
    public void flush() {
        this.send(new ai_cup_22.debugging.DebugCommand.Flush());
    }

    public void send(ai_cup_22.debugging.DebugCommand command) {
        try {
            new ai_cup_22.codegame.ClientMessage.DebugMessage(command).writeTo(outputStream);
            outputStream.flush();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public ai_cup_22.debugging.DebugState getState() {
        try {
            new ai_cup_22.codegame.ClientMessage.RequestDebugState().writeTo(outputStream);
            outputStream.flush();
            return ai_cup_22.debugging.DebugState.readFrom(inputStream);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}