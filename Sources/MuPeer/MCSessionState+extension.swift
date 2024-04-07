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
            case .connected:    return "⚡️"
            case .notConnected: return "🚫"
            @unknown default:   return "‼️"
        }
    }
}
