unit UColor;

{$mode delphi}{$H+}

interface

uses
    Stream,
    SysUtils;

type
    // RGBA Color
    TColor = class
        // Red component
        r: Double;
        // Green component
        g: Double;
        // Blue component
        b: Double;
        // Alpha (opacity) component
        a: Double;
        constructor Create(r: Double; g: Double; b: Double; a: Double);
        // Read Color from input stream
        class function ReadFrom(stream: TStream): TColor; static;
        // Write Color to output stream
        procedure WriteTo(stream: TStream);
        function ToString: ansistring; override;
    end;

implementation

constructor TColor.Create(r: Double; g: Double; b: Double; a: Double);
begin
    self.r := r;
    self.g := g;
    self.b := b;
    self.a := a;
end;

class function TColor.ReadFrom(stream: TStream): TColor;
var a: Double;
var b: Double;
var g: Double;
var r: Double;
begin
    r := stream.ReadDouble;
    g := stream.ReadDouble;
    b := stream.ReadDouble;
    a := stream.ReadDouble;
    result := TColor.Create(r, g, b, a);
end;

procedure TColor.WriteTo(stream: TStream);
begin
    stream.WriteDouble(r);
    stream.WriteDouble(g);
    stream.WriteDouble(b);
    stream.WriteDouble(a);
end;

function TColor.ToString: ansistring;
begin
    result := 'Color {';
    result += 'r=';
    result += FloatToStr(r);
    result += ', ';  
    result += 'g=';
    result += FloatToStr(g);
    result += ', ';  
    result += 'b=';
    result += FloatToStr(b);
    result += ', ';  
    result += 'a=';
    result += FloatToStr(a);
    result += '}';
end;

end.