
Unit BufferedStream;

{$mode delphi}{$H+}

Interface

Uses Stream, SysUtils;

Type 
  TByteArray = Array Of Byte;
  TBufferedStream = Class (TStream)
    Private 
      inner: TStream;
      readBuffer: TByteArray;
      readBufferPos: Integer;
      writeBuffer: TByteArray;
      writeBufferPos: Integer;
    Public 
      Constructor Create(inner: TStream);

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

constructor TBufferedStream.Create(inner: TStream);
Begin
  self.inner := inner;
  readBuffer := TByteArray.Create;
  readBufferPos := 0;
  writeBuffer := TByteArray.Create;
  SetLength(writeBuffer, 102400);
  writeBufferPos := 0;
End;

Destructor TBufferedStream.Destroy;
Begin
  Flush;
  inner.Free;
  inherited;
End;

Function TBufferedStream.ReadBytesAtMost(byteCount: Integer): TByteArray;
Begin
  If readBufferPos = Length(readBuffer) Then
    Begin
      readBuffer := inner.ReadBytesAtMost(102400);
      readBufferPos := 0;
    End;
  result := Copy(readBuffer, readBufferPos, byteCount);
  readBufferPos := readBufferPos + Length(result);
End;

Procedure TBufferedStream.Write(bytes: TByteArray);

Var 
  i: Integer;
Begin
  For i := 0 To High(bytes) Do
    Begin
      If writeBufferPos = length(writeBuffer) Then
        Flush;
      writeBuffer[writeBufferPos] := bytes[i];
      writeBufferPos := writeBufferPos + 1;
    End;
End;

Procedure TBufferedStream.Flush;
Begin
  inner.Write(Copy(writeBuffer, 0, writeBufferPos));
  inner.Flush;
  writeBufferPos := 0;
End;

End.
