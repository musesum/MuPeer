//  created by musesum on 12/8/22.

import MultipeerConnectivity

extension Peers: MCNearbyServiceAdvertiserDelegate {
    
    public func advertiser(_ advertiser: MCNearbyServiceAdvertiser,
                                       didReceiveInvitationFromPeer peerID: MCPeerID,
                                       withContext _: Data?,
                                       invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        print("didReceiveInvitationFromPeer:  \"\(peerID.displayName)\"")
        invitationHandler(true, session)
    }
    
    public func advertiser(_ advertiser: MCNearbyServiceAdvertiser,
                                       didNotStartAdvertisingPeer error: Error) {
        print("didNotStartAdvertisingPeer \(error)")
    }
}
