//
//  PeersC+Stream.swift
//  MultiPeer
//
//  Created by warren on 12/9/22.

import MultipeerConnectivity

extension PeersController: StreamDelegate {

    public func stream(_ stream: Stream,
                       handle eventCode: Stream.Event) {

        if let inputStream = stream as? InputStream,
           inputStream.hasBytesAvailable {

            let data = Data(reading: inputStream)

            self.logPeer("💧input bytes:\(data.bytes.count)")
            DispatchQueue.main.async {
                for delegate in self.peersDelegates {
                    delegate.received(data: data, viaStream: true)
                }
            }
        }
    }
}
