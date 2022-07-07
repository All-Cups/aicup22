unit UDebugData;

{$mode delphi}{$H+}

interface

uses
    Stream,
    SysUtils,
    UColor in 'Debugging/UColor.pas',
    UColoredVertex in 'Debugging/UColoredVertex.pas',
    UVec2 in 'Model/UVec2.pas';

type
    // Data for debug rendering
    TDebugData = class
        // Write DebugData to output stream
        procedure WriteTo(stream: TStream); virtual; abstract;
        // Read DebugData from input stream
        class function ReadFrom(stream: TStream): TDebugData; static;
    end;

type
    // Text
    TDebugDataPlacedText = class (TDebugData)
        // Position
        position: TVec2;
        // Text
        text: String;
        // Alignment, separate for x and y. From 0 to 1. 0.5 - center alignment
        alignment: TVec2;
        // Size
        size: Double;
        // Color
        color: TColor;
        constructor Create(position: TVec2; text: String; alignment: TVec2; size: Double; color: TColor);
        // Read DebugDataPlacedText from input stream
        class function ReadFrom(stream: TStream): TDebugDataPlacedText; static;
        // Write DebugDataPlacedText to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Circle
    TDebugDataCircle = class (TDebugData)
        // Position of the center
        position: TVec2;
        // Radius
        radius: Double;
        // Color
        color: TColor;
        constructor Create(position: TVec2; radius: Double; color: TColor);
        // Read DebugDataCircle from input stream
        class function ReadFrom(stream: TStream): TDebugDataCircle; static;
        // Write DebugDataCircle to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Circle with gradient fill
    TDebugDataGradientCircle = class (TDebugData)
        // Position of the center
        position: TVec2;
        // Radius
        radius: Double;
        // Color of the center
        innerColor: TColor;
        // Color of the edge
        outerColor: TColor;
        constructor Create(position: TVec2; radius: Double; innerColor: TColor; outerColor: TColor);
        // Read DebugDataGradientCircle from input stream
        class function ReadFrom(stream: TStream): TDebugDataGradientCircle; static;
        // Write DebugDataGradientCircle to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Ring
    TDebugDataRing = class (TDebugData)
        // Position of the center
        position: TVec2;
        // Radius
        radius: Double;
        // Width
        width: Double;
        // Color
        color: TColor;
        constructor Create(position: TVec2; radius: Double; width: Double; color: TColor);
        // Read DebugDataRing from input stream
        class function ReadFrom(stream: TStream): TDebugDataRing; static;
        // Write DebugDataRing to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Sector of a circle
    TDebugDataPie = class (TDebugData)
        // Position of the center
        position: TVec2;
        // Radius
        radius: Double;
        // Start angle
        startAngle: Double;
        // End angle
        endAngle: Double;
        // Color
        color: TColor;
        constructor Create(position: TVec2; radius: Double; startAngle: Double; endAngle: Double; color: TColor);
        // Read DebugDataPie from input stream
        class function ReadFrom(stream: TStream): TDebugDataPie; static;
        // Write DebugDataPie to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Arc
    TDebugDataArc = class (TDebugData)
        // Position of the center
        position: TVec2;
        // Radius
        radius: Double;
        // Width
        width: Double;
        // Start angle
        startAngle: Double;
        // End angle
        endAngle: Double;
        // Color
        color: TColor;
        constructor Create(position: TVec2; radius: Double; width: Double; startAngle: Double; endAngle: Double; color: TColor);
        // Read DebugDataArc from input stream
        class function ReadFrom(stream: TStream): TDebugDataArc; static;
        // Write DebugDataArc to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Rectancle
    TDebugDataRect = class (TDebugData)
        // Bottom left position
        bottomLeft: TVec2;
        // Size
        size: TVec2;
        // Color
        color: TColor;
        constructor Create(bottomLeft: TVec2; size: TVec2; color: TColor);
        // Read DebugDataRect from input stream
        class function ReadFrom(stream: TStream): TDebugDataRect; static;
        // Write DebugDataRect to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Polygon (convex)
    TDebugDataPolygon = class (TDebugData)
        // Positions of vertices in order
        vertices: TArray<TVec2>;
        // Color
        color: TColor;
        constructor Create(vertices: TArray<TVec2>; color: TColor);
        // Read DebugDataPolygon from input stream
        class function ReadFrom(stream: TStream): TDebugDataPolygon; static;
        // Write DebugDataPolygon to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Polygon with gradient fill
    TDebugDataGradientPolygon = class (TDebugData)
        // List of vertices in order
        vertices: TArray<TColoredVertex>;
        constructor Create(vertices: TArray<TColoredVertex>);
        // Read DebugDataGradientPolygon from input stream
        class function ReadFrom(stream: TStream): TDebugDataGradientPolygon; static;
        // Write DebugDataGradientPolygon to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Segment
    TDebugDataSegment = class (TDebugData)
        // Position of the first end
        firstEnd: TVec2;
        // Position of the second end
        secondEnd: TVec2;
        // Width
        width: Double;
        // Color
        color: TColor;
        constructor Create(firstEnd: TVec2; secondEnd: TVec2; width: Double; color: TColor);
        // Read DebugDataSegment from input stream
        class function ReadFrom(stream: TStream): TDebugDataSegment; static;
        // Write DebugDataSegment to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Segment with gradient fill
    TDebugDataGradientSegment = class (TDebugData)
        // Position of the first end
        firstEnd: TVec2;
        // Color of the first end
        firstColor: TColor;
        // Position of the second end
        secondEnd: TVec2;
        // Color of the second end
        secondColor: TColor;
        // Width
        width: Double;
        constructor Create(firstEnd: TVec2; firstColor: TColor; secondEnd: TVec2; secondColor: TColor; width: Double);
        // Read DebugDataGradientSegment from input stream
        class function ReadFrom(stream: TStream): TDebugDataGradientSegment; static;
        // Write DebugDataGradientSegment to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Poly line
    TDebugDataPolyLine = class (TDebugData)
        // List of points in order
        vertices: TArray<TVec2>;
        // Width
        width: Double;
        // Color
        color: TColor;
        constructor Create(vertices: TArray<TVec2>; width: Double; color: TColor);
        // Read DebugDataPolyLine from input stream
        class function ReadFrom(stream: TStream): TDebugDataPolyLine; static;
        // Write DebugDataPolyLine to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Poly line with gradient fill
    TDebugDataGradientPolyLine = class (TDebugData)
        // List of points and colors in order
        vertices: TArray<TColoredVertex>;
        // Width
        width: Double;
        constructor Create(vertices: TArray<TColoredVertex>; width: Double);
        // Read DebugDataGradientPolyLine from input stream
        class function ReadFrom(stream: TStream): TDebugDataGradientPolyLine; static;
        // Write DebugDataGradientPolyLine to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

