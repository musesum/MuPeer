//  Created by musesum on 12/4/22.

import SwiftUI

public struct PeersView: View {
    @StateObject public var peersVm: PeersVm

    public init(_ peersVm: PeersVm) {
        _peersVm = StateObject(wrappedValue: peersVm)
    }

    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "globe")
                    .imageScale(.medium)
                    .foregroundColor(.white)
                Text(peersVm.peersTitle)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 1.0)
            }
            Text(peersVm.peersList)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 1.0)
        }
        .padding()
    }
}
