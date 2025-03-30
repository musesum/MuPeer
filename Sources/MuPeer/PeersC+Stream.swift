//
//  PeersC+Stream.swift
//  MultiPeer
//
//  created by musesum on 12/9/22.

import MultipeerConnectivity

extension PeersC: StreamDelegate {

    public func stream(_ stream: Stream,
                       handle eventCode: Stream.Event) {

        if let stream = stream as? InputStream,
           stream.hasBytesAvailable {

            let data = Data(reading: stream)
            self.logPeer("💧input bytes:\(data.bytes.count)")
            for delegate in delegates.values {
                delegate.received(data: data,  viaStream: true)
            }
        }
    }
}
