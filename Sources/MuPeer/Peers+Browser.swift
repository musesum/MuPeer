//  PeersC+Browser.swift
//  created by musesum on 12/8/22.

@preconcurrency import MultipeerConnectivity

extension Peers: MCNearbyServiceBrowserDelegate {

    // Found a nearby advertising peer
    public func browser(_ browser: MCNearbyServiceBrowser,
                        foundPeer peerID: MCPeerID,
                        withDiscoveryInfo info: [String : String]?) {

        let peerName = peerID.displayName
        let shouldInvite = ((myName != peerName) &&
                            (peerState[peerName] == nil ||
                             peerState[peerName] != .connected))

        if shouldInvite {
            logPeer("Inviting \"\(peerName)\"")
            browser.invitePeer(peerID, to: session, withContext: nil, timeout: 30.0)
        } else {
            logPeer("Not inviting \"\(peerName)\"")
        }

        for delegate in self.delegates.values {
            delegate.didChange()
        }
    }

    public func browser(_ browser: MCNearbyServiceBrowser,
                        lostPeer peerID: MCPeerID) {
        let peerName = peerID.displayName
        logPeer("lostPeer: \"\(peerName)\"")
    }

    public func browser(_ browser: MCNearbyServiceBrowser,
                        didNotStartBrowsingForPeers error: Error) {
        logPeer("didNotStartBrowsingForPeers: \(error)")
    }
}
