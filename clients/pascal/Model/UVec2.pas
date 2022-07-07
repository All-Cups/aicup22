unit UVec2;

{$mode delphi}{$H+}

interface

uses
    Stream,
    SysUtils;

type
    // 2 dimensional vector.
    TVec2 = class
        // `x` coordinate of the vector
        x: Double;
        // `y` coordinate of the vector
        y: Double;
        constructor Create(x: Double; y: Double);
        // Read Vec2 from input stream
        class function ReadFrom(stream: TStream): TVec2; static;
        // Write Vec2 to output stream
        procedure WriteTo(stream: TStream);
        function ToString: ansistring; override;
    end;

implementation

constructor TVec2.Create(x: Double; y: Double);
begin
    self.x := x;
    self.y := y;
end;

class function TVec2.ReadFrom(stream: TStream): TVec2;
var x: Double;
var y: Double;
begin
    x := stream.ReadDouble;
    y := stream.ReadDouble;
    result := TVec2.Create(x, y);
end;

procedure TVec2.WriteTo(stream: TStream);
begin
    stream.WriteDouble(x);
    stream.WriteDouble(y);
end;

function TVec2.ToString: ansistring;
begin
    result := 'Vec2 {';
    result += 'x=';
    result += FloatToStr(x);
    result += ', ';  
    result += 'y=';
    result += FloatToStr(y);
    result += '}';
end;

end.