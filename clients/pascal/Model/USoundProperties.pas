unit USoundProperties;

{$mode delphi}{$H+}

interface

uses
    Stream,
    SysUtils;

type
    // Sound properties
    TSoundProperties = class
        // Name
        name: String;
        // Distance from which the sound can be heard
        distance: Double;
        // Offset modifier
        offset: Double;
        constructor Create(name: String; distance: Double; offset: Double);
        // Read SoundProperties from input stream
        class function ReadFrom(stream: TStream): TSoundProperties; static;
        // Write SoundProperties to output stream
        procedure WriteTo(stream: TStream);
        function ToString: ansistring; override;
    end;

implementation

constructor TSoundProperties.Create(name: String; distance: Double; offset: Double);
begin
    self.name := name;
    self.distance := distance;
    self.offset := offset;
end;

class function TSoundProperties.ReadFrom(stream: TStream): TSoundProperties;
var distance: Double;
var name: String;
var offset: Double;
begin
    name := stream.ReadString;
    distance := stream.ReadDouble;
    offset := stream.ReadDouble;
    result := TSoundProperties.Create(name, distance, offset);
end;

procedure TSoundProperties.WriteTo(stream: TStream);
begin
    stream.WriteString(name);
    stream.WriteDouble(distance);
    stream.WriteDouble(offset);
end;

function TSoundProperties.ToString: ansistring;
begin
    result := 'SoundProperties {';
    result += 'name=';
    result += '''';
    result += name;
    result += '''';
    result += ', ';  
    result += 'distance=';
    result += FloatToStr(distance);
    result += ', ';  
    result += 'offset=';
    result += FloatToStr(offset);
    result += '}';
end;

end.