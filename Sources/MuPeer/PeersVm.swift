
import SwiftUI

import MultipeerConnectivity

/// This is the View Model for PeersView
class PeersVm: ObservableObject {

    public static let shared = PeersVm()

    /// myName and one second counter
    @Published var peersTitle = "Bonjour"

    /// list of connected peers and their counter
    @Published var peersList = ""

    private var peersController: PeersController
    private var peerCounter = [String: Int]()
    private var peerStreamed = [String: Bool]()

    init() {
        peersController = PeersController.shared
        peersController.peersDelegates.append(self)
        oneSecondCounter()
    }
    deinit {
        peersController.remove(peersDelegate: self)
    }

    /// create a 1 second counter and send my count to all of my peers
    private func oneSecondCounter() {
        var count = Int(0)
        let myName = peersController.myName
        func loopNext() {
            count += 1

            // viaStream: false will use MCSessionDelegate
            // viaStream: true  will use StreamDelegate
            peersController.sendMessage(["peerName": myName, "count": count],
                                        viaStream: true)
            peersTitle = "\(myName): \(count)"
        }
        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true)  {_ in
            loopNext()
        }
    }
}
extension PeersVm: PeersControllerDelegate {

    func didChange() {

        var peerList = ""

        for (name,state) in peersController.peerState {

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


    func received(data: Data, viaStream: Bool) {

        do {
            let message = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String : Any]

            // filter for internal 1 second counter
            // other delegates may capture other messages

            if  let peerName = message["peerName"] as? String,
                let count = message["count"] as? Int {

                peersController.fixConnectedState(for: peerName)

                peerCounter[peerName] = count
                peerStreamed[peerName] = viaStream
                didChange()
            }
        }
        catch {

        }
    }

}
