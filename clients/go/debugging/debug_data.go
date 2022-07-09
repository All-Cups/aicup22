package debugging

import (
	"fmt"
	"io"

	. "aicup22/model"

	. "aicup22/stream"
)

// Data for debug rendering
type DebugData interface {
	// Write DebugData to writer
	Write(writer io.Writer)

	// Get string representation of DebugData
	String() string
}

// Read DebugData from reader
func ReadDebugData(reader io.Reader) DebugData {
	switch ReadInt32(reader) {
	case 0:
		return ReadDebugDataPlacedText(reader)
	case 1:
		return ReadDebugDataCircle(reader)
	case 2:
		return ReadDebugDataGradientCircle(reader)
	case 3:
		return ReadDebugDataRing(reader)
	case 4:
		return ReadDebugDataPie(reader)
	case 5:
		return ReadDebugDataArc(reader)
	case 6:
		return ReadDebugDataRect(reader)
	case 7:
		return ReadDebugDataPolygon(reader)
	case 8:
		return ReadDebugDataGradientPolygon(reader)
	case 9:
		return ReadDebugDataSegment(reader)
	case 10:
		return ReadDebugDataGradientSegment(reader)
	case 11:
		return ReadDebugDataPolyLine(reader)
	case 12:
		return ReadDebugDataGradientPolyLine(reader)
	}
	panic("Unexpected tag value")
}

// Text
type DebugDataPlacedText struct {
	// Position
	Position Vec2
	// Text
	Text string
	// Alignment, separate for x and y. From 0 to 1. 0.5 - center alignment
	Alignment Vec2
	// Size
	Size float64
	// Color
	Color Color
}

func NewDebugDataPlacedText(position Vec2, text string, alignment Vec2, size float64, color Color) DebugDataPlacedText {
	return DebugDataPlacedText{
		Position:  position,
		Text:      text,
		Alignment: alignment,
		Size:      size,
		Color:     color,
	}
}

// Read PlacedText from reader
func ReadDebugDataPlacedText(reader io.Reader) DebugDataPlacedText {
	var position Vec2
	position = ReadVec2(reader)
	var text string
	text = ReadString(reader)
	var alignment Vec2
	alignment = ReadVec2(reader)
	var size float64
	size = ReadFloat64(reader)
	var color Color
	color = ReadColor(reader)
	return DebugDataPlacedText{
		Position:  position,
		Text:      text,
		Alignment: alignment,
		Size:      size,
		Color:     color,
	}
}

// Write PlacedText to writer
func (debugDataPlacedText DebugDataPlacedText) Write(writer io.Writer) {
	WriteInt32(writer, 0)
	position := debugDataPlacedText.Position
	position.Write(writer)
	text := debugDataPlacedText.Text
	WriteString(writer, text)
	alignment := debugDataPlacedText.Alignment
	alignment.Write(writer)
	size := debugDataPlacedText.Size
	WriteFloat64(writer, size)
	color := debugDataPlacedText.Color
	color.Write(writer)
}

// Get string representation of PlacedText
func (debugDataPlacedText DebugDataPlacedText) String() string {
	stringResult := "{ "
	stringResult += "Position: "
	position := debugDataPlacedText.Position
	stringResult += position.String()
	stringResult += ", "
	stringResult += "Text: "
	text := debugDataPlacedText.Text
	stringResult += "\"" + text + "\""
	stringResult += ", "
	stringResult += "Alignment: "
	alignment := debugDataPlacedText.Alignment
	stringResult += alignment.String()
	stringResult += ", "
	stringResult += "Size: "
	size := debugDataPlacedText.Size
	stringResult += fmt.Sprint(size)
	stringResult += ", "
	stringResult += "Color: "
	color := debugDataPlacedText.Color
	stringResult += color.String()
	stringResult += " }"
	return stringResult
}

// Circle
type DebugDataCircle struct {
	// Position of the center
	Position Vec2
	// Radius
	Radius float64
	// Color
	Color Color
}

func NewDebugDataCircle(position Vec2, radius float64, color Color) DebugDataCircle {
	return DebugDataCircle{
		Position: position,
		Radius:   radius,
		Color:    color,
	}
}

