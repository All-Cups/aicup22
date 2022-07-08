unit UServerMessage;

{$mode delphi}{$H+}

interface

uses
    Stream,
    SysUtils,
    UConstants in 'Model/UConstants.pas',
    UGame in 'Model/UGame.pas';

type
    // Message sent from server
    TServerMessage = class
        // Write ServerMessage to output stream
        procedure WriteTo(stream: TStream); virtual; abstract;
        // Read ServerMessage from input stream
        class function ReadFrom(stream: TStream): TServerMessage; static;
    end;

type
    // Update constants
    TServerMessageUpdateConstants = class (TServerMessage)
        // New constants
        constants: TConstants;
        constructor Create(constants: TConstants);
        // Read ServerMessageUpdateConstants from input stream
        class function ReadFrom(stream: TStream): TServerMessageUpdateConstants; static;
        // Write ServerMessageUpdateConstants to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Get order for next tick
    TServerMessageGetOrder = class (TServerMessage)
        // Player's view
        playerView: TGame;
        // Whether app is running with debug interface available
        debugAvailable: Boolean;
        constructor Create(playerView: TGame; debugAvailable: Boolean);
        // Read ServerMessageGetOrder from input stream
        class function ReadFrom(stream: TStream): TServerMessageGetOrder; static;
        // Write ServerMessageGetOrder to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Signifies end of the game
    TServerMessageFinish = class (TServerMessage)
        constructor Create();
        // Read ServerMessageFinish from input stream
        class function ReadFrom(stream: TStream): TServerMessageFinish; static;
        // Write ServerMessageFinish to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

type
    // Debug update
    TServerMessageDebugUpdate = class (TServerMessage)
        // Displayed tick
        displayedTick: Int32;
        constructor Create(displayedTick: Int32);
        // Read ServerMessageDebugUpdate from input stream
        class function ReadFrom(stream: TStream): TServerMessageDebugUpdate; static;
        // Write ServerMessageDebugUpdate to output stream
        procedure WriteTo(stream: TStream); override;
        function ToString: ansistring; override;
    end;

implementation

class function TServerMessage.ReadFrom(stream: TStream): TServerMessage;
var tag: Int32;
begin
    tag := stream.ReadInt32;
    case tag of
        0: result := TServerMessageUpdateConstants.ReadFrom(stream);
        1: result := TServerMessageGetOrder.ReadFrom(stream);
        2: result := TServerMessageFinish.ReadFrom(stream);
        3: result := TServerMessageDebugUpdate.ReadFrom(stream);
        else raise Exception.Create('Unexpected tag value');
    end;
end;

constructor TServerMessageUpdateConstants.Create(constants: TConstants);
begin
    self.constants := constants;
end;

class function TServerMessageUpdateConstants.ReadFrom(stream: TStream): TServerMessageUpdateConstants;
var constants: TConstants;
begin
    constants := TConstants.ReadFrom(stream);
    result := TServerMessageUpdateConstants.Create(constants);
end;

procedure TServerMessageUpdateConstants.WriteTo(stream: TStream);
begin
    stream.WriteInt32(0);
    constants.WriteTo(stream);
end;

function TServerMessageUpdateConstants.ToString: ansistring;
begin
    result := 'UpdateConstants {';
    result += 'constants=';
    result += constants.ToString;
    result += '}';
end;

constructor TServerMessageGetOrder.Create(playerView: TGame; debugAvailable: Boolean);
begin
    self.playerView := playerView;
    self.debugAvailable := debugAvailable;
end;

class function TServerMessageGetOrder.ReadFrom(stream: TStream): TServerMessageGetOrder;
var debugAvailable: Boolean;
var playerView: TGame;
begin
    playerView := TGame.ReadFrom(stream);
    debugAvailable := stream.ReadBoolean;
    result := TServerMessageGetOrder.Create(playerView, debugAvailable);
end;

procedure TServerMessageGetOrder.WriteTo(stream: TStream);
begin
    stream.WriteInt32(1);
    playerView.WriteTo(stream);
    stream.WriteBoolean(debugAvailable);
end;

function TServerMessageGetOrder.ToString: ansistring;
begin
    result := 'GetOrder {';
    result += 'playerView=';
    result += playerView.ToString;
    result += ', ';  
    result += 'debugAvailable=';
    result += BoolToStr(debugAvailable);
    result += '}';
end;

constructor TServerMessageFinish.Create();
begin
end;

class function TServerMessageFinish.ReadFrom(stream: TStream): TServerMessageFinish;
begin
    result := TServerMessageFinish.Create();
end;

procedure TServerMessageFinish.WriteTo(stream: TStream);
begin
    stream.WriteInt32(2);
end;

function TServerMessageFinish.ToString: ansistring;
begin
    result := 'Finish {';
    result += '}';
end;

constructor TServerMessageDebugUpdate.Create(displayedTick: Int32);
begin
    self.displayedTick := displayedTick;
end;

class function TServerMessageDebugUpdate.ReadFrom(stream: TStream): TServerMessageDebugUpdate;
var displayedTick: Int32;
begin
    displayedTick := stream.ReadInt32;
    result := TServerMessageDebugUpdate.Create(displayedTick);
end;

procedure TServerMessageDebugUpdate.WriteTo(stream: TStream);
begin
    stream.WriteInt32(3);
    stream.WriteInt32(displayedTick);
end;

function TServerMessageDebugUpdate.ToString: ansistring;
begin
    result := 'DebugUpdate {';
    result += 'displayedTick=';
    result += IntToStr(displayedTick);
    result += '}';
end;

end.