package debugging

import (
	"fmt"

	"aicup22/pkg/model"
	"aicup22/pkg/stream"
)

// Data for debug rendering
type DebugData interface {
	// Write DebugData to writer
	Write()

	// Get string representation of DebugData
	String() string
}

// Read DebugData from reader
func ReadDebugData() DebugData {
	tag := flow.ReadInt32()
	switch tag {
	case 0:
		return ReadDebugDataPlacedText()
	case 1:
		return ReadDebugDataCircle()
	case 2:
		return ReadDebugDataGradientCircle()
	case 3:
		return ReadDebugDataRing()
	case 4:
		return ReadDebugDataPie()
	case 5:
		return ReadDebugDataArc()
	case 6:
		return ReadDebugDataRect()
	case 7:
		return ReadDebugDataPolygon()
	case 8:
		return ReadDebugDataGradientPolygon()
	case 9:
		return ReadDebugDataSegment()
	case 10:
		return ReadDebugDataGradientSegment()
	case 11:
		return ReadDebugDataPolyLine()
	case 12:
		return ReadDebugDataGradientPolyLine()
	}
	panic(fmt.Errorf("ReadDebugData(): unexpected tag value(%v)", tag))
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
func ReadDebugDataPlacedText() DebugDataPlacedText {
	position := model.ReadVec2()
	text := stream.Flow().ReadString()
	alignment := model.ReadVec2()
	size := flow.ReadFloat64()
	color := ReadColor()
	return DebugDataPlacedText{
		Position:  position,
		Text:      text,
		Alignment: alignment,
		Size:      size,
		Color:     color,
	}
}

// Write PlacedText to writer
func (sf DebugDataPlacedText) Write() {
	flow.WriteInt32(0)
	sf.Position.Write()
	flow.WriteString(sf.Text)
	sf.Alignment.Write()
	flow.WriteFloat64(sf.Size)
	sf.Color.Write()
}

// Get string representation of PlacedText
func (sf DebugDataPlacedText) String() string {
	strRes := "{Position:" + sf.Position.String() + ","
	strRes += "Text:\"" + sf.Text + "\","
	strRes += "Alignment:" + sf.Alignment.String() + ","
	strRes += "Size:" + fmt.Sprint(sf.Size) + ","
	strRes += "Color:" + sf.Color.String() + "}"
	return strRes
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
func ReadDebugDataCircle() DebugDataCircle {
	position := model.ReadVec2()
	radius := flow.ReadFloat64()
	color := ReadColor()
	return DebugDataCircle{
		Position: position,
		Radius:   radius,
		Color:    color,
	}
}

// Write Circle to writer
func (sf DebugDataCircle) Write() {
	// FIXME: магическая константа
	flow.WriteInt32(1)
	sf.Position.Write()
	flow.WriteFloat64(sf.Radius)
	sf.Color.Write()
}

// Get string representation of Circle
func (sf DebugDataCircle) String() string {
	strRes := "{Position:" + sf.Position.String() + ","
	strRes += "Radius:" + fmt.Sprint(sf.Radius) + ","
	strRes += "Color:" + sf.Color.String() + "}"
	return strRes
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
func ReadDebugDataGradientCircle() DebugDataGradientCircle {
	position := model.ReadVec2()
	radius := flow.ReadFloat64()
	innerColor := ReadColor()
	outerColor := ReadColor()
	return DebugDataGradientCircle{
		Position:   position,
		Radius:     radius,
		InnerColor: innerColor,
		OuterColor: outerColor,
	}
}

// Write GradientCircle to writer
func (sf DebugDataGradientCircle) Write() {
	// FIXME: магическая константа
	flow.WriteInt32(2)
	sf.Position.Write()
	flow.WriteFloat64(sf.Radius)
	sf.InnerColor.Write()
	sf.OuterColor.Write()
}

// Get string representation of GradientCircle
func (sf DebugDataGradientCircle) String() string {
	strRes := "{Position:" + sf.Position.String() + ","
	strRes += "Radius:" + fmt.Sprint(sf.Radius) + ","
	strRes += "InnerColor:" + sf.InnerColor.String() + ","
	strRes += "OuterColor:" + sf.OuterColor.String() + "}"
	return strRes
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
func ReadDebugDataRing() DebugDataRing {
	position := model.ReadVec2()
	radius := flow.ReadFloat64()
	width := flow.ReadFloat64()
	color := ReadColor()
	return DebugDataRing{
		Position: position,
		Radius:   radius,
		Width:    width,
		Color:    color,
	}
}

// Write Ring to writer
func (sf DebugDataRing) Write() {
	// FIXME: магическая константа
	flow.WriteInt32(3)
	sf.Position.Write()
	flow.WriteFloat64(sf.Radius)
	flow.WriteFloat64(sf.Width)
	sf.Color.Write()
}

// Get string representation of Ring
func (sf DebugDataRing) String() string {
	strRes := "{Position:" + sf.Position.String() + ","
	strRes += "Radius:" + fmt.Sprint(sf.Radius) + ","
	strRes += "Width:" + fmt.Sprint(sf.Width) + ","
	strRes += "Color:" + sf.Color.String() + "}"
	return strRes
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
func ReadDebugDataPie() DebugDataPie {
	position := model.ReadVec2()
	radius := flow.ReadFloat64()
	startAngle := flow.ReadFloat64()
	endAngle := flow.ReadFloat64()
	color := ReadColor()
	return DebugDataPie{
		Position:   position,
		Radius:     radius,
		StartAngle: startAngle,
		EndAngle:   endAngle,
		Color:      color,
	}
}

// Write Pie to writer
func (sf DebugDataPie) Write() {
	flow.WriteInt32(4)
	sf.Position.Write()
	flow.WriteFloat64(sf.Radius)
	flow.WriteFloat64(sf.StartAngle)
	flow.WriteFloat64(sf.EndAngle)
	sf.Color.Write()
}

// Get string representation of Pie
func (sf DebugDataPie) String() string {
	strRes := "{Position:" + sf.Position.String() + ","
	strRes += "Radius:" + fmt.Sprint(sf.Radius) + ","
	strRes += "StartAngle:" + fmt.Sprint(sf.StartAngle) + ","
	strRes += "EndAngle:" + fmt.Sprint(sf.EndAngle) + ","
	strRes += "Color:" + sf.Color.String() + "}"
	return strRes
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
func ReadDebugDataArc() DebugDataArc {
	position := model.ReadVec2()
	radius := flow.ReadFloat64()
	width := flow.ReadFloat64()
	startAngle := flow.ReadFloat64()
	endAngle := flow.ReadFloat64()
	color := ReadColor()
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
func (sf DebugDataArc) Write() {
	// FIXME: магическая константа
	flow.WriteInt32(5)
	sf.Position.Write()
	flow.WriteFloat64(sf.Radius)
	flow.WriteFloat64(sf.Width)
	flow.WriteFloat64(sf.StartAngle)
	flow.WriteFloat64(sf.EndAngle)
	sf.Color.Write()
}

// Get string representation of Arc
func (sf DebugDataArc) String() string {
	strRes := "{Position:" + sf.Position.String() + ","
	strRes += "Radius:" + fmt.Sprint(sf.Radius) + ","
	strRes += "Width:" + fmt.Sprint(sf.Width) + ","
	strRes += "StartAngle:" + fmt.Sprint(sf.StartAngle) + ","
	strRes += "EndAngle:" + fmt.Sprint(sf.EndAngle) + ","
	strRes += "Color:" + sf.Color.String() + "}"
	return strRes
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
func ReadDebugDataRect() DebugDataRect {
	bottomLeft := model.ReadVec2()
	size := model.ReadVec2()
	color := ReadColor()
	return DebugDataRect{
		BottomLeft: bottomLeft,
		Size:       size,
		Color:      color,
	}
}

// Write Rect to writer
func (sf DebugDataRect) Write() {
	flow.WriteInt32(6)
	sf.BottomLeft.Write()
	sf.Size.Write()
	sf.Color.Write()
}

// Get string representation of Rect
func (sf DebugDataRect) String() string {
	strRes := "{BottomLeft:" + sf.BottomLeft.String() + ","
	strRes += "Size:" + sf.Size.String() + ","
	strRes += "Color:" + sf.Color.String() + "}"
	return strRes
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
func ReadDebugDataPolygon() DebugDataPolygon {
	vertices := make([]model.Vec2, stream.Flow().ReadInt32())
	for verticesIndex := range vertices {
		verticesElement := model.ReadVec2()
		vertices[verticesIndex] = verticesElement
	}
	return DebugDataPolygon{
		Vertices: vertices,
		Color:    ReadColor(),
	}
}

// Write Polygon to writer
func (sf DebugDataPolygon) Write() {
	flow.WriteInt32(7)
	lenVertices := len(sf.Vertices)
	flow.WriteInt32(int32(lenVertices))
	for _, verticesElement := range sf.Vertices {
		verticesElement.Write()
	}
	sf.Color.Write()
}

// Get string representation of Polygon
func (sf DebugDataPolygon) String() string {
	strRes := "{Vertices:["
	for ind, vert := range sf.Vertices {
		if ind != 0 {
			strRes += ","
		}
		strRes += vert.String()
	}
	strRes += " ],Color:" + sf.Color.String() + "}"
	return strRes
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
func ReadDebugDataGradientPolygon() DebugDataGradientPolygon {
	vertices := make([]ColoredVertex, flow.ReadInt32())
	for verticesIndex := range vertices {
		verticesElement := ReadColoredVertex()
		vertices[verticesIndex] = verticesElement
	}
	return DebugDataGradientPolygon{
		Vertices: vertices,
	}
}

// Write GradientPolygon to writer
func (sf DebugDataGradientPolygon) Write() {
	flow.WriteInt32(8)
	lenVertices := len(sf.Vertices)
	flow.WriteInt32(int32(lenVertices))
	for _, verticesElement := range sf.Vertices {
		verticesElement.Write()
	}
}

// Get string representation of GradientPolygon
func (sf DebugDataGradientPolygon) String() string {
	strRes := "{Vertices:["
	for ind, vert := range sf.Vertices {
		if ind != 0 {
			strRes += ","
		}
		strRes += vert.String()
	}
	strRes += "]}"
	return strRes
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
func ReadDebugDataSegment() DebugDataSegment {
	firstEnd := model.ReadVec2()
	secondEnd := model.ReadVec2()
	width := flow.ReadFloat64()
	color := ReadColor()
	return DebugDataSegment{
		FirstEnd:  firstEnd,
		SecondEnd: secondEnd,
		Width:     width,
		Color:     color,
	}
}

// Write Segment to writer
func (sf DebugDataSegment) Write() {
	flow.WriteInt32(9)
	sf.FirstEnd.Write()
	sf.SecondEnd.Write()
	flow.WriteFloat64(sf.Width)
	sf.Color.Write()
}

// Get string representation of Segment
func (sf DebugDataSegment) String() string {
	strRes := "{FirstEnd:"+sf.FirstEnd.String()+","
	strRes += "SecondEnd:"+sf.SecondEnd.String()+ ","
	strRes += "Width:"+fmt.Sprint(sf.Width)+","
	strRes += "Color:"+sf.Color.String()+"}"
	return strRes
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
func ReadDebugDataGradientSegment() DebugDataGradientSegment {
	firstEnd := model.ReadVec2()
	firstColor := ReadColor()
	secondEnd := model.ReadVec2()
	secondColor := ReadColor()
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
func (sf DebugDataGradientSegment) Write() {
	flow.WriteInt32(10)
	sf.FirstEnd.Write()
	sf.FirstColor.Write()
	sf.SecondEnd.Write()
	sf.SecondColor.Write()
	flow.WriteFloat64(sf.Width)
}

// Get string representation of GradientSegment
func (sf DebugDataGradientSegment) String() string {
	stringResult := "{ "
	stringResult += "FirstEnd: "
	firstEnd := sf.FirstEnd
	stringResult += firstEnd.String()
	stringResult += ", "
	stringResult += "FirstColor: "
	firstColor := sf.FirstColor
	stringResult += firstColor.String()
	stringResult += ", "
	stringResult += "SecondEnd: "
	secondEnd := sf.SecondEnd
	stringResult += secondEnd.String()
	stringResult += ", "
	stringResult += "SecondColor: "
	secondColor := sf.SecondColor
	stringResult += secondColor.String()
	stringResult += ", "
	stringResult += "Width: "
	width := sf.Width
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
func ReadDebugDataPolyLine() DebugDataPolyLine {
	vertices := make([]model.Vec2, stream.Flow().ReadInt32())
	for verticesIndex := range vertices {
		verticesElement := model.ReadVec2()
		vertices[verticesIndex] = verticesElement
	}
	width := flow.ReadFloat64()
	color := ReadColor()
	return DebugDataPolyLine{
		Vertices: vertices,
		Width:    width,
		Color:    color,
	}
}

// Write PolyLine to writer
func (sf DebugDataPolyLine) Write() {
	flow.WriteInt32(11)
	vertices := sf.Vertices
	flow.WriteInt32(int32(len(vertices)))
	for _, verticesElement := range vertices {
		verticesElement.Write()
	}
	flow.WriteFloat64(sf.Width)
	sf.Color.Write()
}

// Get string representation of PolyLine
func (sf DebugDataPolyLine) String() string {
	strRes := "{ "
	strRes += "Vertices: "
	vertices := sf.Vertices
	strRes += "[ "
	for verticesIndex, verticesElement := range vertices {
		if verticesIndex != 0 {
			strRes += ", "
		}
		strRes += verticesElement.String()
	}
	strRes += " ]"
	strRes += ", "
	strRes += "Width: "
	width := sf.Width
	strRes += fmt.Sprint(width)
	strRes += ", "
	strRes += "Color: "
	color := sf.Color
	strRes += color.String()
	strRes += " }"
	return strRes
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
func ReadDebugDataGradientPolyLine() DebugDataGradientPolyLine {
	vertices := make([]ColoredVertex, stream.Flow().ReadInt32())
	for verticesIndex := range vertices {
		verticesElement := ReadColoredVertex()
		vertices[verticesIndex] = verticesElement
	}
	width := flow.ReadFloat64()
	return DebugDataGradientPolyLine{
		Vertices: vertices,
		Width:    width,
	}
}

// Write GradientPolyLine to writer
func (sf DebugDataGradientPolyLine) Write() {
	flow.WriteInt32(12)
	vertices := sf.Vertices
	flow.WriteInt32(int32(len(vertices)))
	for _, verticesElement := range vertices {
		verticesElement.Write()
	}
	width := sf.Width
	flow.WriteFloat64(width)
}

// Get string representation of GradientPolyLine
func (sf DebugDataGradientPolyLine) String() string {
	strRes := "{ "
	strRes += "Vertices: "
	vertices := sf.Vertices
	strRes += "[ "
	for verticesIndex, verticesElement := range vertices {
		if verticesIndex != 0 {
			strRes += ", "
		}
		strRes += verticesElement.String()
	}
	strRes += " ]"
	strRes += ", "
	strRes += "Width: "
	width := sf.Width
	strRes += fmt.Sprint(width)
	strRes += " }"
	return strRes
}