// Read Circle from reader
func ReadDebugDataCircle(reader io.Reader) DebugDataCircle {
	var position Vec2
	position = ReadVec2(reader)
	var radius float64
	radius = ReadFloat64(reader)
	var color Color
	color = ReadColor(reader)
	return DebugDataCircle{
		Position: position,
		Radius:   radius,
		Color:    color,
	}
}

// Write Circle to writer
func (debugDataCircle DebugDataCircle) Write(writer io.Writer) {
	WriteInt32(writer, 1)
	position := debugDataCircle.Position
	position.Write(writer)
	radius := debugDataCircle.Radius
	WriteFloat64(writer, radius)
	color := debugDataCircle.Color
	color.Write(writer)
}

// Get string representation of Circle
func (debugDataCircle DebugDataCircle) String() string {
	stringResult := "{ "
	stringResult += "Position: "
	position := debugDataCircle.Position
	stringResult += position.String()
	stringResult += ", "
	stringResult += "Radius: "
	radius := debugDataCircle.Radius
	stringResult += fmt.Sprint(radius)
	stringResult += ", "
	stringResult += "Color: "
	color := debugDataCircle.Color
	stringResult += color.String()
	stringResult += " }"
	return stringResult
}

// Circle with gradient fill
type DebugDataGradientCircle struct {
	// Position of the center
	Position Vec2
	// Radius
	Radius float64
	// Color of the center
	InnerColor Color
	// Color of the edge
	OuterColor Color
}

func NewDebugDataGradientCircle(position Vec2, radius float64, innerColor Color, outerColor Color) DebugDataGradientCircle {
	return DebugDataGradientCircle{
		Position:   position,
		Radius:     radius,
		InnerColor: innerColor,
		OuterColor: outerColor,
	}
}

// Read GradientCircle from reader
func ReadDebugDataGradientCircle(reader io.Reader) DebugDataGradientCircle {
	var position Vec2
	position = ReadVec2(reader)
	var radius float64
	radius = ReadFloat64(reader)
	var innerColor Color
	innerColor = ReadColor(reader)
	var outerColor Color
	outerColor = ReadColor(reader)
	return DebugDataGradientCircle{
		Position:   position,
		Radius:     radius,
		InnerColor: innerColor,
		OuterColor: outerColor,
	}
}

// Write GradientCircle to writer
func (debugDataGradientCircle DebugDataGradientCircle) Write(writer io.Writer) {
	WriteInt32(writer, 2)
	position := debugDataGradientCircle.Position
	position.Write(writer)
	radius := debugDataGradientCircle.Radius
	WriteFloat64(writer, radius)
	innerColor := debugDataGradientCircle.InnerColor
	innerColor.Write(writer)
	outerColor := debugDataGradientCircle.OuterColor
	outerColor.Write(writer)
}

// Get string representation of GradientCircle
func (debugDataGradientCircle DebugDataGradientCircle) String() string {
	stringResult := "{ "
	stringResult += "Position: "
	position := debugDataGradientCircle.Position
	stringResult += position.String()
	stringResult += ", "
	stringResult += "Radius: "
	radius := debugDataGradientCircle.Radius
	stringResult += fmt.Sprint(radius)
	stringResult += ", "
	stringResult += "InnerColor: "
	innerColor := debugDataGradientCircle.InnerColor
	stringResult += innerColor.String()
	stringResult += ", "
	stringResult += "OuterColor: "
	outerColor := debugDataGradientCircle.OuterColor
	stringResult += outerColor.String()
	stringResult += " }"
	return stringResult
}

// Ring
type DebugDataRing struct {
	// Position of the center
	Position Vec2
	// Radius
	Radius float64
	// Width
	Width float64
	// Color
	Color Color
}

func NewDebugDataRing(position Vec2, radius float64, width float64, color Color) DebugDataRing {
	return DebugDataRing{
		Position: position,
		Radius:   radius,
		Width:    width,
		Color:    color,
	}
}

// Read Ring from reader
func ReadDebugDataRing(reader io.Reader) DebugDataRing {
	var position Vec2
	position = ReadVec2(reader)
	var radius float64
	radius = ReadFloat64(reader)
	var width float64
	width = ReadFloat64(reader)
	var color Color
	color = ReadColor(reader)
	return DebugDataRing{
		Position: position,
		Radius:   radius,
		Width:    width,
		Color:    color,
	}
}

