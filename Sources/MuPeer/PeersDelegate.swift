import Foundation


public protocol PeersDelegate: AnyObject, Sendable {
    func didChange()
    func received(data: Data, viaStream: Bool) -> Bool
}

//@MainActor
//class Delegator {
//    private var delegates: [PeersDelegate] = []
//
//    func add(_ delegate: any PeersDelegate) {
//        delegates.append(delegate)
//    }
//    func remove(_ delegate: any PeersDelegate) {
//        delegates.removeAll { $0 === delegate }
//    }
//    func notifyDidChange() {
//        //Task { @MainActor in
//            for delegate in delegates {
//                delegate.didChange()
//            }
//        //}
//    }
//    func notifyReceived(_ data: Data,
//                        viaStream: Bool) {
//        //Task { @MainActor in
//            for delegate in delegates {
//                _ = delegate.received(data: data, viaStream: viaStream)
//            }
//        //}
//    }
//}
