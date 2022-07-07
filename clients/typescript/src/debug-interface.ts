import { TcpStream } from "./tcp-stream";
import { ClientMessage } from "./codegame/client-message";
import { DebugState } from "./debugging/debug-state";
import { Color } from "./debugging/color";
import { ColoredVertex } from "./debugging/colored-vertex";
import { DebugCommand } from "./debugging/debug-command";
import { DebugData } from "./debugging/debug-data";
import { Vec2 } from "./model/vec2";

export class DebugInterface {
    private stream: TcpStream;

    constructor(stream: TcpStream) {
        this.stream = stream;
    }

    async addPlacedText(position: Vec2, text: string, alignment: Vec2, size: number, color: Color) {
        await this.add(new DebugData.PlacedText(position, text, alignment, size, color));
    }
    
    async addCircle(position: Vec2, radius: number, color: Color) {
        await this.add(new DebugData.Circle(position, radius, color));
    }
    
    async addGradientCircle(position: Vec2, radius: number, innerColor: Color, outerColor: Color) {
        await this.add(new DebugData.GradientCircle(position, radius, innerColor, outerColor));
    }
    
    async addRing(position: Vec2, radius: number, width: number, color: Color) {
        await this.add(new DebugData.Ring(position, radius, width, color));
    }
    
    async addPie(position: Vec2, radius: number, startAngle: number, endAngle: number, color: Color) {
        await this.add(new DebugData.Pie(position, radius, startAngle, endAngle, color));
    }
    
    async addArc(position: Vec2, radius: number, width: number, startAngle: number, endAngle: number, color: Color) {
        await this.add(new DebugData.Arc(position, radius, width, startAngle, endAngle, color));
    }
    
    async addRect(bottomLeft: Vec2, size: Vec2, color: Color) {
        await this.add(new DebugData.Rect(bottomLeft, size, color));
    }
    
    async addPolygon(vertices: Array<Vec2>, color: Color) {
        await this.add(new DebugData.Polygon(vertices, color));
    }
    
    async addGradientPolygon(vertices: Array<ColoredVertex>) {
        await this.add(new DebugData.GradientPolygon(vertices));
    }
    
    async addSegment(firstEnd: Vec2, secondEnd: Vec2, width: number, color: Color) {
        await this.add(new DebugData.Segment(firstEnd, secondEnd, width, color));
    }
    
    async addGradientSegment(firstEnd: Vec2, firstColor: Color, secondEnd: Vec2, secondColor: Color, width: number) {
        await this.add(new DebugData.GradientSegment(firstEnd, firstColor, secondEnd, secondColor, width));
    }
    
    async addPolyLine(vertices: Array<Vec2>, width: number, color: Color) {
        await this.add(new DebugData.PolyLine(vertices, width, color));
    }
    
    async addGradientPolyLine(vertices: Array<ColoredVertex>, width: number) {
        await this.add(new DebugData.GradientPolyLine(vertices, width));
    }

    async add(debugData: DebugData) {
        await this.send(new DebugCommand.Add(debugData));
    }
    
    async clear() {
        await this.send(new DebugCommand.Clear());
    }
    
    async setAutoFlush(enable: boolean) {
        await this.send(new DebugCommand.SetAutoFlush(enable));
    }
    
    async flush() {
        await this.send(new DebugCommand.Flush());
    }

    async send(command: DebugCommand) {
        await (new ClientMessage.DebugMessage(command)).writeTo(this.stream);
        await this.stream.flush();
    }

    async getState(): Promise<DebugState> {
        await (new ClientMessage.RequestDebugState()).writeTo(this.stream);
        await this.stream.flush();
        return await DebugState.readFrom(this.stream);
    }
}