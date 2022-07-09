package debugout

import (
	"bufio"

	"aicup22/pkg/codegame"
	"aicup22/pkg/debugging"
	"aicup22/pkg/model"
)

type DebugOut struct {
	Reader *bufio.Reader
	Writer *bufio.Writer
}

func (sf DebugOut) AddPlacedText(position model.Vec2, text string, alignment model.Vec2, size float64, color debugging.Color) {
	sf.Add(debugging.NewDebugDataPlacedText(position, text, alignment, size, color))
}

func (sf DebugOut) AddCircle(position model.Vec2, radius float64, color debugging.Color) {
	sf.Add(debugging.NewDebugDataCircle(position, radius, color))
}

func (sf DebugOut) AddGradientCircle(position model.Vec2, radius float64,
	innerColor, outerColor debugging.Color) {
	sf.Add(debugging.NewDebugDataGradientCircle(position, radius, innerColor, outerColor))
}

func (sf DebugOut) AddRing(position model.Vec2,
	radius, width float64,
	color debugging.Color) {
	sf.Add(debugging.NewDebugDataRing(position, radius, width, color))
}

func (sf DebugOut) AddPie(position model.Vec2,
	radius, startAngle, endAngle float64,
	color debugging.Color) {
	sf.Add(debugging.NewDebugDataPie(position, radius, startAngle, endAngle, color))
}

func (sf DebugOut) AddArc(position model.Vec2,
	radius, width, startAngle, endAngle float64,
	color debugging.Color) {
	sf.Add(debugging.NewDebugDataArc(position, radius, width, startAngle, endAngle, color))
}

func (sf DebugOut) AddRect(bottomLeft, size model.Vec2, color debugging.Color) {
	sf.Add(debugging.NewDebugDataRect(bottomLeft, size, color))
}

func (sf DebugOut) AddPolygon(vertices []model.Vec2, color debugging.Color) {
	sf.Add(debugging.NewDebugDataPolygon(vertices, color))
}

func (debugInterface DebugOut) AddGradientPolygon(vertices []debugging.ColoredVertex) {
	debugInterface.Add(debugging.NewDebugDataGradientPolygon(vertices))
}

func (sf DebugOut) AddSegment(firstEnd, secondEnd model.Vec2, width float64, color debugging.Color) {
	sf.Add(debugging.NewDebugDataSegment(firstEnd, secondEnd, width, color))
}

func (sf DebugOut) AddGradientSegment(firstEnd model.Vec2, firstColor debugging.Color, secondEnd model.Vec2, secondColor debugging.Color, width float64) {
	sf.Add(debugging.NewDebugDataGradientSegment(firstEnd, firstColor, secondEnd, secondColor, width))
}

func (sf DebugOut) AddPolyLine(vertices []model.Vec2, width float64, color debugging.Color) {
	sf.Add(debugging.NewDebugDataPolyLine(vertices, width, color))
}

func (sf DebugOut) AddGradientPolyLine(vertices []debugging.ColoredVertex, width float64) {
	sf.Add(debugging.NewDebugDataGradientPolyLine(vertices, width))
}

func (sf DebugOut) Add(debugData debugging.DebugData) {
	sf.Send(debugging.NewDebugCommandAdd(debugData))
}

func (sf DebugOut) Clear() {
	sf.Send(debugging.NewDebugCommandClear())
}

func (sf DebugOut) SetAutoFlush(enable bool) {
	sf.Send(debugging.NewDebugCommandSetAutoFlush(enable))
}

func (sf DebugOut) Flush() {
	sf.Send(debugging.NewDebugCommandFlush())
}

func (sf DebugOut) Send(command debugging.DebugCommand) {
	codegame.ClientMessageDebugMessage{
		Command: command,
	}.Write()
	err := sf.Writer.Flush()
	if err != nil {
		// FIXME: так делать нельзя!!
		panic(err)
	}
}

func (sf DebugOut) GetState() debugging.DebugState {
	codegame.ClientMessageRequestDebugState{}.Write()
	err := sf.Writer.Flush()
	if err != nil {
		// FIXME: так делать нельзя!!
		panic(err)
	}
	return debugging.ReadDebugState()
}