// Write Ring to writer
func (debugDataRing DebugDataRing) Write(writer io.Writer) {
	WriteInt32(writer, 3)
	position := debugDataRing.Position
	position.Write(writer)
	radius := debugDataRing.Radius
	WriteFloat64(writer, radius)
	width := debugDataRing.Width
	WriteFloat64(writer, width)
	color := debugDataRing.Color
	color.Write(writer)
}

// Get string representation of Ring
func (debugDataRing DebugDataRing) String() string {
	stringResult := "{ "
	stringResult += "Position: "
	position := debugDataRing.Position
	stringResult += position.String()
	stringResult += ", "
	stringResult += "Radius: "
	radius := debugDataRing.Radius
	stringResult += fmt.Sprint(radius)
	stringResult += ", "
	stringResult += "Width: "
	width := debugDataRing.Width
	stringResult += fmt.Sprint(width)
	stringResult += ", "
	stringResult += "Color: "
	color := debugDataRing.Color
	stringResult += color.String()
	stringResult += " }"
	return stringResult
}

// Sector of a circle
type DebugDataPie struct {
	// Position of the center
	Position Vec2
	// Radius
	Radius float64
	// Start angle
	StartAngle float64
	// End angle
	EndAngle float64
	// Color
	Color Color
}

func NewDebugDataPie(position Vec2, radius float64, startAngle float64, endAngle float64, color Color) DebugDataPie {
	return DebugDataPie{
		Position:   position,
		Radius:     radius,
		StartAngle: startAngle,
		EndAngle:   endAngle,
		Color:      color,
	}
}

// Read Pie from reader
func ReadDebugDataPie(reader io.Reader) DebugDataPie {
	var position Vec2
	position = ReadVec2(reader)
	var radius float64
	radius = ReadFloat64(reader)
	var startAngle float64
	startAngle = ReadFloat64(reader)
	var endAngle float64
	endAngle = ReadFloat64(reader)
	var color Color
	color = ReadColor(reader)
	return DebugDataPie{
		Position:   position,
		Radius:     radius,
		StartAngle: startAngle,
		EndAngle:   endAngle,
		Color:      color,
	}
}

// Write Pie to writer
func (debugDataPie DebugDataPie) Write(writer io.Writer) {
	WriteInt32(writer, 4)
	position := debugDataPie.Position
	position.Write(writer)
	radius := debugDataPie.Radius
	WriteFloat64(writer, radius)
	startAngle := debugDataPie.StartAngle
	WriteFloat64(writer, startAngle)
	endAngle := debugDataPie.EndAngle
	WriteFloat64(writer, endAngle)
	color := debugDataPie.Color
	color.Write(writer)
}

// Get string representation of Pie
func (debugDataPie DebugDataPie) String() string {
	stringResult := "{ "
	stringResult += "Position: "
	position := debugDataPie.Position
	stringResult += position.String()
	stringResult += ", "
	stringResult += "Radius: "
	radius := debugDataPie.Radius
	stringResult += fmt.Sprint(radius)
	stringResult += ", "
	stringResult += "StartAngle: "
	startAngle := debugDataPie.StartAngle
	stringResult += fmt.Sprint(startAngle)
	stringResult += ", "
	stringResult += "EndAngle: "
	endAngle := debugDataPie.EndAngle
	stringResult += fmt.Sprint(endAngle)
	stringResult += ", "
	stringResult += "Color: "
	color := debugDataPie.Color
	stringResult += color.String()
	stringResult += " }"
	return stringResult
}

// Arc
type DebugDataArc struct {
	// Position of the center
	Position Vec2
	// Radius
	Radius float64
	// Width
	Width float64
	// Start angle
	StartAngle float64
	// End angle
	EndAngle float64
	// Color
	Color Color
}

func NewDebugDataArc(position Vec2, radius float64, width float64, startAngle float64, endAngle float64, color Color) DebugDataArc {
	return DebugDataArc{
		Position:   position,
		Radius:     radius,
		Width:      width,
		StartAngle: startAngle,
		EndAngle:   endAngle,
		Color:      color,
	}
}

