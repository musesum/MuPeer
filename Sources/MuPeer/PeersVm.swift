import SwiftUI
import MultipeerConnectivity

/// This is the View Model for PeersView

public class PeersVm: @unchecked Sendable, ObservableObject {

    public static let shared = PeersVm()

    var peersTitle = "Bonjour" /// myName and one second counter
    var peersList = "" /// list of connected peers
    private var peers: Peers?
    private var peerCounter = [String: Int]()
    private var peerStreamed = [String: Bool]()
    var count = Int(0)

    public init() {
        Task { @MainActor in
            let name = UIDevice.current.name
            self.peers = Peers(name)
            self.peers?.delegates["PeersVm"] = self
            oneSecondCounter()
        }
    }

    /// create a 1 second counter and send my count to all of my peers
    private func oneSecondCounter() {
        guard let peers else { return }
        let myName = peers.myName
        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in

            guard let self = self else { return }
            self.count += 1
            self.peers?.sendMessage(["peerName": myName, "count": self.count], viaStream: true)
            self.peersTitle = "\(myName): \(self.count)"
        }
    }
}
extension PeersVm: PeersDelegate {
    
    nonisolated public func didChange() {
        guard let peers else { return }
        var peerList = ""
        for (name,state) in peers.peerState {
            
            peerList += "\n \(state.icon()) \(name)"
            
            if let count = peerCounter[name]  {
                peerList += ": \(count)"
            }
            if let streamed = peerStreamed[name] {
                peerList += streamed ? "💧" : "⚡️"
            }
        }
        self.peersList = peerList
    }

    nonisolated public func received(data: Data, viaStream: Bool) {

        guard let message = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : Any]
        else { return }

        // filter for internal 1 second counter
        // other delegates may capture other messages

        if let peerName = message["peerName"] as? String,
           let count = message["count"] as? Int {

            peers?.fixConnectedState(for: peerName)
            peerCounter[peerName] = count
            peerStreamed[peerName] = viaStream
            didChange()
        }
    }
}
