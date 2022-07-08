class DebugInterface {
    private let inputStream: BufferedInputStream
    private let outputStream: BufferedOutputStream

    init(_ inputStream: BufferedInputStream, _ outputStream: BufferedOutputStream) {
        self.inputStream = inputStream
        self.outputStream = outputStream
    }

    func send(_ command: DebugCommand) {
        ClientMessage.debugMessage(command: command).writeTo(outputStream)
        outputStream.flush()
    }

    func getState() -> DebugState {
        ClientMessage.requestDebugState.writeTo(outputStream)
        outputStream.flush()
        return DebugState.readFrom(inputStream)
    }

    func addPlacedText(_ position: Vec2, _ text: String, _ alignment: Vec2, _ size: Double, _ color: Color) {
        self.add(DebugData.placedText(position: position, text: text, alignment: alignment, size: size, color: color))
    }
    func addCircle(_ position: Vec2, _ radius: Double, _ color: Color) {
        self.add(DebugData.circle(position: position, radius: radius, color: color))
    }
    func addGradientCircle(_ position: Vec2, _ radius: Double, _ innerColor: Color, _ outerColor: Color) {
        self.add(DebugData.gradientCircle(position: position, radius: radius, innerColor: innerColor, outerColor: outerColor))
    }
    func addRing(_ position: Vec2, _ radius: Double, _ width: Double, _ color: Color) {
        self.add(DebugData.ring(position: position, radius: radius, width: width, color: color))
    }
    func addPie(_ position: Vec2, _ radius: Double, _ startAngle: Double, _ endAngle: Double, _ color: Color) {
        self.add(DebugData.pie(position: position, radius: radius, startAngle: startAngle, endAngle: endAngle, color: color))
    }
    func addArc(_ position: Vec2, _ radius: Double, _ width: Double, _ startAngle: Double, _ endAngle: Double, _ color: Color) {
        self.add(DebugData.arc(position: position, radius: radius, width: width, startAngle: startAngle, endAngle: endAngle, color: color))
    }
    func addRect(_ bottomLeft: Vec2, _ size: Vec2, _ color: Color) {
        self.add(DebugData.rect(bottomLeft: bottomLeft, size: size, color: color))
    }
    func addPolygon(_ vertices: [Vec2], _ color: Color) {
        self.add(DebugData.polygon(vertices: vertices, color: color))
    }
    func addGradientPolygon(_ vertices: [ColoredVertex]) {
        self.add(DebugData.gradientPolygon(vertices: vertices))
    }
    func addSegment(_ firstEnd: Vec2, _ secondEnd: Vec2, _ width: Double, _ color: Color) {
        self.add(DebugData.segment(firstEnd: firstEnd, secondEnd: secondEnd, width: width, color: color))
    }
    func addGradientSegment(_ firstEnd: Vec2, _ firstColor: Color, _ secondEnd: Vec2, _ secondColor: Color, _ width: Double) {
        self.add(DebugData.gradientSegment(firstEnd: firstEnd, firstColor: firstColor, secondEnd: secondEnd, secondColor: secondColor, width: width))
    }
    func addPolyLine(_ vertices: [Vec2], _ width: Double, _ color: Color) {
        self.add(DebugData.polyLine(vertices: vertices, width: width, color: color))
    }
    func addGradientPolyLine(_ vertices: [ColoredVertex], _ width: Double) {
        self.add(DebugData.gradientPolyLine(vertices: vertices, width: width))
    }

    func add(_ debugData: DebugData) {
        self.send(DebugCommand.add(debugData: debugData))
    }
    func clear() {
        self.send(DebugCommand.clear)
    }
    func setAutoFlush(_ enable: Bool) {
        self.send(DebugCommand.setAutoFlush(enable: enable))
    }
    func flush() {
        self.send(DebugCommand.flush)
    }
}
