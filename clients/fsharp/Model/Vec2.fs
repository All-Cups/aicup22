#nowarn "0058"

namespace AiCup22
namespace AiCup22.Model

open AiCup22

/// 2 dimensional vector.
type Vec2 = {
    /// `x` coordinate of the vector
    X: double;
    /// `y` coordinate of the vector
    Y: double;
} with

    /// Write Vec2 to writer
    member this.writeTo(writer: System.IO.BinaryWriter) =
        writer.Write this.X
        writer.Write this.Y
        ()

    /// Read Vec2 from reader
    static member readFrom(reader: System.IO.BinaryReader) = {
        X = reader.ReadDouble()
        Y = reader.ReadDouble()
    }