implementation

class function TDebugData.ReadFrom(stream: TStream): TDebugData;
var tag: Int32;
begin
    tag := stream.ReadInt32;
    case tag of
        0: result := TDebugDataPlacedText.ReadFrom(stream);
        1: result := TDebugDataCircle.ReadFrom(stream);
        2: result := TDebugDataGradientCircle.ReadFrom(stream);
        3: result := TDebugDataRing.ReadFrom(stream);
        4: result := TDebugDataPie.ReadFrom(stream);
        5: result := TDebugDataArc.ReadFrom(stream);
        6: result := TDebugDataRect.ReadFrom(stream);
        7: result := TDebugDataPolygon.ReadFrom(stream);
        8: result := TDebugDataGradientPolygon.ReadFrom(stream);
        9: result := TDebugDataSegment.ReadFrom(stream);
        10: result := TDebugDataGradientSegment.ReadFrom(stream);
        11: result := TDebugDataPolyLine.ReadFrom(stream);
        12: result := TDebugDataGradientPolyLine.ReadFrom(stream);
        else raise Exception.Create('Unexpected tag value');
    end;
end;

constructor TDebugDataPlacedText.Create(position: TVec2; text: String; alignment: TVec2; size: Double; color: TColor);
begin
    self.position := position;
    self.text := text;
    self.alignment := alignment;
    self.size := size;
    self.color := color;
