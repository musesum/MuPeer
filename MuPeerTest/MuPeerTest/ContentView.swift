//  created by musesum on 8/9/23.

import SwiftUI

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
