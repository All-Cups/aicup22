package types

import (
	"bufio"

	"aicup22/pkg/codegame"
	"aicup22/pkg/debugging"
	. "aicup22/pkg/model"
)

type DebugInterface struct {
	Reader *bufio.Reader
	Writer *bufio.Writer
}

func (debugInterface DebugInterface) AddPlacedText(position Vec2, text string, alignment Vec2, size float64, color debugging.Color) {
	debugInterface.Add(debugging.NewDebugDataPlacedText(position, text, alignment, size, color))
}

func (debugInterface DebugInterface) AddCircle(position Vec2, radius float64, color debugging.Color) {
	debugInterface.Add(debugging.NewDebugDataCircle(position, radius, color))
}

func (debugInterface DebugInterface) AddGradientCircle(position Vec2, radius float64, innerColor debugging.Color, outerColor debugging.Color) {
	debugInterface.Add(debugging.NewDebugDataGradientCircle(position, radius, innerColor, outerColor))
}

func (debugInterface DebugInterface) AddRing(position Vec2, radius float64, width float64, color debugging.Color) {
	debugInterface.Add(debugging.NewDebugDataRing(position, radius, width, color))
}

func (debugInterface DebugInterface) AddPie(position Vec2, radius float64, startAngle float64, endAngle float64, color debugging.Color) {
	debugInterface.Add(debugging.NewDebugDataPie(position, radius, startAngle, endAngle, color))
}

func (debugInterface DebugInterface) AddArc(position Vec2, radius float64, width float64, startAngle float64, endAngle float64, color debugging.Color) {
	debugInterface.Add(debugging.NewDebugDataArc(position, radius, width, startAngle, endAngle, color))
}

func (debugInterface DebugInterface) AddRect(bottomLeft Vec2, size Vec2, color debugging.Color) {
	debugInterface.Add(debugging.NewDebugDataRect(bottomLeft, size, color))
}

func (debugInterface DebugInterface) AddPolygon(vertices []Vec2, color debugging.Color) {
	debugInterface.Add(debugging.NewDebugDataPolygon(vertices, color))
}

func (debugInterface DebugInterface) AddGradientPolygon(vertices []debugging.ColoredVertex) {
	debugInterface.Add(debugging.NewDebugDataGradientPolygon(vertices))
}

func (debugInterface DebugInterface) AddSegment(firstEnd Vec2, secondEnd Vec2, width float64, color debugging.Color) {
	debugInterface.Add(debugging.NewDebugDataSegment(firstEnd, secondEnd, width, color))
}

func (debugInterface DebugInterface) AddGradientSegment(firstEnd Vec2, firstColor debugging.Color, secondEnd Vec2, secondColor debugging.Color, width float64) {
	debugInterface.Add(debugging.NewDebugDataGradientSegment(firstEnd, firstColor, secondEnd, secondColor, width))
}

func (debugInterface DebugInterface) AddPolyLine(vertices []Vec2, width float64, color debugging.Color) {
	debugInterface.Add(debugging.NewDebugDataPolyLine(vertices, width, color))
}

func (debugInterface DebugInterface) AddGradientPolyLine(vertices []debugging.ColoredVertex, width float64) {
	debugInterface.Add(debugging.NewDebugDataGradientPolyLine(vertices, width))
}

func (debugInterface DebugInterface) Add(debugData debugging.DebugData) {
	debugInterface.Send(debugging.NewDebugCommandAdd(debugData))
}

func (debugInterface DebugInterface) Clear() {
	debugInterface.Send(debugging.NewDebugCommandClear())
}

func (debugInterface DebugInterface) SetAutoFlush(enable bool) {
	debugInterface.Send(debugging.NewDebugCommandSetAutoFlush(enable))
}

func (debugInterface DebugInterface) Flush() {
	debugInterface.Send(debugging.NewDebugCommandFlush())
}

func (debugInterface DebugInterface) Send(command debugging.DebugCommand) {
	codegame.ClientMessageDebugMessage{
		Command: command,
	}.Write(debugInterface.Writer)
	err := debugInterface.Writer.Flush()
	if err != nil {
		// FIXME: так делать нельзя!!
		panic(err)
	}
}

func (debugInterface DebugInterface) GetState() debugging.DebugState {
	codegame.ClientMessageRequestDebugState{}.Write(debugInterface.Writer)
	err := debugInterface.Writer.Flush()
	if err != nil {
		// FIXME: так делать нельзя!!
		panic(err)
	}
	return debugging.ReadDebugState(debugInterface.Reader)
}
