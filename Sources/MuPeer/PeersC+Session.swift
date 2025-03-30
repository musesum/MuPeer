//  created by musesum on 12/8/22.

import MultipeerConnectivity

extension PeersC: MCSessionDelegate {

    public func session(_ session: MCSession,
                        peer peerID: MCPeerID,
                        didChange state: MCSessionState) {

        let peerName = peerID.displayName
        logPeer("session \"\(peerName)\" \(state.description())")
        peerState[peerName] = state

        if state == .connected {
            hasPeers = true
        } else {
            // test if no longer connected
            for state in peerState.values {
                if state == .connected {
                    hasPeers = true
                    break
                }
            }
        }
        for delegate in self.delegates.values {
            delegate.didChange()
        }
    }

    /// receive message via session
    public func session(_ session: MCSession,
                        didReceive data: Data,
                        fromPeer peerID: MCPeerID) {

        let peerName = peerID.displayName
        logPeer("⚡️didReceive: \"\(peerName)\"")
        fixConnectedState(for: peerName)
        for delegate in self.delegates.values {
            delegate.received(data: data, viaStream: false)
        }
    }

    /// setup stream for messages
    public func session(_ session: MCSession,
                        didReceive inputStream: InputStream,
                        withName streamName: String,
                        fromPeer: MCPeerID) {

        inputStream.delegate = self
        inputStream.schedule(in: .main, forMode: .common)
        inputStream.open()
    }

    // files not implemented
    public func session(_ session: MCSession, didStartReceivingResourceWithName _: String, fromPeer: MCPeerID, with _: Progress) {}
    public func session(_ session: MCSession, didFinishReceivingResourceWithName _: String, fromPeer: MCPeerID, at _: URL?, withError _: Error?) {}
}
