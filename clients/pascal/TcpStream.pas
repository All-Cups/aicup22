
Unit TcpStream;

{$mode delphi}{$H+}

Interface

{$IFDEF WINDOWS}

Uses Stream, Sockets, WinSock, SysUtils;

{$ELSE}

Uses Stream, Sockets, NetDB, SysUtils;

{$ENDIF}

Type 
  TByteArray = Array Of Byte;
  TTcpStream = Class (TStream)
    Private 
      sock: LongInt;
    Public 
      Constructor Create(host: String; port: Word);

      Destructor Destroy;
      override;

      Function ReadBytesAtMost(byteCount: Integer): TByteArray;
      override;

      Procedure Write(bytes: TByteArray);
      override;

      Procedure Flush;
      override;
  End;

Implementation

constructor TTcpStream.Create(host: String; port: Word);

Var 
  {$IFDEF WINDOWS}
  wsaData: TWSAData;
  hostEnt: PHostEnt;
  i: Integer;
  {$ELSE}
  hostEntry: THostEntry;
  {$ENDIF}
  addr: TInetSockAddr;
Begin
  addr.sin_family := AF_INET;
  {$IFDEF WINDOWS}
  If WSAStartup($0101, wsaData) <> 0 Then
    raise Exception.Create('Failed to initialize sockets');
  hostEnt := GetHostByName(PChar(host));
  If Not Assigned(hostEnt) Then
    raise Exception.Create('Failed to get host by name');
  For i := 0 To 3 Do
    addr.sin_addr.s_bytes[i + 1] := Byte(hostEnt^.h_addr_list[0][i]);
  {$ELSE}
  addr.sin_addr.s_addr := htonl(StrToHostAddr(host).s_addr);
  If addr.sin_addr.s_addr = 0 Then
    Begin
      If GetHostByName(host, hostEntry) Then
        Begin
          addr.sin_addr.s_addr := htonl(addr.sin_addr.s_addr);
        End
      Else
        Begin
          If Not ResolveHostByName(host, hostEntry) Then
            raise Exception.Create('Failed to resolve host');
        End;
      addr.sin_addr := hostEntry.Addr;
    End;
  {$ENDIF}
  sock := fpsocket(AF_INET, SOCK_STREAM, 0);
  If sock = -1 Then
    raise Exception.Create('Unable to create socket.');
  addr.sin_port := htons(port);
  If fpconnect(sock, @addr, sizeof(addr)) <> 0 Then
    raise Exception.Create('Unable to connect');
End;

Function TTcpStream.ReadBytesAtMost(byteCount: Integer): TByteArray;

Var 
  actualByteCount: Integer;
Begin
  result := TByteArray.Create;
  SetLength(result, byteCount);
  actualByteCount := fprecv(sock, result, byteCount, 0);
  If actualByteCount = -1 Then
    raise Exception.Create('Failed to read from socket');
  SetLength(result, actualByteCount);
End;

Procedure TTcpStream.Write(bytes: TByteArray);
Begin
  If fpsend(sock, bytes, Length(bytes), 0) <> Length(bytes) Then
    raise Exception.Create('Failed to send data to socket');
End;

Procedure TTcpStream.Flush;
Begin
End;

destructor TTcpStream.Destroy;
Begin
  inherited;
End;

End.