// Read Arc from reader
func ReadDebugDataArc(reader io.Reader) DebugDataArc {
	var position Vec2
	position = ReadVec2(reader)
	var radius float64
	radius = ReadFloat64(reader)
	var width float64
	width = ReadFloat64(reader)
	var startAngle float64
	startAngle = ReadFloat64(reader)
	var endAngle float64
	endAngle = ReadFloat64(reader)
	var color Color
	color = ReadColor(reader)
	return DebugDataArc{
		Position:   position,
		Radius:     radius,
		Width:      width,
		StartAngle: startAngle,
		EndAngle:   endAngle,
		Color:      color,
	}
}

// Write Arc to writer
func (debugDataArc DebugDataArc) Write(writer io.Writer) {
	WriteInt32(writer, 5)
	position := debugDataArc.Position
	position.Write(writer)
	radius := debugDataArc.Radius
	WriteFloat64(writer, radius)
	width := debugDataArc.Width
	WriteFloat64(writer, width)
	startAngle := debugDataArc.StartAngle
	WriteFloat64(writer, startAngle)
	endAngle := debugDataArc.EndAngle
	WriteFloat64(writer, endAngle)
	color := debugDataArc.Color
	color.Write(writer)
}

// Get string representation of Arc
func (debugDataArc DebugDataArc) String() string {
	stringResult := "{ "
	stringResult += "Position: "
	position := debugDataArc.Position
	stringResult += position.String()
	stringResult += ", "
	stringResult += "Radius: "
	radius := debugDataArc.Radius
	stringResult += fmt.Sprint(radius)
	stringResult += ", "
	stringResult += "Width: "
	width := debugDataArc.Width
	stringResult += fmt.Sprint(width)
	stringResult += ", "
	stringResult += "StartAngle: "
	startAngle := debugDataArc.StartAngle
	stringResult += fmt.Sprint(startAngle)
	stringResult += ", "
	stringResult += "EndAngle: "
	endAngle := debugDataArc.EndAngle
	stringResult += fmt.Sprint(endAngle)
	stringResult += ", "
	stringResult += "Color: "
	color := debugDataArc.Color
	stringResult += color.String()
	stringResult += " }"
	return stringResult
}

// Rectancle
type DebugDataRect struct {
	// Bottom left position
	BottomLeft Vec2
	// Size
	Size Vec2
	// Color
	Color Color
}

func NewDebugDataRect(bottomLeft Vec2, size Vec2, color Color) DebugDataRect {
	return DebugDataRect{
		BottomLeft: bottomLeft,
		Size:       size,
		Color:      color,
	}
}

// Read Rect from reader
func ReadDebugDataRect(reader io.Reader) DebugDataRect {
	var bottomLeft Vec2
	bottomLeft = ReadVec2(reader)
	var size Vec2
	size = ReadVec2(reader)
	var color Color
	color = ReadColor(reader)
	return DebugDataRect{
		BottomLeft: bottomLeft,
		Size:       size,
		Color:      color,
	}
}

// Write Rect to writer
func (debugDataRect DebugDataRect) Write(writer io.Writer) {
	WriteInt32(writer, 6)
	bottomLeft := debugDataRect.BottomLeft
	bottomLeft.Write(writer)
	size := debugDataRect.Size
	size.Write(writer)
	color := debugDataRect.Color
	color.Write(writer)
}

// Get string representation of Rect
func (debugDataRect DebugDataRect) String() string {
	stringResult := "{ "
	stringResult += "BottomLeft: "
	bottomLeft := debugDataRect.BottomLeft
	stringResult += bottomLeft.String()
	stringResult += ", "
	stringResult += "Size: "
	size := debugDataRect.Size
	stringResult += size.String()
	stringResult += ", "
	stringResult += "Color: "
	color := debugDataRect.Color
	stringResult += color.String()
	stringResult += " }"
	return stringResult
}

// Polygon (convex)
type DebugDataPolygon struct {
	// Positions of vertices in order
	Vertices []Vec2
	// Color
	Color Color
}

func NewDebugDataPolygon(vertices []Vec2, color Color) DebugDataPolygon {
	return DebugDataPolygon{
		Vertices: vertices,
		Color:    color,
	}
}

