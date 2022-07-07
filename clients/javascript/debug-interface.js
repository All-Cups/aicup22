const ClientMessage = require('./codegame/client-message');
const DebugState = require('./debugging/debug-state');
const DebugCommand = require('./debugging/debug-command');
const DebugData = require('./debugging/debug-data');

class DebugInterface {
    constructor(stream) {
        this.stream = stream;
    }

    async addPlacedText(position, text, alignment, size, color) {
        await this.add(new DebugData.PlacedText(position, text, alignment, size, color));
    }
    
    async addCircle(position, radius, color) {
        await this.add(new DebugData.Circle(position, radius, color));
    }
    
    async addGradientCircle(position, radius, innerColor, outerColor) {
        await this.add(new DebugData.GradientCircle(position, radius, innerColor, outerColor));
    }
    
    async addRing(position, radius, width, color) {
        await this.add(new DebugData.Ring(position, radius, width, color));
    }
    
    async addPie(position, radius, startAngle, endAngle, color) {
        await this.add(new DebugData.Pie(position, radius, startAngle, endAngle, color));
    }
    
    async addArc(position, radius, width, startAngle, endAngle, color) {
        await this.add(new DebugData.Arc(position, radius, width, startAngle, endAngle, color));
    }
    
    async addRect(bottomLeft, size, color) {
        await this.add(new DebugData.Rect(bottomLeft, size, color));
    }
    
    async addPolygon(vertices, color) {
        await this.add(new DebugData.Polygon(vertices, color));
    }
    
    async addGradientPolygon(vertices) {
        await this.add(new DebugData.GradientPolygon(vertices));
    }
    
    async addSegment(firstEnd, secondEnd, width, color) {
        await this.add(new DebugData.Segment(firstEnd, secondEnd, width, color));
    }
    
    async addGradientSegment(firstEnd, firstColor, secondEnd, secondColor, width) {
        await this.add(new DebugData.GradientSegment(firstEnd, firstColor, secondEnd, secondColor, width));
    }
    
    async addPolyLine(vertices, width, color) {
        await this.add(new DebugData.PolyLine(vertices, width, color));
    }
    
    async addGradientPolyLine(vertices, width) {
        await this.add(new DebugData.GradientPolyLine(vertices, width));
    }

    async add(debugData) {
        await this.send(new DebugCommand.Add(debugData));
    }
    
    async clear() {
        await this.send(new DebugCommand.Clear());
    }
    
    async setAutoFlush(enable) {
        await this.send(new DebugCommand.SetAutoFlush(enable));
    }
    
    async flush() {
        await this.send(new DebugCommand.Flush());
    }

    async send(command) {
        await (new ClientMessage.DebugMessage(command)).writeTo(this.stream);
        await this.stream.flush();
    }

    async getState() {
        await (new ClientMessage.RequestDebugState()).writeTo(this.stream);
        await this.stream.flush();
        return await DebugState.readFrom(this.stream);
    }
}

module.exports = DebugInterface;