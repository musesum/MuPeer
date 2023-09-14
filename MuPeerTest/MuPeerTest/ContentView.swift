//  Created by warren on 8/9/23.

import SwiftUI
import MuPeer

struct ContentView: View {
    public var peersVm = PeersVm.shared
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