end;

class function TDebugDataPlacedText.ReadFrom(stream: TStream): TDebugDataPlacedText;
var alignment: TVec2;
var color: TColor;
var position: TVec2;
var size: Double;
var text: String;
begin
    position := TVec2.ReadFrom(stream);
    text := stream.ReadString;
    alignment := TVec2.ReadFrom(stream);
    size := stream.ReadDouble;
    color := TColor.ReadFrom(stream);
    result := TDebugDataPlacedText.Create(position, text, alignment, size, color);
end;

procedure TDebugDataPlacedText.WriteTo(stream: TStream);
begin
    stream.WriteInt32(0);
    position.WriteTo(stream);
    stream.WriteString(text);
    alignment.WriteTo(stream);
    stream.WriteDouble(size);
    color.WriteTo(stream);
end;

function TDebugDataPlacedText.ToString: ansistring;
begin
    result := 'PlacedText {';
    result += 'position=';
    result += position.ToString;
    result += ', ';  
    result += 'text=';
    result += '''';
    result += text;
    result += '''';
    result += ', ';  
    result += 'alignment=';
    result += alignment.ToString;
    result += ', ';  
    result += 'size=';
    result += FloatToStr(size);
    result += ', ';  
    result += 'color=';
    result += color.ToString;
    result += '}';
end;

constructor TDebugDataCircle.Create(position: TVec2; radius: Double; color: TColor);
begin
    self.position := position;
    self.radius := radius;
    self.color := color;
end;

class function TDebugDataCircle.ReadFrom(stream: TStream): TDebugDataCircle;
var color: TColor;
var position: TVec2;
var radius: Double;
begin
    position := TVec2.ReadFrom(stream);
    radius := stream.ReadDouble;
    color := TColor.ReadFrom(stream);
    result := TDebugDataCircle.Create(position, radius, color);
end;

procedure TDebugDataCircle.WriteTo(stream: TStream);
begin
    stream.WriteInt32(1);
    position.WriteTo(stream);
    stream.WriteDouble(radius);
    color.WriteTo(stream);
end;

function TDebugDataCircle.ToString: ansistring;
begin
    result := 'Circle {';
    result += 'position=';
    result += position.ToString;
    result += ', ';  
    result += 'radius=';
    result += FloatToStr(radius);
    result += ', ';  
    result += 'color=';
    result += color.ToString;
    result += '}';
end;

constructor TDebugDataGradientCircle.Create(position: TVec2; radius: Double; innerColor: TColor; outerColor: TColor);
begin
    self.position := position;
    self.radius := radius;
    self.innerColor := innerColor;
    self.outerColor := outerColor;
end;

class function TDebugDataGradientCircle.ReadFrom(stream: TStream): TDebugDataGradientCircle;
var innerColor: TColor;
var outerColor: TColor;
var position: TVec2;
var radius: Double;
begin
    position := TVec2.ReadFrom(stream);
    radius := stream.ReadDouble;
    innerColor := TColor.ReadFrom(stream);
    outerColor := TColor.ReadFrom(stream);
    result := TDebugDataGradientCircle.Create(position, radius, innerColor, outerColor);
end;

procedure TDebugDataGradientCircle.WriteTo(stream: TStream);
begin
    stream.WriteInt32(2);
    position.WriteTo(stream);
    stream.WriteDouble(radius);
    innerColor.WriteTo(stream);
    outerColor.WriteTo(stream);
end;

function TDebugDataGradientCircle.ToString: ansistring;
begin
    result := 'GradientCircle {';
    result += 'position=';
    result += position.ToString;
    result += ', ';  
    result += 'radius=';
    result += FloatToStr(radius);
    result += ', ';  
    result += 'innerColor=';
    result += innerColor.ToString;
    result += ', ';  
    result += 'outerColor=';
    result += outerColor.ToString;
    result += '}';
