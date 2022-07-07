import Foundation

public typealias Byte = Int8

extension String: Error {}

private func toByteArray<T>(_ value: T) -> [Byte] {
    var value = value
    return withUnsafeBytes(of: &value) { $0.map{ Byte(bitPattern:$0) } }
}

private func fromByteArray<T>(_ value: [Byte]) -> T {
    return value.withUnsafeBytes {
        $0.baseAddress!.load(as: T.self)
    }
}

protocol InputStream {
    func readBytesAtMost(_ byteCount: Int) -> [Byte]
}

extension InputStream {
    func readBytes(_ byteCount: Int) -> [Byte] {
        var result: [Byte] = []
        while result.count < byteCount {
            result.append(contentsOf: readBytesAtMost(byteCount - result.count))
        }
        return result
    }
    func readBool() -> Bool {
        switch readBytes(1)[0] {
            case 0:
                return false
            case 1:
                return true
            default:
                fatalError("Bool should be 0 or 1")
        }
    }
    func readInt32() -> Int32 {
        return Int32(littleEndian: fromByteArray(readBytes(MemoryLayout<Int32>.size)))
    }
    func readInt64() -> Int64 {
        return Int64(littleEndian: fromByteArray(readBytes(MemoryLayout<Int64>.size)))
    }
    func readFloat() -> Float {
        return fromByteArray(toByteArray(readInt32())) as Float
    }
    func readDouble() -> Double {
        return fromByteArray(toByteArray(readInt64())) as Double
    }
    func readString() -> String {
        let size = Int(readInt32())
        return String(bytes: readBytes(size).map{ UInt8(bitPattern: $0) }, encoding: String.Encoding.utf8)!
    }
}

protocol OutputStream {
    func writeBytes(_ data: [Byte])
    func flush()
}

extension OutputStream {
    func writeBool(_ value: Bool) {
        writeBytes([value ? 1 : 0])
    }
    func writeInt32(_ value: Int32) {
        writeBytes(toByteArray(value.littleEndian))
    }
    func writeInt64(_ value: Int64) {
        writeBytes(toByteArray(value.littleEndian))
    }
    func writeFloat(_ value: Float) {
        writeInt32(fromByteArray(toByteArray(value)) as Int32)
    }
    func writeDouble(_ value: Double) {
        writeInt64(fromByteArray(toByteArray(value)) as Int64)
    }
    func writeString(_ value: String) {
        let data = value.utf8.map{ Byte(bitPattern: $0) }
        writeInt32(Int32(data.count))
        writeBytes(data)
    }
}