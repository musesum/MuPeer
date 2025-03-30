import Foundation

public protocol PeersDelegate: AnyObject, Sendable {
    func didChange()
    func received(data: Data, viaStream: Bool)
}