end;

constructor TDebugDataRing.Create(position: TVec2; radius: Double; width: Double; color: TColor);
begin
    self.position := position;
    self.radius := radius;
    self.width := width;
    self.color := color;
end;

class function TDebugDataRing.ReadFrom(stream: TStream): TDebugDataRing;
var color: TColor;
var position: TVec2;
var radius: Double;
var width: Double;
begin
    position := TVec2.ReadFrom(stream);
    radius := stream.ReadDouble;
    width := stream.ReadDouble;
    color := TColor.ReadFrom(stream);
    result := TDebugDataRing.Create(position, radius, width, color);
end;

procedure TDebugDataRing.WriteTo(stream: TStream);
begin
    stream.WriteInt32(3);
    position.WriteTo(stream);
    stream.WriteDouble(radius);
    stream.WriteDouble(width);
    color.WriteTo(stream);
end;

function TDebugDataRing.ToString: ansistring;
begin
    result := 'Ring {';
    result += 'position=';
    result += position.ToString;
    result += ', ';  
    result += 'radius=';
    result += FloatToStr(radius);
    result += ', ';  
    result += 'width=';
    result += FloatToStr(width);
    result += ', ';  
    result += 'color=';
    result += color.ToString;
    result += '}';
end;

constructor TDebugDataPie.Create(position: TVec2; radius: Double; startAngle: Double; endAngle: Double; color: TColor);
begin
    self.position := position;
    self.radius := radius;
    self.startAngle := startAngle;
    self.endAngle := endAngle;
    self.color := color;
end;

class function TDebugDataPie.ReadFrom(stream: TStream): TDebugDataPie;
var color: TColor;
var endAngle: Double;
var position: TVec2;
var radius: Double;
var startAngle: Double;
begin
    position := TVec2.ReadFrom(stream);
    radius := stream.ReadDouble;
    startAngle := stream.ReadDouble;
    endAngle := stream.ReadDouble;
    color := TColor.ReadFrom(stream);
    result := TDebugDataPie.Create(position, radius, startAngle, endAngle, color);
end;

procedure TDebugDataPie.WriteTo(stream: TStream);
begin
    stream.WriteInt32(4);
    position.WriteTo(stream);
    stream.WriteDouble(radius);
    stream.WriteDouble(startAngle);
    stream.WriteDouble(endAngle);
    color.WriteTo(stream);
end;

function TDebugDataPie.ToString: ansistring;
begin
    result := 'Pie {';
    result += 'position=';
    result += position.ToString;
    result += ', ';  
    result += 'radius=';
    result += FloatToStr(radius);
    result += ', ';  
    result += 'startAngle=';
    result += FloatToStr(startAngle);
    result += ', ';  
    result += 'endAngle=';
    result += FloatToStr(endAngle);
    result += ', ';  
    result += 'color=';
    result += color.ToString;
    result += '}';
end;

constructor TDebugDataArc.Create(position: TVec2; radius: Double; width: Double; startAngle: Double; endAngle: Double; color: TColor);
begin
    self.position := position;
    self.radius := radius;
    self.width := width;
    self.startAngle := startAngle;
    self.endAngle := endAngle;
    self.color := color;
end;

class function TDebugDataArc.ReadFrom(stream: TStream): TDebugDataArc;
var color: TColor;
var endAngle: Double;
var position: TVec2;
var radius: Double;
var startAngle: Double;
var width: Double;
begin
    position := TVec2.ReadFrom(stream);
    radius := stream.ReadDouble;
    width := stream.ReadDouble;
    startAngle := stream.ReadDouble;
    endAngle := stream.ReadDouble;
    color := TColor.ReadFrom(stream);
    result := TDebugDataArc.Create(position, radius, width, startAngle, endAngle, color);
end;

procedure TDebugDataArc.WriteTo(stream: TStream);
begin
    stream.WriteInt32(5);
    position.WriteTo(stream);
    stream.WriteDouble(radius);
    stream.WriteDouble(width);
    stream.WriteDouble(startAngle);
    stream.WriteDouble(endAngle);
    color.WriteTo(stream);
