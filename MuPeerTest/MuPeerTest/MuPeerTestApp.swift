//
//  MuPeerTestApp.swift
//  MuPeerTest
//
//  created by musesum on 08/09/23.

import SwiftUI
import MuPeer

@main
struct MuPeerTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    public var peersVm = PeersVm()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            PeersView(peersVm)
        }
        .padding()
    }
}