// Read Polygon from reader
func ReadDebugDataPolygon(reader io.Reader) DebugDataPolygon {
	var vertices []Vec2
	vertices = make([]Vec2, ReadInt32(reader))
	for verticesIndex := range vertices {
		var verticesElement Vec2
		verticesElement = ReadVec2(reader)
		vertices[verticesIndex] = verticesElement
	}
	var color Color
	color = ReadColor(reader)
	return DebugDataPolygon{
		Vertices: vertices,
		Color:    color,
	}
}

// Write Polygon to writer
func (debugDataPolygon DebugDataPolygon) Write(writer io.Writer) {
	WriteInt32(writer, 7)
	vertices := debugDataPolygon.Vertices
	WriteInt32(writer, int32(len(vertices)))
	for _, verticesElement := range vertices {
		verticesElement.Write(writer)
	}
	color := debugDataPolygon.Color
	color.Write(writer)
}

// Get string representation of Polygon
func (debugDataPolygon DebugDataPolygon) String() string {
	stringResult := "{ "
	stringResult += "Vertices: "
	vertices := debugDataPolygon.Vertices
	stringResult += "[ "
	for verticesIndex, verticesElement := range vertices {
		if verticesIndex != 0 {
			stringResult += ", "
		}
		stringResult += verticesElement.String()
	}
	stringResult += " ]"
	stringResult += ", "
	stringResult += "Color: "
	color := debugDataPolygon.Color
	stringResult += color.String()
	stringResult += " }"
	return stringResult
}

// Polygon with gradient fill
type DebugDataGradientPolygon struct {
	// List of vertices in order
	Vertices []ColoredVertex
}

func NewDebugDataGradientPolygon(vertices []ColoredVertex) DebugDataGradientPolygon {
	return DebugDataGradientPolygon{
		Vertices: vertices,
	}
}

// Read GradientPolygon from reader
func ReadDebugDataGradientPolygon(reader io.Reader) DebugDataGradientPolygon {
	var vertices []ColoredVertex
	vertices = make([]ColoredVertex, ReadInt32(reader))
	for verticesIndex := range vertices {
		var verticesElement ColoredVertex
		verticesElement = ReadColoredVertex(reader)
		vertices[verticesIndex] = verticesElement
	}
	return DebugDataGradientPolygon{
		Vertices: vertices,
	}
}

// Write GradientPolygon to writer
func (debugDataGradientPolygon DebugDataGradientPolygon) Write(writer io.Writer) {
	WriteInt32(writer, 8)
	vertices := debugDataGradientPolygon.Vertices
	WriteInt32(writer, int32(len(vertices)))
	for _, verticesElement := range vertices {
		verticesElement.Write(writer)
	}
}

// Get string representation of GradientPolygon
func (debugDataGradientPolygon DebugDataGradientPolygon) String() string {
	stringResult := "{ "
	stringResult += "Vertices: "
	vertices := debugDataGradientPolygon.Vertices
	stringResult += "[ "
	for verticesIndex, verticesElement := range vertices {
		if verticesIndex != 0 {
			stringResult += ", "
		}
		stringResult += verticesElement.String()
	}
	stringResult += " ]"
	stringResult += " }"
	return stringResult
}

// Segment
type DebugDataSegment struct {
	// Position of the first end
	FirstEnd Vec2
	// Position of the second end
	SecondEnd Vec2
	// Width
	Width float64
	// Color
	Color Color
}

func NewDebugDataSegment(firstEnd Vec2, secondEnd Vec2, width float64, color Color) DebugDataSegment {
	return DebugDataSegment{
		FirstEnd:  firstEnd,
		SecondEnd: secondEnd,
		Width:     width,
		Color:     color,
	}
}

// Read Segment from reader
func ReadDebugDataSegment(reader io.Reader) DebugDataSegment {
	var firstEnd Vec2
	firstEnd = ReadVec2(reader)
	var secondEnd Vec2
	secondEnd = ReadVec2(reader)
	var width float64
	width = ReadFloat64(reader)
	var color Color
	color = ReadColor(reader)
	return DebugDataSegment{
		FirstEnd:  firstEnd,
		SecondEnd: secondEnd,
		Width:     width,
		Color:     color,
	}
}