end;

function TDebugDataArc.ToString: ansistring;
begin
    result := 'Arc {';
    result += 'position=';
    result += position.ToString;
    result += ', ';  
    result += 'radius=';
    result += FloatToStr(radius);
    result += ', ';  
    result += 'width=';
    result += FloatToStr(width);
    result += ', ';  
    result += 'startAngle=';
    result += FloatToStr(startAngle);
    result += ', ';  
    result += 'endAngle=';
    result += FloatToStr(endAngle);
    result += ', ';  
    result += 'color=';
    result += color.ToString;
    result += '}';
end;

constructor TDebugDataRect.Create(bottomLeft: TVec2; size: TVec2; color: TColor);
begin
    self.bottomLeft := bottomLeft;
    self.size := size;
    self.color := color;
end;

class function TDebugDataRect.ReadFrom(stream: TStream): TDebugDataRect;
var bottomLeft: TVec2;
var color: TColor;
var size: TVec2;
begin
    bottomLeft := TVec2.ReadFrom(stream);
    size := TVec2.ReadFrom(stream);
    color := TColor.ReadFrom(stream);
    result := TDebugDataRect.Create(bottomLeft, size, color);
end;

procedure TDebugDataRect.WriteTo(stream: TStream);
begin
    stream.WriteInt32(6);
    bottomLeft.WriteTo(stream);
    size.WriteTo(stream);
    color.WriteTo(stream);
end;

function TDebugDataRect.ToString: ansistring;
begin
    result := 'Rect {';
    result += 'bottomLeft=';
    result += bottomLeft.ToString;
    result += ', ';  
    result += 'size=';
    result += size.ToString;
    result += ', ';  
    result += 'color=';
    result += color.ToString;
    result += '}';
end;

constructor TDebugDataPolygon.Create(vertices: TArray<TVec2>; color: TColor);
begin
    self.vertices := vertices;
    self.color := color;
end;

class function TDebugDataPolygon.ReadFrom(stream: TStream): TDebugDataPolygon;
var color: TColor;
var vertices: TArray<TVec2>;
var verticesElement: TVec2;
var verticesIndex: Int32;
begin
    vertices := TArray<TVec2>.Create;
    SetLength(vertices, stream.ReadInt32);
    for verticesIndex := 0 to Length(vertices) - 1 do begin
        verticesElement := TVec2.ReadFrom(stream);
        vertices[verticesIndex] := verticesElement;
    end;
    color := TColor.ReadFrom(stream);
    result := TDebugDataPolygon.Create(vertices, color);
end;

procedure TDebugDataPolygon.WriteTo(stream: TStream);
var verticesElement: TVec2;
begin
    stream.WriteInt32(7);
    stream.WriteInt32(Length(vertices));
    for verticesElement in vertices do begin
        verticesElement.WriteTo(stream);
    end;
    color.WriteTo(stream);
end;

function TDebugDataPolygon.ToString: ansistring;
var verticesElement: TVec2;
var verticesIndex: Int32;
begin
    result := 'Polygon {';
    result += 'vertices=';
    result += '[';
    for verticesIndex := 0 to Length(vertices) - 1 do begin
        if verticesIndex <> 0 then
            result += ', ';
        verticesElement := vertices[verticesIndex];
        result += verticesElement.ToString;;
    end;
    result += ']';
    result += ', ';  
    result += 'color=';
    result += color.ToString;
    result += '}';
end;

constructor TDebugDataGradientPolygon.Create(vertices: TArray<TColoredVertex>);
begin
    self.vertices := vertices;
end;

class function TDebugDataGradientPolygon.ReadFrom(stream: TStream): TDebugDataGradientPolygon;
var vertices: TArray<TColoredVertex>;
var verticesElement: TColoredVertex;
var verticesIndex: Int32;
begin
    vertices := TArray<TColoredVertex>.Create;
    SetLength(vertices, stream.ReadInt32);
    for verticesIndex := 0 to Length(vertices) - 1 do begin
        verticesElement := TColoredVertex.ReadFrom(stream);
        vertices[verticesIndex] := verticesElement;
    end;
    result := TDebugDataGradientPolygon.Create(vertices);
