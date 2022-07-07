package main

import (
    "bufio"
    . "ai_cup_22/model"
    . "ai_cup_22/codegame"
    . "ai_cup_22/debugging"
)

type DebugInterface struct {
    Reader *bufio.Reader
    Writer *bufio.Writer
}

func (debugInterface DebugInterface) AddPlacedText(position Vec2, text string, alignment Vec2, size float64, color Color) {
    debugInterface.Add(NewDebugDataPlacedText(position, text, alignment, size, color))
}

func (debugInterface DebugInterface) AddCircle(position Vec2, radius float64, color Color) {
    debugInterface.Add(NewDebugDataCircle(position, radius, color))
}

func (debugInterface DebugInterface) AddGradientCircle(position Vec2, radius float64, innerColor Color, outerColor Color) {
    debugInterface.Add(NewDebugDataGradientCircle(position, radius, innerColor, outerColor))
}

func (debugInterface DebugInterface) AddRing(position Vec2, radius float64, width float64, color Color) {
    debugInterface.Add(NewDebugDataRing(position, radius, width, color))
}

func (debugInterface DebugInterface) AddPie(position Vec2, radius float64, startAngle float64, endAngle float64, color Color) {
    debugInterface.Add(NewDebugDataPie(position, radius, startAngle, endAngle, color))
}

func (debugInterface DebugInterface) AddArc(position Vec2, radius float64, width float64, startAngle float64, endAngle float64, color Color) {
    debugInterface.Add(NewDebugDataArc(position, radius, width, startAngle, endAngle, color))
}

func (debugInterface DebugInterface) AddRect(bottomLeft Vec2, size Vec2, color Color) {
    debugInterface.Add(NewDebugDataRect(bottomLeft, size, color))
}

func (debugInterface DebugInterface) AddPolygon(vertices []Vec2, color Color) {
    debugInterface.Add(NewDebugDataPolygon(vertices, color))
}

func (debugInterface DebugInterface) AddGradientPolygon(vertices []ColoredVertex) {
    debugInterface.Add(NewDebugDataGradientPolygon(vertices))
}

func (debugInterface DebugInterface) AddSegment(firstEnd Vec2, secondEnd Vec2, width float64, color Color) {
    debugInterface.Add(NewDebugDataSegment(firstEnd, secondEnd, width, color))
}

func (debugInterface DebugInterface) AddGradientSegment(firstEnd Vec2, firstColor Color, secondEnd Vec2, secondColor Color, width float64) {
    debugInterface.Add(NewDebugDataGradientSegment(firstEnd, firstColor, secondEnd, secondColor, width))
}

func (debugInterface DebugInterface) AddPolyLine(vertices []Vec2, width float64, color Color) {
    debugInterface.Add(NewDebugDataPolyLine(vertices, width, color))
}

func (debugInterface DebugInterface) AddGradientPolyLine(vertices []ColoredVertex, width float64) {
    debugInterface.Add(NewDebugDataGradientPolyLine(vertices, width))
}

func (debugInterface DebugInterface) Add(debugData DebugData) {
    debugInterface.Send(NewDebugCommandAdd(debugData))
}

func (debugInterface DebugInterface) Clear() {
    debugInterface.Send(NewDebugCommandClear())
}

func (debugInterface DebugInterface) SetAutoFlush(enable bool) {
    debugInterface.Send(NewDebugCommandSetAutoFlush(enable))
}

func (debugInterface DebugInterface) Flush() {
    debugInterface.Send(NewDebugCommandFlush())
}

func (debugInterface DebugInterface) Send(command DebugCommand) {
    ClientMessageDebugMessage{
        Command: command,
    }.Write(debugInterface.Writer)
    err := debugInterface.Writer.Flush()
    if err != nil {
        panic(err)
    }
}

func (debugInterface DebugInterface) GetState() DebugState {
    ClientMessageRequestDebugState{}.Write(debugInterface.Writer)
    err := debugInterface.Writer.Flush()
    if err != nil {
        panic(err)
    }
    return ReadDebugState(debugInterface.Reader)
}