// Write Segment to writer
func (debugDataSegment DebugDataSegment) Write(writer io.Writer) {
	WriteInt32(writer, 9)
	firstEnd := debugDataSegment.FirstEnd
	firstEnd.Write(writer)
	secondEnd := debugDataSegment.SecondEnd
	secondEnd.Write(writer)
	width := debugDataSegment.Width
	WriteFloat64(writer, width)
	color := debugDataSegment.Color
	color.Write(writer)
}

// Get string representation of Segment
func (debugDataSegment DebugDataSegment) String() string {
	stringResult := "{ "
	stringResult += "FirstEnd: "
	firstEnd := debugDataSegment.FirstEnd
	stringResult += firstEnd.String()
	stringResult += ", "
	stringResult += "SecondEnd: "
	secondEnd := debugDataSegment.SecondEnd
	stringResult += secondEnd.String()
	stringResult += ", "
	stringResult += "Width: "
	width := debugDataSegment.Width
	stringResult += fmt.Sprint(width)
	stringResult += ", "
	stringResult += "Color: "
	color := debugDataSegment.Color
	stringResult += color.String()
	stringResult += " }"
	return stringResult
}

// Segment with gradient fill
type DebugDataGradientSegment struct {
	// Position of the first end
	FirstEnd Vec2
	// Color of the first end
	FirstColor Color
	// Position of the second end
	SecondEnd Vec2
	// Color of the second end
	SecondColor Color
	// Width
	Width float64
}

func NewDebugDataGradientSegment(firstEnd Vec2, firstColor Color, secondEnd Vec2, secondColor Color, width float64) DebugDataGradientSegment {
	return DebugDataGradientSegment{
		FirstEnd:    firstEnd,
		FirstColor:  firstColor,
		SecondEnd:   secondEnd,
		SecondColor: secondColor,
		Width:       width,
	}
}

// Read GradientSegment from reader
func ReadDebugDataGradientSegment(reader io.Reader) DebugDataGradientSegment {
	var firstEnd Vec2
	firstEnd = ReadVec2(reader)
	var firstColor Color
	firstColor = ReadColor(reader)
	var secondEnd Vec2
	secondEnd = ReadVec2(reader)
	var secondColor Color
	secondColor = ReadColor(reader)
	var width float64
	width = ReadFloat64(reader)
	return DebugDataGradientSegment{
		FirstEnd:    firstEnd,
		FirstColor:  firstColor,
		SecondEnd:   secondEnd,
		SecondColor: secondColor,
		Width:       width,
	}
}

// Write GradientSegment to writer
func (debugDataGradientSegment DebugDataGradientSegment) Write(writer io.Writer) {
	WriteInt32(writer, 10)
	firstEnd := debugDataGradientSegment.FirstEnd
	firstEnd.Write(writer)
	firstColor := debugDataGradientSegment.FirstColor
	firstColor.Write(writer)
	secondEnd := debugDataGradientSegment.SecondEnd
	secondEnd.Write(writer)
	secondColor := debugDataGradientSegment.SecondColor
	secondColor.Write(writer)
	width := debugDataGradientSegment.Width
	WriteFloat64(writer, width)
}

// Get string representation of GradientSegment
func (debugDataGradientSegment DebugDataGradientSegment) String() string {
	stringResult := "{ "
	stringResult += "FirstEnd: "
	firstEnd := debugDataGradientSegment.FirstEnd
	stringResult += firstEnd.String()
	stringResult += ", "
	stringResult += "FirstColor: "
	firstColor := debugDataGradientSegment.FirstColor
	stringResult += firstColor.String()
	stringResult += ", "
	stringResult += "SecondEnd: "
	secondEnd := debugDataGradientSegment.SecondEnd
	stringResult += secondEnd.String()
	stringResult += ", "
	stringResult += "SecondColor: "
	secondColor := debugDataGradientSegment.SecondColor
	stringResult += secondColor.String()
	stringResult += ", "
	stringResult += "Width: "
	width := debugDataGradientSegment.Width
	stringResult += fmt.Sprint(width)
	stringResult += " }"
	return stringResult
}

// Poly line
type DebugDataPolyLine struct {
	// List of points in order
	Vertices []Vec2
	// Width
	Width float64
	// Color
	Color Color
}

