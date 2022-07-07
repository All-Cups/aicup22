unit UDebugCommand;

{$mode delphi}{$H+}

interface

uses
    Stream,
    SysUtils,
    UDebugData in 'Debugging/UDebugData.pas';

type
    // Debug commands that can be sent while debugging with the app
    TDebugCommand = class
        // Write DebugCommand to output stream
        procedure WriteTo(stream: TStream); virtual; abstract;
        // Read DebugCommand from input stream
        class function ReadFrom(stream: TStream): TDebugCommand; static;
    end;

type
    // Add debug data to current tick
    TDebugCommandAdd = class (TDebugCommand)
        // Data to add
        debugData: TDebugData;
        constructor Create(debugData: TDebugData);
        // Read DebugCommandAdd from input stream
        class function ReadFrom(stream: TStream): TDebugCommandAdd; static;
        // Write DebugCommandAdd to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Clear current tick's debug data
    TDebugCommandClear = class (TDebugCommand)
        constructor Create();
        // Read DebugCommandClear from input stream
        class function ReadFrom(stream: TStream): TDebugCommandClear; static;
        // Write DebugCommandClear to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Enable/disable auto performing of commands
    TDebugCommandSetAutoFlush = class (TDebugCommand)
        // Enable/disable autoflush
        enable: Boolean;
        constructor Create(enable: Boolean);
        // Read DebugCommandSetAutoFlush from input stream
        class function ReadFrom(stream: TStream): TDebugCommandSetAutoFlush; static;
        // Write DebugCommandSetAutoFlush to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Perform all previously sent commands
    TDebugCommandFlush = class (TDebugCommand)
        constructor Create();
        // Read DebugCommandFlush from input stream
        class function ReadFrom(stream: TStream): TDebugCommandFlush; static;
        // Write DebugCommandFlush to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

implementation

class function TDebugCommand.ReadFrom(stream: TStream): TDebugCommand;
var tag: Int32;
begin
    tag := stream.ReadInt32;
    case tag of
        0: result := TDebugCommandAdd.ReadFrom(stream);
        1: result := TDebugCommandClear.ReadFrom(stream);
        2: result := TDebugCommandSetAutoFlush.ReadFrom(stream);
        3: result := TDebugCommandFlush.ReadFrom(stream);
        else raise Exception.Create('Unexpected tag value');
    end;
end;

constructor TDebugCommandAdd.Create(debugData: TDebugData);
begin
    self.debugData := debugData;
end;

class function TDebugCommandAdd.ReadFrom(stream: TStream): TDebugCommandAdd;
var debugData: TDebugData;
begin
    debugData := TDebugData.ReadFrom(stream);
    result := TDebugCommandAdd.Create(debugData);
end;

procedure TDebugCommandAdd.WriteTo(stream: TStream);
begin
    stream.WriteInt32(0);
    debugData.WriteTo(stream);
end;

function TDebugCommandAdd.ToString: ansistring;
begin
    result := 'Add {';
    result += 'debugData=';
    result += debugData.ToString;
    result += '}';
end;

constructor TDebugCommandClear.Create();
begin
end;

class function TDebugCommandClear.ReadFrom(stream: TStream): TDebugCommandClear;
begin
    result := TDebugCommandClear.Create();
end;

procedure TDebugCommandClear.WriteTo(stream: TStream);
begin
    stream.WriteInt32(1);
end;

function TDebugCommandClear.ToString: ansistring;
begin
    result := 'Clear {';
    result += '}';
end;

constructor TDebugCommandSetAutoFlush.Create(enable: Boolean);
begin
    self.enable := enable;
end;

class function TDebugCommandSetAutoFlush.ReadFrom(stream: TStream): TDebugCommandSetAutoFlush;
var enable: Boolean;
begin
    enable := stream.ReadBoolean;
    result := TDebugCommandSetAutoFlush.Create(enable);
end;

procedure TDebugCommandSetAutoFlush.WriteTo(stream: TStream);
begin
    stream.WriteInt32(2);
    stream.WriteBoolean(enable);
end;

function TDebugCommandSetAutoFlush.ToString: ansistring;
begin
    result := 'SetAutoFlush {';
    result += 'enable=';
    result += BoolToStr(enable);
    result += '}';
end;

constructor TDebugCommandFlush.Create();
begin
end;

class function TDebugCommandFlush.ReadFrom(stream: TStream): TDebugCommandFlush;
begin
    result := TDebugCommandFlush.Create();
end;

procedure TDebugCommandFlush.WriteTo(stream: TStream);
begin
    stream.WriteInt32(3);
end;

function TDebugCommandFlush.ToString: ansistring;
begin
    result := 'Flush {';
    result += '}';
end;

end.