end;

procedure TDebugDataGradientPolygon.WriteTo(stream: TStream);
var verticesElement: TColoredVertex;
begin
    stream.WriteInt32(8);
    stream.WriteInt32(Length(vertices));
    for verticesElement in vertices do begin
        verticesElement.WriteTo(stream);
    end;
end;

function TDebugDataGradientPolygon.ToString: ansistring;
var verticesElement: TColoredVertex;
var verticesIndex: Int32;
begin
    result := 'GradientPolygon {';
    result += 'vertices=';
    result += '[';
    for verticesIndex := 0 to Length(vertices) - 1 do begin
        if verticesIndex <> 0 then
            result += ', ';
        verticesElement := vertices[verticesIndex];
        result += verticesElement.ToString;;
    end;
    result += ']';
    result += '}';
end;

constructor TDebugDataSegment.Create(firstEnd: TVec2; secondEnd: TVec2; width: Double; color: TColor);
begin
    self.firstEnd := firstEnd;
    self.secondEnd := secondEnd;
    self.width := width;
    self.color := color;
end;

class function TDebugDataSegment.ReadFrom(stream: TStream): TDebugDataSegment;
var color: TColor;
var firstEnd: TVec2;
var secondEnd: TVec2;
var width: Double;
begin
    firstEnd := TVec2.ReadFrom(stream);
    secondEnd := TVec2.ReadFrom(stream);
    width := stream.ReadDouble;
    color := TColor.ReadFrom(stream);
    result := TDebugDataSegment.Create(firstEnd, secondEnd, width, color);
end;

procedure TDebugDataSegment.WriteTo(stream: TStream);
begin
    stream.WriteInt32(9);
    firstEnd.WriteTo(stream);
    secondEnd.WriteTo(stream);
    stream.WriteDouble(width);
    color.WriteTo(stream);
end;

function TDebugDataSegment.ToString: ansistring;
begin
    result := 'Segment {';
    result += 'firstEnd=';
    result += firstEnd.ToString;
    result += ', ';  
    result += 'secondEnd=';
    result += secondEnd.ToString;
    result += ', ';  
    result += 'width=';
    result += FloatToStr(width);
    result += ', ';  
    result += 'color=';
    result += color.ToString;
    result += '}';
end;

constructor TDebugDataGradientSegment.Create(firstEnd: TVec2; firstColor: TColor; secondEnd: TVec2; secondColor: TColor; width: Double);
begin
    self.firstEnd := firstEnd;
    self.firstColor := firstColor;
    self.secondEnd := secondEnd;
    self.secondColor := secondColor;
    self.width := width;
end;

class function TDebugDataGradientSegment.ReadFrom(stream: TStream): TDebugDataGradientSegment;
var firstColor: TColor;
var firstEnd: TVec2;
var secondColor: TColor;
var secondEnd: TVec2;
var width: Double;
begin
    firstEnd := TVec2.ReadFrom(stream);
    firstColor := TColor.ReadFrom(stream);
    secondEnd := TVec2.ReadFrom(stream);
    secondColor := TColor.ReadFrom(stream);
    width := stream.ReadDouble;
    result := TDebugDataGradientSegment.Create(firstEnd, firstColor, secondEnd, secondColor, width);
end;

procedure TDebugDataGradientSegment.WriteTo(stream: TStream);
begin
    stream.WriteInt32(10);
    firstEnd.WriteTo(stream);
    firstColor.WriteTo(stream);
    secondEnd.WriteTo(stream);
    secondColor.WriteTo(stream);
    stream.WriteDouble(width);
end;