func NewDebugDataPolyLine(vertices []Vec2, width float64, color Color) DebugDataPolyLine {
	return DebugDataPolyLine{
		Vertices: vertices,
		Width:    width,
		Color:    color,
	}
}

// Read PolyLine from reader
func ReadDebugDataPolyLine(reader io.Reader) DebugDataPolyLine {
	var vertices []Vec2
	vertices = make([]Vec2, ReadInt32(reader))
	for verticesIndex := range vertices {
		var verticesElement Vec2
		verticesElement = ReadVec2(reader)
		vertices[verticesIndex] = verticesElement
	}
	var width float64
	width = ReadFloat64(reader)
	var color Color
	color = ReadColor(reader)
	return DebugDataPolyLine{
		Vertices: vertices,
		Width:    width,
		Color:    color,
	}
}

// Write PolyLine to writer
func (debugDataPolyLine DebugDataPolyLine) Write(writer io.Writer) {
	WriteInt32(writer, 11)
	vertices := debugDataPolyLine.Vertices
	WriteInt32(writer, int32(len(vertices)))
	for _, verticesElement := range vertices {
		verticesElement.Write(writer)
	}
	width := debugDataPolyLine.Width
	WriteFloat64(writer, width)
	color := debugDataPolyLine.Color
	color.Write(writer)
}

// Get string representation of PolyLine
func (debugDataPolyLine DebugDataPolyLine) String() string {
	stringResult := "{ "
	stringResult += "Vertices: "
	vertices := debugDataPolyLine.Vertices
	stringResult += "[ "
	for verticesIndex, verticesElement := range vertices {
		if verticesIndex != 0 {
			stringResult += ", "
		}
		stringResult += verticesElement.String()
	}
	stringResult += " ]"
	stringResult += ", "
	stringResult += "Width: "
	width := debugDataPolyLine.Width
	stringResult += fmt.Sprint(width)
	stringResult += ", "
	stringResult += "Color: "
	color := debugDataPolyLine.Color
	stringResult += color.String()
	stringResult += " }"
	return stringResult
}

// Poly line with gradient fill
type DebugDataGradientPolyLine struct {
	// List of points and colors in order
	Vertices []ColoredVertex
	// Width
	Width float64
}

func NewDebugDataGradientPolyLine(vertices []ColoredVertex, width float64) DebugDataGradientPolyLine {
	return DebugDataGradientPolyLine{
		Vertices: vertices,
		Width:    width,
	}
}

// Read GradientPolyLine from reader
func ReadDebugDataGradientPolyLine(reader io.Reader) DebugDataGradientPolyLine {
	var vertices []ColoredVertex
	vertices = make([]ColoredVertex, ReadInt32(reader))
	for verticesIndex := range vertices {
		var verticesElement ColoredVertex
		verticesElement = ReadColoredVertex(reader)
		vertices[verticesIndex] = verticesElement
	}
	var width float64
	width = ReadFloat64(reader)
	return DebugDataGradientPolyLine{
		Vertices: vertices,
		Width:    width,
	}
}

// Write GradientPolyLine to writer
func (debugDataGradientPolyLine DebugDataGradientPolyLine) Write(writer io.Writer) {
	WriteInt32(writer, 12)
	vertices := debugDataGradientPolyLine.Vertices
	WriteInt32(writer, int32(len(vertices)))
	for _, verticesElement := range vertices {
		verticesElement.Write(writer)
	}
	width := debugDataGradientPolyLine.Width
	WriteFloat64(writer, width)
}

// Get string representation of GradientPolyLine
func (debugDataGradientPolyLine DebugDataGradientPolyLine) String() string {
	stringResult := "{ "
	stringResult += "Vertices: "
	vertices := debugDataGradientPolyLine.Vertices
	stringResult += "[ "
	for verticesIndex, verticesElement := range vertices {
		if verticesIndex != 0 {
			stringResult += ", "
		}
		stringResult += verticesElement.String()
	}
	stringResult += " ]"
	stringResult += ", "
	stringResult += "Width: "
	width := debugDataGradientPolyLine.Width
	stringResult += fmt.Sprint(width)
	stringResult += " }"
	return stringResult
}
