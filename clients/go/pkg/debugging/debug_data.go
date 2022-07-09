package debugging

import (
	"fmt"
	"io"

	"aicup22/pkg/model"
	"aicup22/pkg/stream"
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
	switch stream.Flow().ReadInt32() {
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
	Position model.Vec2
	// Text
	Text string
	// Alignment, separate for x and y. From 0 to 1. 0.5 - center alignment
	Alignment model.Vec2
	// Size
	Size float64
	// Color
	Color Color
}

func NewDebugDataPlacedText(position model.Vec2, text string, alignment model.Vec2, size float64, color Color) DebugDataPlacedText {
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
	position := model.ReadVec2(reader)
	text := stream.Flow().ReadString()
	alignment := model.ReadVec2(reader)
	size := flow.ReadFloat64()
	color := ReadColor(reader)
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
	stream.WriteInt32(writer, 0)
	position := debugDataPlacedText.Position
	position.Write(writer)
	text := debugDataPlacedText.Text
	stream.WriteString(writer, text)
	alignment := debugDataPlacedText.Alignment
	alignment.Write(writer)
	size := debugDataPlacedText.Size
	stream.WriteFloat64(writer, size)
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
	Position model.Vec2
	// Radius
	Radius float64
	// Color
	Color Color
}

func NewDebugDataCircle(position model.Vec2, radius float64, color Color) DebugDataCircle {
	return DebugDataCircle{
		Position: position,
		Radius:   radius,
		Color:    color,
	}
}

// Read Circle from reader
func ReadDebugDataCircle(reader io.Reader) DebugDataCircle {
	position := model.ReadVec2(reader)
	radius := flow.ReadFloat64()
	color := ReadColor(reader)
	return DebugDataCircle{
		Position: position,
		Radius:   radius,
		Color:    color,
	}
}

// Write Circle to writer
func (debugDataCircle DebugDataCircle) Write(writer io.Writer) {
	stream.WriteInt32(writer, 1)
	position := debugDataCircle.Position
	position.Write(writer)
	radius := debugDataCircle.Radius
	stream.WriteFloat64(writer, radius)
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
	Position model.Vec2
	// Radius
	Radius float64
	// Color of the center
	InnerColor Color
	// Color of the edge
	OuterColor Color
}

func NewDebugDataGradientCircle(position model.Vec2, radius float64, innerColor Color, outerColor Color) DebugDataGradientCircle {
	return DebugDataGradientCircle{
		Position:   position,
		Radius:     radius,
		InnerColor: innerColor,
		OuterColor: outerColor,
	}
}

// Read GradientCircle from reader
func ReadDebugDataGradientCircle(reader io.Reader) DebugDataGradientCircle {
	position := model.ReadVec2(reader)
	radius := flow.ReadFloat64()
	innerColor := ReadColor(reader)
	outerColor := ReadColor(reader)
	return DebugDataGradientCircle{
		Position:   position,
		Radius:     radius,
		InnerColor: innerColor,
		OuterColor: outerColor,
	}
}

// Write GradientCircle to writer
func (debugDataGradientCircle DebugDataGradientCircle) Write(writer io.Writer) {
	stream.WriteInt32(writer, 2)
	position := debugDataGradientCircle.Position
	position.Write(writer)
	radius := debugDataGradientCircle.Radius
	stream.WriteFloat64(writer, radius)
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
	Position model.Vec2
	// Radius
	Radius float64
	// Width
	Width float64
	// Color
	Color Color
}

func NewDebugDataRing(position model.Vec2, radius, width float64, color Color) DebugDataRing {
	return DebugDataRing{
		Position: position,
		Radius:   radius,
		Width:    width,
		Color:    color,
	}
}

// Read Ring from reader
func ReadDebugDataRing(reader io.Reader) DebugDataRing {
	position := model.ReadVec2(reader)
	radius := flow.ReadFloat64()
	width := flow.ReadFloat64()
	color := ReadColor(reader)
	return DebugDataRing{
		Position: position,
		Radius:   radius,
		Width:    width,
		Color:    color,
	}
}

// Write Ring to writer
func (debugDataRing DebugDataRing) Write(writer io.Writer) {
	stream.WriteInt32(writer, 3)
	position := debugDataRing.Position
	position.Write(writer)
	radius := debugDataRing.Radius
	stream.WriteFloat64(writer, radius)
	width := debugDataRing.Width
	stream.WriteFloat64(writer, width)
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
	Position model.Vec2
	// Radius
	Radius float64
	// Start angle
	StartAngle float64
	// End angle
	EndAngle float64
	// Color
	Color Color
}

func NewDebugDataPie(position model.Vec2, radius, startAngle, endAngle float64, color Color) DebugDataPie {
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
	position := model.ReadVec2(reader)
	radius := flow.ReadFloat64()
	startAngle := flow.ReadFloat64()
	endAngle := flow.ReadFloat64()
	color := ReadColor(reader)
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
	stream.WriteInt32(writer, 4)
	position := debugDataPie.Position
	position.Write(writer)
	radius := debugDataPie.Radius
	stream.WriteFloat64(writer, radius)
	startAngle := debugDataPie.StartAngle
	stream.WriteFloat64(writer, startAngle)
	endAngle := debugDataPie.EndAngle
	stream.WriteFloat64(writer, endAngle)
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
	Position model.Vec2
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

func NewDebugDataArc(position model.Vec2, radius, width, startAngle, endAngle float64, color Color) DebugDataArc {
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
	position := model.ReadVec2(reader)
	radius := flow.ReadFloat64()
	width := flow.ReadFloat64()
	startAngle := flow.ReadFloat64()
	endAngle := flow.ReadFloat64()
	color := ReadColor(reader)
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
	stream.WriteInt32(writer, 5)
	position := debugDataArc.Position
	position.Write(writer)
	radius := debugDataArc.Radius
	stream.WriteFloat64(writer, radius)
	width := debugDataArc.Width
	stream.WriteFloat64(writer, width)
	startAngle := debugDataArc.StartAngle
	stream.WriteFloat64(writer, startAngle)
	endAngle := debugDataArc.EndAngle
	stream.WriteFloat64(writer, endAngle)
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
	BottomLeft model.Vec2
	// Size
	Size model.Vec2
	// Color
	Color Color
}

func NewDebugDataRect(bottomLeft, size model.Vec2, color Color) DebugDataRect {
	return DebugDataRect{
		BottomLeft: bottomLeft,
		Size:       size,
		Color:      color,
	}
}

// Read Rect from reader
func ReadDebugDataRect(reader io.Reader) DebugDataRect {
	bottomLeft := model.ReadVec2(reader)
	size := model.ReadVec2(reader)
	color := ReadColor(reader)
	return DebugDataRect{
		BottomLeft: bottomLeft,
		Size:       size,
		Color:      color,
	}
}

// Write Rect to writer
func (debugDataRect DebugDataRect) Write(writer io.Writer) {
	stream.WriteInt32(writer, 6)
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
	Vertices []model.Vec2
	// Color
	Color Color
}

func NewDebugDataPolygon(vertices []model.Vec2, color Color) DebugDataPolygon {
	return DebugDataPolygon{
		Vertices: vertices,
		Color:    color,
	}
}

// Read Polygon from reader
func ReadDebugDataPolygon(reader io.Reader) DebugDataPolygon {
	vertices := make([]model.Vec2, stream.Flow().ReadInt32())
	for verticesIndex := range vertices {
		verticesElement := model.ReadVec2(reader)
		vertices[verticesIndex] = verticesElement
	}
	color := ReadColor(reader)
	return DebugDataPolygon{
		Vertices: vertices,
		Color:    color,
	}
}

// Write Polygon to writer
func (debugDataPolygon DebugDataPolygon) Write(writer io.Writer) {
	stream.WriteInt32(writer, 7)
	vertices := debugDataPolygon.Vertices
	stream.WriteInt32(writer, int32(len(vertices)))
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
	vertices := make([]ColoredVertex, stream.Flow().ReadInt32())
	for verticesIndex := range vertices {
		verticesElement := ReadColoredVertex(reader)
		vertices[verticesIndex] = verticesElement
	}
	return DebugDataGradientPolygon{
		Vertices: vertices,
	}
}

// Write GradientPolygon to writer
func (debugDataGradientPolygon DebugDataGradientPolygon) Write(writer io.Writer) {
	stream.WriteInt32(writer, 8)
	vertices := debugDataGradientPolygon.Vertices
	stream.WriteInt32(writer, int32(len(vertices)))
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
	FirstEnd model.Vec2
	// Position of the second end
	SecondEnd model.Vec2
	// Width
	Width float64
	// Color
	Color Color
}

func NewDebugDataSegment(firstEnd, secondEnd model.Vec2, width float64, color Color) DebugDataSegment {
	return DebugDataSegment{
		FirstEnd:  firstEnd,
		SecondEnd: secondEnd,
		Width:     width,
		Color:     color,
	}
}

// Read Segment from reader
func ReadDebugDataSegment(reader io.Reader) DebugDataSegment {
	firstEnd := model.ReadVec2(reader)
	secondEnd := model.ReadVec2(reader)
	width := flow.ReadFloat64()
	color := ReadColor(reader)
	return DebugDataSegment{
		FirstEnd:  firstEnd,
		SecondEnd: secondEnd,
		Width:     width,
		Color:     color,
	}
}

// Write Segment to writer
func (debugDataSegment DebugDataSegment) Write(writer io.Writer) {
	stream.WriteInt32(writer, 9)
	firstEnd := debugDataSegment.FirstEnd
	firstEnd.Write(writer)
	secondEnd := debugDataSegment.SecondEnd
	secondEnd.Write(writer)
	width := debugDataSegment.Width
	stream.WriteFloat64(writer, width)
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
	FirstEnd model.Vec2
	// Color of the first end
	FirstColor Color
	// Position of the second end
	SecondEnd model.Vec2
	// Color of the second end
	SecondColor Color
	// Width
	Width float64
}

func NewDebugDataGradientSegment(firstEnd model.Vec2, firstColor Color, secondEnd model.Vec2, secondColor Color, width float64) DebugDataGradientSegment {
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
	firstEnd := model.ReadVec2(reader)
	firstColor := ReadColor(reader)
	secondEnd := model.ReadVec2(reader)
	secondColor := ReadColor(reader)
	width := flow.ReadFloat64()
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
	stream.WriteInt32(writer, 10)
	firstEnd := debugDataGradientSegment.FirstEnd
	firstEnd.Write(writer)
	firstColor := debugDataGradientSegment.FirstColor
	firstColor.Write(writer)
	secondEnd := debugDataGradientSegment.SecondEnd
	secondEnd.Write(writer)
	secondColor := debugDataGradientSegment.SecondColor
	secondColor.Write(writer)
	width := debugDataGradientSegment.Width
	stream.WriteFloat64(writer, width)
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
	Vertices []model.Vec2
	// Width
	Width float64
	// Color
	Color Color
}

func NewDebugDataPolyLine(vertices []model.Vec2, width float64, color Color) DebugDataPolyLine {
	return DebugDataPolyLine{
		Vertices: vertices,
		Width:    width,
		Color:    color,
	}
}

// Read PolyLine from reader
func ReadDebugDataPolyLine(reader io.Reader) DebugDataPolyLine {
	vertices := make([]model.Vec2, stream.Flow().ReadInt32())
	for verticesIndex := range vertices {
		verticesElement := model.ReadVec2(reader)
		vertices[verticesIndex] = verticesElement
	}
	width := flow.ReadFloat64()
	color := ReadColor(reader)
	return DebugDataPolyLine{
		Vertices: vertices,
		Width:    width,
		Color:    color,
	}
}

// Write PolyLine to writer
func (debugDataPolyLine DebugDataPolyLine) Write(writer io.Writer) {
	stream.WriteInt32(writer, 11)
	vertices := debugDataPolyLine.Vertices
	stream.WriteInt32(writer, int32(len(vertices)))
	for _, verticesElement := range vertices {
		verticesElement.Write(writer)
	}
	width := debugDataPolyLine.Width
	stream.WriteFloat64(writer, width)
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
	vertices := make([]ColoredVertex, stream.Flow().ReadInt32())
	for verticesIndex := range vertices {
		verticesElement := ReadColoredVertex(reader)
		vertices[verticesIndex] = verticesElement
	}
	width := flow.ReadFloat64()
	return DebugDataGradientPolyLine{
		Vertices: vertices,
		Width:    width,
	}
}

// Write GradientPolyLine to writer
func (debugDataGradientPolyLine DebugDataGradientPolyLine) Write(writer io.Writer) {
	stream.WriteInt32(writer, 12)
	vertices := debugDataGradientPolyLine.Vertices
	stream.WriteInt32(writer, int32(len(vertices)))
	for _, verticesElement := range vertices {
		verticesElement.Write(writer)
	}
	width := debugDataGradientPolyLine.Width
	stream.WriteFloat64(writer, width)
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