function TDebugDataGradientSegment.ToString: ansistring;
begin
    result := 'GradientSegment {';
    result += 'firstEnd=';
    result += firstEnd.ToString;
    result += ', ';  
    result += 'firstColor=';
    result += firstColor.ToString;
    result += ', ';  
    result += 'secondEnd=';
    result += secondEnd.ToString;
    result += ', ';  
    result += 'secondColor=';
    result += secondColor.ToString;
    result += ', ';  
    result += 'width=';
    result += FloatToStr(width);
    result += '}';
end;

constructor TDebugDataPolyLine.Create(vertices: TArray<TVec2>; width: Double; color: TColor);
begin
    self.vertices := vertices;
    self.width := width;
    self.color := color;
end;

class function TDebugDataPolyLine.ReadFrom(stream: TStream): TDebugDataPolyLine;
var color: TColor;
var vertices: TArray<TVec2>;
var verticesElement: TVec2;
var verticesIndex: Int32;
var width: Double;
begin
    vertices := TArray<TVec2>.Create;
    SetLength(vertices, stream.ReadInt32);
    for verticesIndex := 0 to Length(vertices) - 1 do begin
        verticesElement := TVec2.ReadFrom(stream);
        vertices[verticesIndex] := verticesElement;
    end;
    width := stream.ReadDouble;
    color := TColor.ReadFrom(stream);
    result := TDebugDataPolyLine.Create(vertices, width, color);
end;

procedure TDebugDataPolyLine.WriteTo(stream: TStream);
var verticesElement: TVec2;
begin
    stream.WriteInt32(11);
    stream.WriteInt32(Length(vertices));
    for verticesElement in vertices do begin
        verticesElement.WriteTo(stream);
    end;
    stream.WriteDouble(width);
    color.WriteTo(stream);
end;

function TDebugDataPolyLine.ToString: ansistring;
var verticesElement: TVec2;
var verticesIndex: Int32;
begin
    result := 'PolyLine {';
    result += 'vertices=';
    result += '[';
    for verticesIndex := 0 to Length(vertices) - 1 do begin
        if verticesIndex <> 0 then
            result += ', ';
        verticesElement := vertices[verticesIndex];
        result += verticesElement.ToString;;
    end;
    result += ']';
    result += ', ';  
    result += 'width=';
    result += FloatToStr(width);
    result += ', ';  
    result += 'color=';
    result += color.ToString;
    result += '}';
end;

constructor TDebugDataGradientPolyLine.Create(vertices: TArray<TColoredVertex>; width: Double);
begin
    self.vertices := vertices;
    self.width := width;
end;

class function TDebugDataGradientPolyLine.ReadFrom(stream: TStream): TDebugDataGradientPolyLine;
var vertices: TArray<TColoredVertex>;
var verticesElement: TColoredVertex;
var verticesIndex: Int32;
var width: Double;
begin
    vertices := TArray<TColoredVertex>.Create;
    SetLength(vertices, stream.ReadInt32);
    for verticesIndex := 0 to Length(vertices) - 1 do begin
        verticesElement := TColoredVertex.ReadFrom(stream);
        vertices[verticesIndex] := verticesElement;
    end;
    width := stream.ReadDouble;
    result := TDebugDataGradientPolyLine.Create(vertices, width);
end;

procedure TDebugDataGradientPolyLine.WriteTo(stream: TStream);
var verticesElement: TColoredVertex;
begin
    stream.WriteInt32(12);
    stream.WriteInt32(Length(vertices));
    for verticesElement in vertices do begin
        verticesElement.WriteTo(stream);
    end;
    stream.WriteDouble(width);
end;

function TDebugDataGradientPolyLine.ToString: ansistring;
var verticesElement: TColoredVertex;
var verticesIndex: Int32;
begin
    result := 'GradientPolyLine {';
    result += 'vertices=';
    result += '[';
    for verticesIndex := 0 to Length(vertices) - 1 do begin
        if verticesIndex <> 0 then
            result += ', ';
        verticesElement := vertices[verticesIndex];
        result += verticesElement.ToString;;
    end;
    result += ']';
    result += ', ';  
    result += 'width=';
    result += FloatToStr(width);
    result += '}';
end;

end.