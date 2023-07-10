import MultipeerConnectivity

extension MCSessionState {
    func description() -> String {
        switch self {
            case .connecting:   return "connecting"
            case .connected:    return "connected"
            case .notConnected: return "notConnected"
            @unknown default:   return "unknown"
        }
    }
    func icon() -> String {
        switch self {
            case .connecting:   return "❓"
            case .connected:    return "🤝"
            case .notConnected: return "🚫"
            @unknown default:   return "‼️"
        }
    }
}

extension Data {
    var bytes: [UInt8] {
        return [UInt8](self)
    }
}

extension Array where Element == UInt8 {
    var data: Data {
        return Data(self)
    }
}
extension Array where Element == UInt8 {
    public func toAsciiString() -> String? {
        String(bytes: self, encoding: .ascii)
    }
}

extension Array where Element == UInt8 {
    public func toString() -> String? {
        String(bytes: self, encoding: .utf8)
    }
}


extension Data {
    /**
     Create a new Data object from inputStream
     - Parameter reading: The input stream to read data from.
     - Note: closes input stream
     */
    init(reading input: InputStream) {
        self.init()
        input.open()
        let bufferSize = 1024
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: bufferSize)
        while input.hasBytesAvailable {
            let read = input.read(buffer, maxLength: bufferSize)
            self.append(buffer, count: read)
        }
        buffer.deallocate()
        input.close()
    }

    /**
     Consumes the specified input stream for up to `byteCount` bytes,
     creating a new Data object with its content.
     - Parameter reading: The input stream to read data from.
     - Parameter byteCount: The maximum number of bytes to read from `reading`.
     - Note: Does _not_ close the specified stream.
     */
    init(reading input: InputStream, for byteCount: Int) {
        self.init()
        input.open()

        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: byteCount)
        let read = input.read(buffer, maxLength: byteCount)
        self.append(buffer, count: read)
        buffer.deallocate()
    }
}
